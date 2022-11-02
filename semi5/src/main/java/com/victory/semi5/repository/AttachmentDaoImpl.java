package com.victory.semi5.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.ImageDto;

@Repository
public class AttachmentDaoImpl implements AttachmentDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private RowMapper<ImageDto> mapper = (rs, idx) -> {
		return ImageDto.builder()
					.fileNumber(rs.getInt("file_number"))
					.fileName(rs.getNString("file_name"))
					.fileType(rs.getString("file_type"))
					.fileSize(rs.getLong("file_size"))
					.fileTime(rs.getDate("file_time"))
				.build();
	};
	private ResultSetExtractor<ImageDto> extractor = (rs) -> {
		if(rs.next()) {
			return ImageDto.builder()
					.fileNumber(rs.getInt("file_number"))
					.fileName(rs.getNString("file_name"))
					.fileType(rs.getString("file_type"))
					.fileSize(rs.getLong("file_size"))
					.fileTime(rs.getDate("file_time"))
				.build();
		}
		else {
			return null;
		}
	};	
	
	@Override	//번호생성
	public int sequence() {
		String sql = "select image_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	@Override	//insert
	public void insert(ImageDto imageDto) {
		String sql = "insert into image("
				+ "file_number, file_name, file_type, file_size"
				+ ") values(?, ?, ?, ?)";
		Object[] param = {
			imageDto.getFileNumber(), 
			imageDto.getFileName(),
			imageDto.getFileType(),
			imageDto.getFileSize()
		};
		jdbcTemplate.update(sql, param);
	}
	@Override
	public List<ImageDto> selectList() {
		String sql = "select * from image";
		return jdbcTemplate.query(sql, mapper);
	}
	@Override
	public List<ImageDto> selectList(int fileNumber) {
		String sql = "select * "
				+ "from image where file_number = ?";
		Object[] param = {fileNumber};
		return jdbcTemplate.query(sql, mapper, param);
	}
	@Override
	public ImageDto selectOne(int fileNumber) {
		String sql = "select * "
				+ "from image where file_number = ?";
		Object[] param = {fileNumber};
		return jdbcTemplate.query(sql, extractor, param);
	}
	@Override
	public boolean delete(int fileNumber) {
		String sql = "delete image where file_number = ?";
		Object[] param = {fileNumber};
		return jdbcTemplate.update(sql, param) >0;
	}
	

//	지점 이미지
	@Override
	public void addCinemaImage(String cinemaPorin, int fileNumber) {
		String sql = "insert into cinema_image ("
				+ "cinema_porin, file_number) values(?, ?)";
		Object[] param = {cinemaPorin, fileNumber};
		jdbcTemplate.update(sql, param);
	}
	@Override
	public List<ImageDto> selectCinemaImageList(String cinemaPorin) {
		String sql = "select * from cinema_image_view "
					+ "where cinema_porin= ? order by file_time asc";
		Object[] param = {cinemaPorin};
		return jdbcTemplate.query(sql, mapper, param);
	}

	
//	영화 포스터
	@Override
	public void addPoster(int movieNumber, int fileNumber) {
		String sql = "insert into poster ("
				+ "movie_number, file_number) values(?, ?)";
		Object[] param = {movieNumber, fileNumber};
		jdbcTemplate.update(sql, param);
	}
	@Override
	public List<ImageDto> selectPosterList(int movieNumber) {
		String sql = "select * from poster_image_view "
					+ "where movie_number= ? order by file_time asc";
		Object[] param = {movieNumber};
		return jdbcTemplate.query(sql, mapper, param);
	}
	//무비차트 조회용
	@Override
	public List<ImageDto> selectPosterList() {
		String sql = "select * from poster_image_view "
				+ "order by movie_number asc";
		return jdbcTemplate.query(sql, mapper);
	}
	//home 조회용
	@Override
	public List<ImageDto> selectPosterList3() {
		String sql = "SELECT *\r\n"
				+ " FROM (\r\n"
				+ "        SELECT *\r\n"
				+ "          FROM poster_image_view\r\n"
				+ "         ORDER BY movie_number asc\r\n"
				+ "      )\r\n"
				+ "WHERE ROWNUM <= 3";
		return jdbcTemplate.query(sql, mapper);
	}

//	@Override
//	public List<ImageDto> selectPosterList(String keyword) {
//		String sql="select * from movie "
//				+"where opening_date <= to_date(?, 'yyyy-mm-dd hh24:mi') "
//				+"and screening_end >= to_date(?, 'yyyy-mm-dd hh24:mi') "
//				+"order by opening_date asc";
//		Object[] param= {keyword, keyword};
//		return jdbcTemplate.query(sql, mapper,param);
//	}

	
//	회원 프로필
	@Override
	public void addProfileImage(String userId, int fileNumber) {
		String sql = "insert into profile_image ("
				+ "user_id, file_number) values(?, ?)";
		Object[] param = {userId, fileNumber};
		jdbcTemplate.update(sql, param);
	}
	@Override
	public List<ImageDto> selectProfileImageList(String userId) {
		String sql = "select * from profile_image_view "
					+ "where user_id= ? order by file_time asc";
		Object[] param = {userId};
		return jdbcTemplate.query(sql, mapper, param);
	}
	@Override
	public List<ImageDto> fileNumber(int movieNumber) {
		String sql = "select file_number from poster where movie_number=?";
		Object[] param = {movieNumber};
		return jdbcTemplate.query(sql, mapper, param);
	}

}
