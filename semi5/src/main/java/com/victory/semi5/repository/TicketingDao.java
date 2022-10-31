package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.TicketingDto;

public interface TicketingDao {

//	예매내역 출력
	List<TicketingDto> selectList(String userId);
}
