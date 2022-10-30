package com.victory.semi5.repository;

import com.victory.semi5.entity.CharacterDto;

public interface CharacterDao {
	
//	void insert(CharacterDto dto);//데이터 넣기
	void insertDirector(CharacterDto characterDto, String charaterName1);
	void insertActor1(CharacterDto characterDto,String charaterName2);
	void insertActor2(CharacterDto characterDto,String charaterName3);
	void insertActor3(CharacterDto characterDto,String charaterName4);
	void insertActor4(CharacterDto characterDto,String charaterName5);

}
