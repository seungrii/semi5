package com.victory.semi5.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.MoviePlayDto;

@Repository
public class MoviePlayDaoImpl implements MoviePlayDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void addMoviePlay(MoviePlayDto moviePlayDto) {
		String sql = "select movie_play_seq.nextval from dual";
		int moviePlayNubmer = jdbcTemplate.queryForObject(sql, int.class);
		
		sql = "insert into movie_play values"
				+ "(?, ?, ?, ?)";
		Object[] param = {
				moviePlayNubmer, moviePlayDto.getMovieNumber(),
				moviePlayDto.getTheaterNum(), moviePlayDto.getMoviePlayStart()};
		jdbcTemplate.update(sql, param);
	}
//	private RowMapper<MoviePlayDto> mapper = (rs, idx) -> {
//		return MoviePlayDto.builder()
//					.moviePlayNum(rs.getInt("movie_play_num"))
//					.movieNumber(rs.getInt("movie_number"))
//					.theaterNum(rs.getInt("theater_num"))
//					.moviePlayStart(rs.getDate("movie_play_start"))
//				.build();
//	};
//	@Override
//	public List<MoviePlayDto> selectList() {
//		String sql = "select * from movie_play";
//		return jdbcTemplate.query(sql, mapper);
//	}
//	@Override
//	public List<MoviePlayDto> selectList(String type, String keyword) {
//		String sql = "select * from movie_play "
//				+ "where instr(#1, ?) >0 "
//				+ "order by movie_play_num asc";
//		sql = sql.replace("#1", type);
//		Object[] param = {keyword};
//		return jdbcTemplate.query(sql, mapper, param);
//	}
	
	
	
	
	-- 여기에 MoviePlayListVO mapper 생성!
	
	
	@Override
	public List<MoviePlayDto> selectMoviePlayView() {
		String sql = "select * from movieplay_movie_theater_view "
				+ "order by movie_play_start desc";
		return jdbcTemplate.query(sql, mapper);
	}
	@Override
	public List<MoviePlayDto> selectMoviePlayView(String type, String keyword) {
		String sql = "select * from movieplay_movie_theater_view "
				+ "where instr(#1, ?) >0 "
				+ "order by movie_play_start desc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	

}
