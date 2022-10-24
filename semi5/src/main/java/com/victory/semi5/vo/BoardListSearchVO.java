package com.victory.semi5.vo;

import lombok.Data;

@Data
public class BoardListSearchVO {
	//검색분류와 검색어
	private String type, keyword;
	
	public boolean isSearch() {
		return type != null && keyword != null;
	}
	
	
}
