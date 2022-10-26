package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.ReplyDto;


public interface ReplyDao {
	void insert(ReplyDto replyDro);
	List<ReplyDto> selectList(int replyOrigin);
	boolean update(ReplyDto replyDto);
	boolean delete(int replyNo);
}
