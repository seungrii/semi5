package com.victory.semi5.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class CharacterDto {
	
	private int characterNumber;
	private int movieNumber;
	private String charaterName;
	private int characterAge;
	private String characterAwards;
	private String characterFilmography;
	private String characterType;
	private String characterNationality;

}
