package com.victory.semi5.repository;

import com.victory.semi5.vo.MovieVO;

public interface CharacterDao {
	
//	void insert(CharacterDto dto);//데이터 넣기
	void insertDirector1(MovieVO movieVO);
	void insertActor1(MovieVO movieVO);
	void insertActor2(MovieVO movieVO);
	void insertActor3(MovieVO movieVO);
	void insertActor4(MovieVO movieVO);
}
