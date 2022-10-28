package com.victory.semi5.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.CinemaDto;
import com.victory.semi5.entity.MovieDto;
import com.victory.semi5.vo.AdvanceTimeVO;
import com.victory.semi5.vo.CinemaNameVO;
import com.victory.semi5.vo.MovieScheduleVO;

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
	
	
	@Override
	public List<MovieDto> selectMovies() {
		String sql = "select * from movie where screening_end >= sysdate";
		return jdbcTemplate.query(sql, movieMapper);
	}
	
	private RowMapper<CinemaDto> cinemaMapper = (rs, idx) -> {
		CinemaDto cinemaDto = new CinemaDto();
		
		cinemaDto.setCinemaPorin(rs.getString("cinema_porin"));
		cinemaDto.setCinemaBaseAddress(rs.getString("cinema_base_address"));
		cinemaDto.setCinemaDetailAddress(rs.getString("cinema_detail_address"));
		cinemaDto.setCinemaTel(rs.getString("cinema_tel"));
		
		return cinemaDto;
	};
	
	
	@Override
	public List<CinemaDto> selectCinemaList() {
		String sql = "select * from cinema order by cinema_porin asc";
		return jdbcTemplate.query(sql, cinemaMapper);
	}
	
	private RowMapper<CinemaNameVO> cinemaNameMapper = (rs, idx) -> {
		CinemaNameVO cinemaNameVO = new CinemaNameVO();
		
		cinemaNameVO.setCinemaName(rs.getString("CINAME"));
		
		return cinemaNameVO;
	};
	
	
	@Override
	public List<CinemaNameVO> selectMovieChoiceList(int movieNumber) {
		String sql = "select distinct cinema_porin CINAME from theater where theater_num in("
				+ " select distinct theater_num from movie_play where movie_number = ?"
				+ ")";
		Object[] param = {movieNumber};
		return jdbcTemplate.query(sql, cinemaNameMapper, param);
	}
	
	private RowMapper<MovieScheduleVO> movieScheduleMapper = (rs, idx) -> {
		MovieScheduleVO movieScheduleVO = new MovieScheduleVO();
		
		movieScheduleVO.setCinemaPorin(rs.getString("cinema_porin"));
		movieScheduleVO.setMovieNumber(rs.getInt("movie_number"));
		movieScheduleVO.setMoviePlayNum(rs.getInt("movie_play_num"));
		movieScheduleVO.setMoviePlayStart(rs.getDate("movie_play_start"));
		movieScheduleVO.setTheaterHall(rs.getInt("theater_hall"));
		movieScheduleVO.setTheaterNum(rs.getInt("theater_num"));
		movieScheduleVO.setTheaterTotalSeat(rs.getInt("theater_total_seat"));
		movieScheduleVO.setTheaterType(rs.getString("theater_type"));
		
		return movieScheduleVO;
	};
	
	@Override
	public List<MovieScheduleVO> selectMoviePlayDate(int movieNumber, String cinemaName) {
		String sql = "select MP.movie_play_num, MP.movie_number, MP.theater_num, MP.movie_play_start, T.cinema_porin, T.theater_total_seat, T.theater_hall, T.theater_type "
				+ "from movie_play MP "
				+ "    left outer join theater T on MP.theater_num = T.theater_num "
				+ "	where MP.movie_number=? "
				+ "    and MP.theater_num in (select theater_num from theater where cinema_porin=?)"
				+ "    and MP.movie_play_start > sysdate"
				+ "    order by MP.movie_play_start asc";
		Object[] param = {movieNumber, cinemaName};
		return jdbcTemplate.query(sql, movieScheduleMapper, param);
	}
	
	
	private RowMapper<AdvanceTimeVO> AdvanceTimeMapper = (rs, idx) -> {
		AdvanceTimeVO advanceTimeVO = new AdvanceTimeVO();
		
		advanceTimeVO.setTime(rs.getString("TIME"));
		advanceTimeVO.setCinemaPorin(rs.getString("cinema_porin"));
		advanceTimeVO.setTheaterHall(rs.getInt("theater_hall"));
		advanceTimeVO.setTheaterNum(rs.getInt("theater_num"));
		advanceTimeVO.setTheaterTotalSeat(rs.getInt("theater_total_seat"));
		advanceTimeVO.setTheatertype(rs.getString("theater_type"));
		
		
		return advanceTimeVO;
	};
	
	
	@Override
	public List<AdvanceTimeVO> selectAdvanceTime(int movieNumber, String cinemaName, String moviePlayDate) {
		String sql = "select T.*, to_char(MP.movie_play_start, 'hh24:mi') TIME "
				+ "from movie_play MP "
				+ "left outer join theater T on MP.theater_num = T.theater_num "
				+ "where MP.movie_number=? "
				+ "and to_char(MP.movie_play_start, 'yyyy-MM-dd') = ? "
				+ "and MP.theater_num in (select theater_num from theater where cinema_porin=?) "
				+ "and MP.movie_play_start > sysdate "
				+ "order by MP.movie_play_start asc";
		Object[] param = {movieNumber, moviePlayDate, cinemaName};
		return jdbcTemplate.query(sql, AdvanceTimeMapper, param);
	}
	
	

}//AdvanceDao end
