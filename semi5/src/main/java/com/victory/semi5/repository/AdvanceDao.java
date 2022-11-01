package com.victory.semi5.repository;

import java.sql.Date;
import java.util.List;

import com.victory.semi5.entity.CinemaDto;
import com.victory.semi5.entity.MovieDto;
import com.victory.semi5.vo.AdvanceTimeVO;
import com.victory.semi5.vo.CinemaNameVO;
import com.victory.semi5.vo.DateVO;
import com.victory.semi5.vo.MovieScheduleVO;

public interface AdvanceDao {
	//기본 List 출력
	List<MovieDto> selectMovies();
	List<CinemaDto> selectCinemaList();
	List<DateVO> selectDatelist();
	
	//조건부 List 출력
	List<CinemaNameVO> selectMovieChoiceList(int movieNumber);
	List<MovieScheduleVO> selectMoviePlayDate(int movieNumber, String cinemaName);
	List<AdvanceTimeVO> selectAdvanceTime(int movieNumber, String cinemaName, String moviePlayDate);
	
	

}
