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
import com.victory.semi5.entity.MovieDto;


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
	
	private RowMapper<CharacterDto> mapper = new RowMapper<CharacterDto>() {
		@Override
		public CharacterDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			CharacterDto dto = new CharacterDto();
			dto.setCharacterNumber(rs.getInt("character_number"));
			dto.setMovieNumber(rs.getInt("movie_number"));
			
		    dto.setCharaterName1(rs.getString("charater_name1"));
		    dto.setCharaterName2(rs.getString("charater_name2"));
		    dto.setCharaterName3(rs.getString("charater_name3"));
		    dto.setCharaterName4(rs.getString("charater_name4"));
		    dto.setCharaterName5(rs.getString("charater_name5"));
			dto.setCharacterAge(rs.getInt("character_age"));
			dto.setCharacterAwards(rs.getString("character_awards"));
			dto.setCharacterFilmography(rs.getString("character_filmography"));
			dto.setCharacterType(rs.getString("character_type"));
			dto.setCharacterNationality(rs.getString("character_nationality"));
			return dto;
	
		}
	};
	
	
//조회위한
	private ResultSetExtractor<CharacterDto> extractor = new ResultSetExtractor<CharacterDto>() {
		@Override
		public CharacterDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
			    CharacterDto dto = new CharacterDto();
				dto.setCharacterNumber(rs.getInt("character_number"));
				dto.setMovieNumber(rs.getInt("movie_number"));
				
			    dto.setCharaterName1(rs.getString("charater_name1"));
			    dto.setCharaterName2(rs.getString("charater_name2"));
			    dto.setCharaterName3(rs.getString("charater_name3"));
			    dto.setCharaterName4(rs.getString("charater_name4"));
			    dto.setCharaterName5(rs.getString("charater_name5"));
				dto.setCharacterAge(rs.getInt("character_age"));
				dto.setCharacterAwards(rs.getString("character_awards"));
				dto.setCharacterFilmography(rs.getString("character_filmography"));
				dto.setCharacterType(rs.getString("character_type"));
				dto.setCharacterNationality(rs.getString("character_nationality"));
				return dto;
				
				
				
			}
			else {
				return null;
			}
		}
	};
	

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
	
	
    //상세 조회
	@Override
	public CharacterDto selectOne(int movieNumber) {
		
		String sql="select*from character where character_number=?";
		Object[]param= {movieNumber};
		return jdbcTemplate.query(sql, extractor,param);
		
	}

	@Override
	public CharacterDto selectOneDirector(String charaterName1) {
		String sql="select*from character where movie_number=?";
		Object[]param= {charaterName1};
		return jdbcTemplate.query(sql, extractor,param);
	}

	@Override
	public CharacterDto selectOneActor1(String charaterName2) {
		String sql="select*from character where character_number=?";
		Object[]param= {charaterName2};
		return jdbcTemplate.query(sql, extractor,param);
	}

	@Override
	public CharacterDto selectOneActor2(String charaterName3) {
		String sql="select*from character where character_number=?";
		Object[]param= {charaterName3};
		return jdbcTemplate.query(sql, extractor,param);
	}

	@Override
	public CharacterDto selectOneActor3(String charaterName4) {
		String sql="select*from character where character_number=?";
		Object[]param= {charaterName4};
		return jdbcTemplate.query(sql, extractor,param);
	}

	@Override
	public CharacterDto selectOneActor4(String charaterName5) {
		String sql="select*from character where character_number=?";
		Object[]param= {charaterName5};
		return jdbcTemplate.query(sql, extractor,param);
	}

	@Override
	public List<CharacterDto> selectList(int movieNumber) {
		
    String sql="select*from character where movie_number=?";
    Object[]param= {movieNumber};
    return jdbcTemplate.query(sql, mapper, param);
    
    
	}
	
	
	
	





}	

//    String sql="select*from character where movie_number=?";
//    Object[]param= {movieNumber};
//    return jdbcTemplate.query(sql, extractor, param);
	
	

//번호 생성하면서 등록
//rowmapper는 list때문에

