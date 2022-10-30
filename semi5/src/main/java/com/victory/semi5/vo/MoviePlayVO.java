package com.victory.semi5.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MoviePlayVO {
	
	//스케쥴번호
	private int moviePlayNum;
	
	//영화번호 + 영화명 + 개봉일 + 상영종료일 + 연령등급 + 재생시간
	private int movieNumber, movieAgeLimit, moviePlayTime;
	private String movieName, movieSummary;
	private Date openingDate, screeningEnd;
	
	//상영관번호 + 지점명 + 상영관 타입 + 관 + 좌석수
	private int theaterNum, theaterHall, theaterTotalSeat;
	private String cinemaPorin, theaterType;
	
	//상영시작 + 상영시작일 + 상영시작시간
	private Date moviePlayStart;
	private String moviePlayStartDate, moviePlayStartTime;

}
