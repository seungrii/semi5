package com.victory.semi5.entity;

import java.sql.Date;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ImageDto {
	
	private int fileNumber;
	private String fileName;
	private String fileType;
	private String fileSize;
	private Date fileTime;

}
