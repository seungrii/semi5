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

import com.victory.semi5.entity.MovieDto;

@Repository
public class MovieDaoImpl implements MovieDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<MovieDto> mapper = new RowMapper<MovieDto>() {
		@Override
		public MovieDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		    MovieDto dto = new MovieDto();
			dto.setMovieNumber(rs.getInt("movie_number"));
			dto.setMovieName(rs.getString("movie_name"));
		    dto.setOpeningDate(rs.getDate("opening_date"));
			dto.setScreeningEnd(rs.getDate("screening_end"));
			dto.setMovieSummary(rs.getString("movie_summary"));
			dto.setMoviePlayTime(rs.getInt("movie_play_time"));
			dto.setMovieAgeLimit(rs.getInt("movie_age_limit"));
			
			return dto;
		}
	};
	//조회위한
	private ResultSetExtractor<MovieDto> extractor = new ResultSetExtractor<MovieDto>() {
		@Override
		public MovieDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
			    MovieDto dto = new MovieDto();
				dto.setMovieNumber(rs.getInt("movie_number"));
				dto.setMovieName(rs.getString("movie_name"));
			    dto.setOpeningDate(rs.getDate("opening_date"));
				dto.setScreeningEnd(rs.getDate("screening_end"));
				dto.setMovieSummary(rs.getString("movie_summary"));
				dto.setMoviePlayTime(rs.getInt("movie_play_time"));
				dto.setMovieAgeLimit(rs.getInt("movie_age_limit"));
				
				return dto;
				
				
				
			}
			else {
				return null;
			}
		}
	};


	@Override
	public void insert(MovieDto dto) {
		// TODO Auto-generated method stub
		
		String sql="insert into movie("
				+"movie_number,movie_name,opening_date, "
				+"screening_end, movie_summary,movie_play_time,movie_age_limit"
				+ ") values("
				+"movie_seq.nextval,?,?,?,?,?,?"
				+")";
		
		Object[] param= {
				dto.getMovieName(),dto.getOpeningDate(),
				dto.getScreeningEnd(),dto.getMovieSummary(),
				dto.getMoviePlayTime(),dto.getMovieAgeLimit()
		};
		jdbcTemplate.update(sql,param);
	}

	@Override
	public List<MovieDto> selectList() {//목록
		  String sql="select*from movie order by movie_number asc";
			return jdbcTemplate.query(sql, mapper);
	}

	@Override
	public List<MovieDto> selectList(String type, String keyword) {
		String sql="select*from movie "
				+"where instr(#1,?)>0"
				+"order by #1 asc";
		sql=sql.replace("#1", type);
		Object[] param= {keyword};
		return jdbcTemplate.query(sql, mapper,param);
	}

	@Override
	public MovieDto selectOne(int movieNumber) {//상세 조회
		// TODO Auto-generated method stub
	    String sql="select*from movie where movie_number=?";
	    Object[]param= {movieNumber};
	    return jdbcTemplate.query(sql, extractor, param);
	 }

	@Override
	public boolean update(MovieDto dto) {
		String sql="update movie "
				+"set "
				+"movie_name=?,opening_date=?,screening_end=?,movie_summary=?,movie_play_time=?,movie_age_limit=? "
				+"where "
					+"movie_number=?";
		

		Object[] param= {
				dto.getMovieName(),dto.getOpeningDate(),
				dto.getScreeningEnd(),dto.getMovieSummary(),
				dto.getMoviePlayTime(),dto.getMovieAgeLimit(),
				dto.getMovieNumber()
		};
		return jdbcTemplate.update(sql,param)>0;
	}

	@Override//삭제
	public boolean delete(int movieNumber) {
		String sql="delete movie where movie_number=?";
		Object[] param= {movieNumber};
		return jdbcTemplate.update(sql,param)>0;
		
	}

	@Override
	public int insert2(MovieDto dto) {
		// TODO Auto-generated method stub
	String sql="select movie_seq.nextval from dual";
	int movieNumber=jdbcTemplate.queryForObject(sql, int.class);
	
	sql="insert into movie("
			+"movie_number,movie_name,opening_date, "
			+"screening_end, movie_summary,movie_play_time,movie_age_limit"
			+ ") values("
			+"?,?,?,?,?,?,?"
			+")";
	Object[] param= {
			movieNumber,dto.getMovieName(),dto.getOpeningDate(),
			dto.getScreeningEnd(),dto.getMovieSummary(),
			dto.getMoviePlayTime(),dto.getMovieAgeLimit(),
			
	};
		
		jdbcTemplate.update(sql, param);
		
		return movieNumber;
	}

	@Override
	public void insertHashtagVO(int movieNumber, int genreNo) {
		String sql = "insert into hashtag values(?, ?)";
		Object[] param = {movieNumber, genreNo};
		jdbcTemplate.update(sql, param);
	}
	
}