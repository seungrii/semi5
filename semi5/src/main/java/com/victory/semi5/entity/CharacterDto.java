package com.victory.semi5.entity;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class CharacterDto {
	
	private int characterNumber;
	private int movieNumber;
	private int characterAge;
	private String characterAwards;
	private String characterFilmography;
	private String characterType;
	private String characterNationality;
	private String chraterName;
	private String directorName1,actorName1,actorName2,actorName3,actorName4;

	
	
	
	
}
