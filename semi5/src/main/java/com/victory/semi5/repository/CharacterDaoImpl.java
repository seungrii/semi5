package com.victory.semi5.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.victory.semi5.vo.MovieVO;
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
	public void insertDirector1(MovieVO movieVO) {
		String sql="insert into character("
		+"character_number, movie_number, charater_name, character_type"
		+")values("
		+ "character_seq.nextval,?,?,?)";

		Object[] param= {
			movieVO.getMovieNumber(), movieVO.getDirectorName1(), "감독"
		};
		jdbcTemplate.update(sql,param);	
	}

	@Override
	public void insertActor1(MovieVO movieVO) {
		String sql="insert into character("
		+"character_number, movie_number, charater_name, character_type"
		+")values("
		+ "character_seq.nextval,?,?,?)";

		Object[] param= {
				movieVO.getMovieNumber(), movieVO.getActorName1(), "배우"
		};
		jdbcTemplate.update(sql,param);	
	}
	
	@Override
	public void insertActor2(MovieVO movieVO) {
		String sql="insert into character("
		+"character_number, movie_number, charater_name, character_type"
		+")values("
		+ "character_seq.nextval,?,?,?)";

		Object[] param= {
				movieVO.getMovieNumber(), movieVO.getActorName2(), "배우"
		};
		jdbcTemplate.update(sql,param);	
	}
	
	@Override
	public void insertActor3(MovieVO movieVO) {
		String sql="insert into character("
		+"character_number, movie_number, charater_name, character_type"
		+")values("
		+ "character_seq.nextval,?,?,?)";

		Object[] param= {
				movieVO.getMovieNumber(), movieVO.getActorName3(), "배우"
		};
		jdbcTemplate.update(sql,param);	
	}
	
	@Override
	public void insertActor4(MovieVO movieVO) {
		String sql="insert into character("
		+"character_number, movie_number, charater_name, character_type"
		+")values("
		+ "character_seq.nextval,?,?,?)";

		Object[] param= {
				movieVO.getMovieNumber(), movieVO.getActorName4(), "배우"
		};
		jdbcTemplate.update(sql,param);	
	}

}

