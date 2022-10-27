package com.victory.semi5.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class CinemaImageVO {
	private String cinemaPorin;
	private int fileNumber;
}
