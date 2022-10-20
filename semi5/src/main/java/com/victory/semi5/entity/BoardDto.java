package com.victory.semi5.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BoardDto {
	private int boardNo, boardRead, boardLike;
	private String boardWriter, boardTitle, boardContents, boardHead;
	private Date boardWriteTime, boardUpdateTime;
	
	//DB에 INSERT 할 때 0 대신 null이 등록되도록 값을 변환해서 반환하는 메소드

	
	
}
