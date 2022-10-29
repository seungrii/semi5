package com.victory.semi5.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.CharacterDto;
import com.victory.semi5.entity.GenreDto;

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


}
