package com.victory.semi5.entity;

import java.sql.Date;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MovieDto {
	
	private int movieNumber;
	private String movieName, movieSummary;
	private Date openingDate,screeningEnd;
	private int moviePlayTime;
	private int movieAgeLimit;

}
