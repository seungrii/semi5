package com.victory.semi5.repository;

import com.victory.semi5.entity.GenreDto;

public interface GenreDao {
	
	void insert(GenreDto dto);//데이터 넣기
	int insert2(GenreDto dto);
	GenreDto selectOne();
    
}
