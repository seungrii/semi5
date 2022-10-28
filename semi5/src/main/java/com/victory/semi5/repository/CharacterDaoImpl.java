package com.victory.semi5.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.CharacterDto;
@Repository
public class CharacterDaoImpl implements CharacterDao {
	
	
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
//	@Override
//	public void insert(CharacterDto dto) {
//		String sql="insert into character("
//				+"character_number,movie_number,charater_name, "
//				+"character_age,character_awards,character_filmography, "
//				+"character_type,character_nationality"
//				+")values("
//				+ "character_seq.nextval,?,?,?,?,?,?,?"
//				+")";
//		
//		Object[] param= {
//				dto.getMovieNumber(),
//				dto.getCharaterName(),
//				dto.getCharacterAge(), dto.getCharacterAwards(),
//				dto.getCharacterFilmography(), dto.getCharacterType(),
//				dto.getCharacterNationality()
//		};
//		jdbcTemplate.update(sql,param);	
//	}

	@Override
	public void insertDirector(CharacterDto characterDto, String charaterName1) {
		String sql="insert into character("
		+"character_number, movie_number, charater_name, character_type"
		+")values("
		+ "character_seq.nextval,?,?,?)";

		Object[] param= {
			characterDto.getMovieNumber(), charaterName1, "감독"
		};
		jdbcTemplate.update(sql,param);	
	}

	@Override
	public void insertActor1(CharacterDto characterDto, String charaterName2) {
		String sql="insert into character("
		+"character_number, movie_number, charater_name, character_type"
		+")values("
		+ "character_seq.nextval,?,?,?)";

		Object[] param= {
			characterDto.getMovieNumber(), charaterName2, "배우"
		};
		jdbcTemplate.update(sql,param);	
	}
	
	@Override
	public void insertActor2(CharacterDto characterDto, String charaterName3) {
		String sql="insert into character("
		+"character_number, movie_number, charater_name, character_type"
		+")values("
		+ "character_seq.nextval,?,?,?)";

		Object[] param= {
			characterDto.getMovieNumber(), charaterName3, "배우"
		};
		jdbcTemplate.update(sql,param);	
	}
	
	@Override
	public void insertActor3(CharacterDto characterDto, String charaterName4) {
		String sql="insert into character("
		+"character_number, movie_number, charater_name, character_type"
		+")values("
		+ "character_seq.nextval,?,?,?)";

		Object[] param= {
			characterDto.getMovieNumber(), charaterName4, "배우"
		};
		jdbcTemplate.update(sql,param);	
	}
	
	@Override
	public void insertActor4(CharacterDto characterDto, String charaterName5) {
		String sql="insert into character("
		+"character_number, movie_number, charater_name, character_type"
		+")values("
		+ "character_seq.nextval,?,?,?)";

		Object[] param= {
			characterDto.getMovieNumber(), charaterName5, "배우"
		};
		jdbcTemplate.update(sql,param);	
	}




	
	
	
	
}
//번호 생성하면서 등록
//rowmapper는 list때문에

