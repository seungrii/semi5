package com.victory.semi5.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class OneQnaDto {
	private int askingNo;
	private String userId, AdminId, askingTitle, askingContents, askingAnswer;
	private Date askingWriteTime, askingAnswerTime;
}
