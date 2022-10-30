package com.victory.semi5.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MoviePlayDto {
	private int moviePlayNum, movieNumber, theaterNum;
	private Date moviePlayStart;
	private String moviePlayStartDate, moviePlayStartTime;

}
