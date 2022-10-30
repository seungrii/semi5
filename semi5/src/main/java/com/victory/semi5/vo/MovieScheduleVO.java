package com.victory.semi5.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MovieScheduleVO {
	private int moviePlayNum, movieNumber, theaterNum, theaterTotalSeat, theaterHall;
	private Date moviePlayStart;
	private String cinemaPorin, theaterType;

}
