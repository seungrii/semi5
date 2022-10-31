package com.victory.semi5.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MovieVO {
	
	private int movieNumber;
	//movie
	private int  movieAgeLimit, moviePlayTime;
	private String movieName, movieSummary;
	private Date openingDate, screeningEnd;
	
	//character
	private int characterNumber, characterAge;
	private String charaterName, characterAwards, characterFilmography,characterType, characterNationality; 
	
	//hashtag
	
	//영화 장르
	private int  genreNo;
	private String genreName;
	
}