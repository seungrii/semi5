package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.BoardDto;

public interface BoardDao {

	void insert(BoardDto boardDto);

	List<BoardDto> selectList();

	
	
}
