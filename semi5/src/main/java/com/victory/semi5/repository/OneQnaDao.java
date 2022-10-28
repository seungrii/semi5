package com.victory.semi5.repository;

import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.OneQnaDto;

@Repository
interface OneQnaDao {
	void insert(OneQnaDto oneQnaDto);
}
