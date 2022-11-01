package com.victory.semi5.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.CharacterDto;
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

	private RowMapper<CharacterDto> mapper = (rs, idx) -> {
        CharacterDto dto = new CharacterDto();
        dto.setCharacterNumber(rs.getInt("character_number"));
        dto.setMovieNumber(rs.getInt("movie_number"));
        dto.setCharaterName(rs.getString("charater_name"));
        dto.setCharacterAge(rs.getInt("character_age"));
        dto.setCharacterAwards(rs.getString("character_awards"));
        dto.setCharacterFilmography(rs.getString("character_filmography"));
        dto.setCharacterType(rs.getString("character_type"));
        dto.setCharacterNationality(rs.getString("character_nationality"));
        return dto;
    };
	@Override
    public List<CharacterDto> selectListDirector(int movieNumber) {
        String sql = "select * from character "
                + "where movie_number =? and character_type =?";
        Object[] param= {movieNumber, "감독"};
        return jdbcTemplate.query(sql, mapper, param);
    }
    @Override
    public List<CharacterDto> selectListActor(int movieNumber) {
        String sql = "select * from character "
                + "where movie_number =? and character_type =?";
        Object[] param= {movieNumber, "배우"};
        return jdbcTemplate.query(sql, mapper, param);
    }

}

