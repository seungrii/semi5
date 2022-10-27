package com.victory.semi5.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.CinemaDto;
import com.victory.semi5.entity.ImageDto;
import com.victory.semi5.vo.CinemaImageVO;

@Repository
public class ImageDaoImpl implements ImageDao{
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
	
	@Override
	public int sequence() {
		String sql = "select image_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	@Override
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


//	@Override
//	public List<ImageDto> selectList() {
//		return null;
//	}
//	@Override
//	public ImageDto selectOne(int imageNo) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	@Override
//	public boolean delete(int imageNo) {
//		// TODO Auto-generated method stub
//		return false;
//	}
	

	@Override
	public void addCinemaImage(CinemaDto cinemaDto, int imageNumber) {
		String sql = "insert into cinema_image ("
				+ "cinema_porin, file_number) vlues(?, ?)";
		Object[] param = {
			cinemaDto.getCinemaPorin(), imageNumber
		};
		
	}
//	@Override
//	public List<AttachmentDto> selectBoardAttachmentList(int boardNo) {
//		String sql = "select * from board_attachment_view "
//						+ "where board_no = ?";
//		Object[] param = {boardNo};
//		return jdbcTemplate.query(sql, mapper, param);
//	}


}
