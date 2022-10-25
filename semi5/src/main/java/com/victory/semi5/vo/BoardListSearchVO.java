package com.victory.semi5.vo;

import lombok.Data;
import lombok.ToString;

@Data
public class BoardListSearchVO {
	//검색분류와 검색어
	private String type, keyword;
	
	public boolean isSearch() {
		return type != null && keyword != null;
	}
	
	//현재 페이지 번호(없을 경우 1로 설정)
	private int p = 1;
	private int size = 10;

	@ToString.Include
	public int startRow() {
		return endRow() - (size - 1);
	}
	@ToString.Include
	public int endRow() {
		return p * size;
	}
	
	//총 게시글 수
	private int count;
	
	//화면에 표시할 블럭 개수 - 1부터 10페이지까지 보여주는 거.
	private int blockSize = 10;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
