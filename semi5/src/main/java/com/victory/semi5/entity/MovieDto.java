package com.victory.semi5.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MovieDto {
	private int movieNumber, moviePlayTime, movieAgeLimit;
	private String movieName, movieSummary;
	private Date openingDate, screeningEnd;

}
