package com.victory.semi5.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class NoticeDto {

	private int noticeNo, noticeRead;
	private String adminId, noticeTitle, noticeContents;
	private Date noticeWriteTime, noticeUpdateTime;
	
	//계층형 게시판 데이터(답글)
	
}
