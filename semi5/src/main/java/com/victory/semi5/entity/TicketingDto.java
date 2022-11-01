package com.victory.semi5.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class TicketingDto {
	private int ticketingNum, moviePlayNum, seatNum, priceTotal;
	private String userId;
	private Date ticketingTime;
}
