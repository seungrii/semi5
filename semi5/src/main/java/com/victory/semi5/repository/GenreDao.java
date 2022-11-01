package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.GenreDto;
import com.victory.semi5.vo.HashtagVO;

public interface GenreDao {
	
	void insert(GenreDto dto);//데이터 넣기
	int insert2(GenreDto dto);
    
	List<HashtagVO> selectListHashtagVO(int movieNumber);

}
