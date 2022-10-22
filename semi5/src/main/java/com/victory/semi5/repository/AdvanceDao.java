package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.CinemaDto;
import com.victory.semi5.entity.MovieDto;

public interface AdvanceDao {
	
	List<MovieDto> selectMovies();
	List<CinemaDto> selectCinemaList();

}
