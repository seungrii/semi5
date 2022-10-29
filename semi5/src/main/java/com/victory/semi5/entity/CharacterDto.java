package com.victory.semi5.entity;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class CharacterDto {
	
	private int characterNumber;
	private int movieNumber;
	private String charaterName1, charaterName2, charaterName3, charaterName4, charaterName5;
	private int characterAge;
	private String characterAwards;
	private String characterFilmography;
	private String characterType;
	private String characterNationality;

}
