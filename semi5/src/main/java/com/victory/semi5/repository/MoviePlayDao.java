package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.MoviePlayDto;
import com.victory.semi5.vo.MoviePlayVO;

public interface MoviePlayDao {
	
	void addMoviePlay(MoviePlayDto moviePlayDto);
	
//	List<MoviePlayDto> selectList();
//	List<MoviePlayDto> selectList(String type, String keyword);
	MoviePlayDto selectOne(int moviePlayNum);
	
	boolean changeMoviePlay(MoviePlayDto moviePlayDto);
	
	boolean deleteMoviePlay(int moviePlayNum);
	
	
	//뷰 조회) 상영스케쥴-영화정보-상영관정보
	List<MoviePlayVO> selectMoviePlayViewList();
	List<MoviePlayVO> selectMoviePlayViewList(String type, String keyword);
	List<MoviePlayVO> selectMoviePlayViewListDate(String type, String keyword);
	MoviePlayVO selectMoviePlayView(int moviePlayNum);
	
}
