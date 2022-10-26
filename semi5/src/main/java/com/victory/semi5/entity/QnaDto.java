package com.victory.semi5.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class QnaDto {

	private int qna_no, qna_read;
	private String qna_writer, admin_id, qna_title, qna_contents, qna_answer;
	private Date qna_write_time, qna_answer_time;
}
