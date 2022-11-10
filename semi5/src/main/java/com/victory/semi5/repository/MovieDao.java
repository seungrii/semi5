package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.MovieDto;
import com.victory.semi5.vo.MovieVO;



public interface MovieDao {
	
	int insert2(MovieVO movieVO);	//추가
	
    List<MovieDto> selectList();//목록
    List<MovieDto> selectList(String type, String keyword);//검색
	List<MovieDto> selectListMoviePlayDate(String keyword);

    List<MovieDto> selectList3();//목록
	
    MovieDto selectOne(int movieNumber);//상세조회
    
    boolean delete(int movieNumber);//삭제

    void insertHashtag(int movieNumber, int genreNo);


    
    
    List<MovieDto> selectSearch(String movieName);
}
