package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.MovieDto;
import com.victory.semi5.vo.HashtagVO;
import com.victory.semi5.vo.MoviePlayVO;
import com.victory.semi5.vo.MovieVO;



public interface MovieDao {

		
	void insert(MovieDto dto);//데이터 넣기
	int insert2(MovieVO movieVO);
    List<MovieDto> selectList();//목록
    List<MovieDto>selectList(String type, String keyword);//검색
    MovieDto selectOne(int movieNumber);//상세조회
    boolean update(MovieDto dto);//수정
    boolean delete(int movieNumber);
    void insertHashtag(int movieNumber, int genreNo);
    
    
	//뷰 조회) 영화정보-인물-해시태그
	List<MovieVO> selectMovieViewList();
	List<MovieVO> selectMovieViewList(String type, String keyword);
	MovieVO selectMovieView(int movieNumber);
	
	HashtagVO selectOneHashtagVO(int movieNumber);
	List<HashtagVO> selectListHashtagVO(int movieNumber);
	
	
	
}
