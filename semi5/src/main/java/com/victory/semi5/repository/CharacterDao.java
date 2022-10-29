package com.victory.semi5.repository;

import com.victory.semi5.entity.CharacterDto;
import com.victory.semi5.entity.MovieDto;

public interface CharacterDao {
	
//	void insert(CharacterDto dto);//데이터 넣기
	void insertDirector(CharacterDto characterDto, String charaterName1);
	void insertActor1(CharacterDto characterDto,String charaterName2);
	void insertActor2(CharacterDto characterDto,String charaterName3);
	void insertActor3(CharacterDto characterDto,String charaterName4);
	void insertActor4(CharacterDto characterDto,String charaterName5);
	CharacterDto selectOne(int movieNumber);
	CharacterDto selectOneDirector(String charaterName1);
	CharacterDto selectOneActor1(String charaterName2);
	CharacterDto selectOneActor2(String charaterName3);
	CharacterDto selectOneActor3(String charaterName4);
	CharacterDto selectOneActor4(String charaterName5);
}
