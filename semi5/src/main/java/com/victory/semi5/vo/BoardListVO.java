package com.victory.semi5.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class BoardListVO {

	private int boardNo, boardRead, boardLike;
	private String boardWriter, boardTitle, boardHead;
	private Date boardWriteTime;
	private int replyCount;
	
	//DB에 INSERT 할 때 0 대신 null이 등록되도록 값을 변환해서 반환하는 메소드
}
