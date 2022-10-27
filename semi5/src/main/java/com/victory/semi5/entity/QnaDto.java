package com.victory.semi5.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class QnaDto {

	private int qnaNo, qnaRead;
	private String qnaWriter, adminId, qnaTitle, qnaContents, qnaAnswer;
	private Date qnaWriteTime, qnaAnswerTime;
}
