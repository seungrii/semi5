package com.victory.semi5.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MoviePlayListVO {
	private int moviePlayNum, theaterHall;
	private String movieName, cinemaPorin;
	private String moviePlayStartDate, moviePlayStartTime;
}
