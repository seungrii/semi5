package com.victory.semi5.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class CinemaDto {
	private String cinemaPorin, cinemaBaseAddress, cinemaDetailAddress, cinemaTel;
	
}
