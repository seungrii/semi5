package com.victory.semi5.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.TicketingDto;

@Repository
public class TicketingDaoImpl implements TicketingDao{

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	RowMapper<TicketingDto> mapper = (rs, idx) -> {
		return TicketingDto.builder()
				.ticketingNum(rs.getInt("ticketing_num"))
				.userId(rs.getString("user_id"))
				.moviePlayNum(rs.getInt("movie_play_num"))
				.seatNum(rs.getInt("seat_num"))
				.priceTotal(rs.getInt("price_total"))
				.ticketingTime(rs.getDate("ticketing_time"))
			.build();
	};
	
	@Override
	public List<TicketingDto> selectList(String userId) {
		String sql = "select * from ticketing where user_id = ?";
		Object[] param = {userId};
		return jdbcTemplate.query(sql, mapper, param);
	}

}
