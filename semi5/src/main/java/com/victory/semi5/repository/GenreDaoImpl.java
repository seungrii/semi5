package com.victory.semi5.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.GenreDto;

@Repository
public class GenreDaoImpl implements GenreDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

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

}
