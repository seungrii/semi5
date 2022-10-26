package com.victory.semi5.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.CinemaDto;
import com.victory.semi5.entity.MovieDto;
import com.victory.semi5.vo.CinemaNameVO;
import com.victory.semi5.vo.MoviePlayDateVO;
import com.victory.semi5.vo.MoviePlayStartVO;

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
		
		cinemaNameVO.setCiName(rs.getString("CINAME"));
		
		return cinemaNameVO;
	};
	
	
	@Override
	public List<CinemaNameVO> selectMovieChoiceList(int movieNumber) {
		String sql = "select CI.cinema_porin CINAME from movie M "
				+ "right join movie_play MP on M.movie_number = MP.movie_number "
				+ "left join theater TH on MP.theater_num = TH.theater_num "
				+ "left join cinema CI on TH.cinema_porin = CI.cinema_porin "
				+ "where M.movie_number = ? group by CI.cinema_porin";
		Object[] param = {movieNumber};
		return jdbcTemplate.query(sql, cinemaNameMapper, param);
	}
	//아직 사용 안함
	private RowMapper<MoviePlayDateVO> moviePlayDateRowMapper = (rs, idx) -> {
		MoviePlayDateVO moviePlayDateVO = new MoviePlayDateVO();
		
		moviePlayDateVO.setNyeon(rs.getString("nyeon"));
		moviePlayDateVO.setWoar(rs.getString("woar"));
		moviePlayDateVO.setIl(rs.getString("il"));
		moviePlayDateVO.setYoil(rs.getString("yoil"));
		
		return moviePlayDateVO;
		
	};
	//아직 사용 안함
	@Override
	public List<MoviePlayDateVO> selectMoviePlayDateList() {
		String sql = "select to_char(movie_play_start, 'yyyy')nyeon,"
				+ "to_char(movie_play_start, 'mm')woar,"
				+ "to_char(movie_play_start, 'dd')il,"
				+ "to_char(movie_play_start, 'dy')yoil "
				+ "from movie_play";
		return jdbcTemplate.query(sql, moviePlayDateRowMapper);
	}
	
	private RowMapper<MoviePlayStartVO> moviePlayStartMapper = (rs, idx) -> {
		MoviePlayStartVO moviePlayStartVO = new MoviePlayStartVO();
		
		moviePlayStartVO.setMPS(rs.getDate("MPS"));
		
		return moviePlayStartVO;
	};
	
	@Override
	public List<MoviePlayStartVO> selectCinemaChoiceList(int movieNumber, String cinemaName) {
		// 
		return null;
	}
	
	

}//AdvanceDao end
