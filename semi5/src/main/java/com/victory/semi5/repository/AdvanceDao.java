package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.CinemaDto;
import com.victory.semi5.entity.MovieDto;
import com.victory.semi5.vo.CinemaNameVO;
import com.victory.semi5.vo.MoviePlayDateVO;

public interface AdvanceDao {
	
	List<MovieDto> selectMovies();
	List<CinemaDto> selectCinemaList();
	List<CinemaNameVO> selectChoiceList(int movieNumber);
	List<MoviePlayDateVO> selectMoviePlayDateList();

}
