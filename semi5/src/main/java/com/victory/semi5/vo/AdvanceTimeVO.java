package com.victory.semi5.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class AdvanceTimeVO {
	private String time, cinemaPorin, theatertype;
	private int theaterNum, theaterTotalSeat, theaterHall;
}
