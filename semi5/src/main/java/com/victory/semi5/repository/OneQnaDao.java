package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.OneQnaDto;

public interface OneQnaDao {
	void insert(OneQnaDto oneQnaDto);
	
	List<OneQnaDto> selectIdList(String userId);
}