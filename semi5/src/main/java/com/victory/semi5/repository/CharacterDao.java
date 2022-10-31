package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.CharacterDto;
import com.victory.semi5.vo.MovieVO;

public interface CharacterDao {

//  void insert(CharacterDto dto);//데이터 넣기
    void insertDirector1(MovieVO movieVO);
    void insertActor1(MovieVO movieVO);
    void insertActor2(MovieVO movieVO);
    void insertActor3(MovieVO movieVO);
    void insertActor4(MovieVO movieVO);

	CharacterDto selectOne(int movieNumber);
	//CharacterDto selectOneDirector(String charaterName1);
	//CharacterDto selectOneActor1(String charaterName2);
	//CharacterDto selectOneActor2(String charaterName3);
	//CharacterDto selectOneActor3(String charaterName4);
	//CharacterDto selectOneActor4(String charaterName5);
	List<CharacterDto> selectList(int movieNumber);
	List<CharacterDto> selectListDirector(int movieNumber);
	List<CharacterDto> selectListActor(int movieNumber);
	
	
}
