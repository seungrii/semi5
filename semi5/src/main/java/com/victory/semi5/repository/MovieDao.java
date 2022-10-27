package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.MovieDto;



public interface MovieDao {
	
	void insert(MovieDto dto);//데이터 넣기
	int insert2(MovieDto dto);
    List<MovieDto> selectList();//목록
    List<MovieDto>selectList(String type, String keyword);//검색
    MovieDto selectOne(int movieNumber);//상세조회
    boolean update(MovieDto dto);//수정
    boolean delete(int movieNumber);

}
