package com.victory.semi5.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.rsocket.RSocketSecurityAutoConfiguration;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.MoviePlayDto;
import com.victory.semi5.vo.MoviePlayVO;

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
	private RowMapper<MoviePlayDto> mapper = (rs, idx) -> {
		return MoviePlayDto.builder()
					.moviePlayNum(rs.getInt("movie_play_num"))
					.movieNumber(rs.getInt("movie_number"))
					.theaterNum(rs.getInt("theater_num"))
					.moviePlayStart(rs.getDate("movie_play_start"))
				.build();
	};
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
	private ResultSetExtractor<MoviePlayDto> extractor = (rs) -> {
		if(rs.next()) {
			return MoviePlayDto.builder()
						.moviePlayNum(rs.getInt("movie_play_num"))
						.movieNumber(rs.getInt("movie_number"))
						.theaterNum(rs.getInt("theater_num"))
						.moviePlayStart(rs.getDate("movie_play_start"))
					.build();
		}
		else {
			return null;
		}
	};
	@Override
	public MoviePlayDto selectOne(int moviePlayNum) {
		String sql = "select * from movie_play "
				+ "where movie_play_num = ?";
		Object[] param = {moviePlayNum};
		return jdbcTemplate.query(sql, extractor, param);
	}
	@Override
	public boolean changeMoviePlay(MoviePlayDto moviePlayDto) {
		String sql = "update movie_play set "
				+ "movie_Number = ?, theater_Num = ?, movie_play_start =? "
				+ "where movie_play_num = ?";
		Object[] param = {
			moviePlayDto.getMovieNumber(), moviePlayDto.getTheaterNum(), 
			moviePlayDto.getMoviePlayStart(), moviePlayDto.getMoviePlayNum()};
		return jdbcTemplate.update(sql, param)>0;
	}
	@Override
	public boolean deleteMoviePlay(int moviePlayNum) {
		String sql = "delete movie_play "
				+ "where movie_play_num = ?";
		Object[] param = {moviePlayNum};
		return jdbcTemplate.update(sql, param)>0;
	}
	
	
	
//	MoviePlayListVO mapper
	private RowMapper<MoviePlayVO> mapperMPVO = (rs, idx) -> {
		return MoviePlayVO.builder()
					.moviePlayNum(rs.getInt("movie_play_num"))
					.movieNumber(rs.getInt("movie_Number"))
					.movieAgeLimit(rs.getInt("movie_Age_Limit"))
					.moviePlayTime(rs.getInt("movie_play_time"))
					.movieName(rs.getString("movie_name"))
					.openingDate(rs.getDate("opening_date"))
					.screeningEnd(rs.getDate("screening_end"))
					.movieSummary(rs.getString("movie_summary"))
					.theaterNum(rs.getInt("theater_num"))
					.theaterHall(rs.getInt("theater_hall"))
					.theaterTotalSeat(rs.getInt("theater_total_seat"))
					.cinemaPorin(rs.getString("cinema_porin"))
					.theaterType(rs.getString("theater_type"))
					.moviePlayStart(rs.getDate("movie_play_start"))
				.build();
	};
	@Override
	public List<MoviePlayVO> selectMoviePlayViewList() {
		String sql = "select * from movieplay_movie_theater_view "
				+ "order by movie_play_start desc";
		return jdbcTemplate.query(sql, mapperMPVO);
	}
	@Override
	public List<MoviePlayVO> selectMoviePlayViewList(String type, String keyword) {
		String sql = "select * from movieplay_movie_theater_view "
				+ "where instr(#1, ?) >0 "
				+ "order by movie_play_start desc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapperMPVO, param);
	}
	private ResultSetExtractor<MoviePlayVO> extractorMPVO = (rs) -> {
		if(rs.next()) {
			return MoviePlayVO.builder()
					.moviePlayNum(rs.getInt("movie_play_num"))
					.movieNumber(rs.getInt("movie_Number"))
					.movieAgeLimit(rs.getInt("movie_Age_Limit"))
					.moviePlayTime(rs.getInt("movie_play_time"))
					.movieName(rs.getString("movie_name"))
					.openingDate(rs.getDate("opening_date"))
					.screeningEnd(rs.getDate("screening_end"))
					.movieSummary(rs.getString("movie_summary"))
					.theaterNum(rs.getInt("theater_num"))
					.theaterHall(rs.getInt("theater_hall"))
					.theaterTotalSeat(rs.getInt("theater_total_seat"))
					.cinemaPorin(rs.getString("cinema_porin"))
					.theaterType(rs.getString("theater_type"))
					.moviePlayStart(rs.getDate("movie_play_start"))
				.build();
		}
		else {
			return null;
		}
	};
	@Override
	public MoviePlayVO selectMoviePlayView(int moviePlayNum) {
		String sql = "select * from movieplay_movie_theater_view "
				+ "where movie_play_num = ?";
		Object[] param = {moviePlayNum};
		return jdbcTemplate.query(sql, extractorMPVO, param);
	}
	
	
	
	

}
