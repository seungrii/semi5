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

import com.victory.semi5.entity.CharacterDto;
import com.victory.semi5.entity.GenreDto;
import com.victory.semi5.vo.HashtagVO;

@Repository
public class GenreDaoImpl implements GenreDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	//조회위한
		private ResultSetExtractor<GenreDto> extractor = new ResultSetExtractor<GenreDto>() {
			@Override
			public GenreDto extractData(ResultSet rs) throws SQLException, DataAccessException {
				if(rs.next()) {
				    GenreDto dto = new GenreDto();
					dto.setGenreNo(rs.getInt("genre_no"));
					dto.setGenreName(rs.getString("genre_name"));
					
					return dto;
					
					
					
				}
				else {
					return null;
				}
			}
		};
		
		private ResultSetExtractor<HashtagVO> extractorHashtagVO = (rs) -> {
			if(rs.next()) {
				return HashtagVO.builder()
							.genreNo(rs.getInt("genre_no"))
							.movieNumber(rs.getInt("movie_number"))
							.genreName(rs.getString("genre_name"))
						.build();
			}
			else {
				return null;
			}
		};
		
		private RowMapper<HashtagVO> mapperHashtagVO = (rs, idx) -> {
			return HashtagVO.builder()
						.movieNumber(rs.getInt("movie_number"))
						.genreNo(rs.getInt("genre_no"))
						.genreName(rs.getString("genre_name"))
					.build();
		};
		
	@Override
	public void insert(GenreDto dto) {
		
		String sql="insert into Genre("
				+"genre_no,genre_name"
				+") values("
				+"genre_seq.nextval,?"
				+")";
		
		Object[] param= {
				dto.getGenreNo(),
				dto.getGenreName()
		};
		jdbcTemplate.update(sql,param);
		
	}

	@Override
	public int insert2(GenreDto dto) {
		// TODO Auto-generated method stub
		String sql="select genre_seq.nextval from dual";
		int genreNo=jdbcTemplate.queryForObject(sql, int.class);
		
		 sql="insert into Genre("
				+"genre_no,genre_name"
				+") values("
				+"?,?"
				+")";
		
		Object[] param= {
				genreNo,
				dto.getGenreName()
		};
		jdbcTemplate.update(sql,param);
		
		return genreNo;
		
	}

	@Override
	public GenreDto selectOne(int genreNo) {
		// TODO Auto-generated method stub
		String sql="select*from genre where genre_no=?";
		Object[]param= {genreNo};
		return jdbcTemplate.query(sql, extractor,param);
	}

	@Override
	public List<HashtagVO> selectListHashtagVO(String genreName) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<HashtagVO> selectListHashtagVO(int movieNumber) {
		String sql = "select * from Hashtag_genre_view "
				+ "where movie_number =?";
		Object[] param= {movieNumber};
		return jdbcTemplate.query(sql, mapperHashtag, param);
	}

	private RowMapper<HashtagVO> mapperHashtag = (rs, idx) -> {
			return HashtagVO.builder()
					.movieNumber(rs.getInt("movie_number"))
					.genreNo(rs.getInt("genre_no"))
					.genreName(rs.getString("genre_name"))
					.build();
	};
	@Override
	public List<HashtagVO> selectListHashtag(int movieNumber) {
		String sql = "select * from hashtag where movie_number = ?";
		Object[] param = {movieNumber};
		return jdbcTemplate.query(sql, mapperHashtag, param);
	}





}
