package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.CinemaDto;
import com.victory.semi5.entity.MovieDto;
import com.victory.semi5.vo.CinemaNameVO;
import com.victory.semi5.vo.MoviePlayStartVO;
import com.victory.semi5.vo.MovieScheduleVO;

public interface AdvanceDao {
	//기본 List 출력
	List<MovieDto> selectMovies();
	List<CinemaDto> selectCinemaList();
	List<MovieScheduleVO> selectMoviePlayDate(int movieNumber, String cinemaName);
	
	//조건부 List 출력
	List<CinemaNameVO> selectMovieChoiceList(int movieNumber);
	List<MoviePlayStartVO> selectCinemaChoiceList(int movieNumber, String cinemaName);
	
	

}
