package com.victory.semi5.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.CinemaDto;
import com.victory.semi5.entity.MovieDto;

@Repository
public class AdvanceDaoImpl implements AdvanceDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<MovieDto> movieMapper = (rs, idx) -> {
		MovieDto movieDto = new MovieDto();
		
		movieDto.setMovieNumber(rs.getInt("movie_number"));
		movieDto.setMovieName(rs.getString("movie_name"));
		movieDto.setOpeningDate(rs.getDate("opening_date"));
		movieDto.setScreeningEnd(rs.getDate("screening_end"));
		movieDto.setMovieSummary(rs.getString("movie_summary"));
		movieDto.setMoviePlayTime(rs.getInt("movie_play_time"));
		movieDto.setMovieAgeLimit(rs.getInt("movie_age_limit"));
		
		return movieDto;
		
	};
	
	private RowMapper<CinemaDto> cinemaMapper = (rs, idx) -> {
		CinemaDto cinemaDto = new CinemaDto();
		
		cinemaDto.setCinemaPorin(rs.getString("cinema_porin"));
		cinemaDto.setCinemaBaseAddress(rs.getString("cinema_base_address"));
		cinemaDto.setCinemaDetailAddress(rs.getString("cinema_detail_address"));
		cinemaDto.setCinemaTel(rs.getString("cinema_tel"));
		
		return cinemaDto;
	};
	
	@Override
	public List<MovieDto> selectMovies() {
		String sql = "select * from movie where screening_end >= sysdate";
		return jdbcTemplate.query(sql, movieMapper);
	}
	
	@Override
	public List<CinemaDto> selectCinemaList() {
		String sql = "select * from cinema order by cinema_porin asc";
		return jdbcTemplate.query(sql, cinemaMapper);
	}

}
