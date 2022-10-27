package com.victory.semi5.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.CharacterDto;
@Repository
public class CharacterDaoImpl implements CharacterDao {
	
	
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void insert(CharacterDto dto) {
		
		String sql="insert into character("
				+"character_number,movie_number,charater_name, "
				+"character_age,character_awards,character_filmography, "
				+"character_type,character_nationality"
				+")values("
				+ "character_seq.nextval,?,?,?,?,?,?,?"
				+")";
		
		Object[] param= {
				dto.getMovieNumber(),
				 dto.getCharaterName(),
				dto.getCharacterAge(), dto.getCharacterAwards(),
				dto.getCharacterFilmography(), dto.getCharacterType(),
				dto.getCharacterNationality()
		};
		jdbcTemplate.update(sql,param);
				
	}
}
//번호 생성하면서 등록
//rowmapper는 list때문에