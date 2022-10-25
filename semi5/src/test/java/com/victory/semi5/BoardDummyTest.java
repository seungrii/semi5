package com.victory.semi5;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.victory.semi5.entity.BoardDto;
import com.victory.semi5.repository.BoardDao;

@SpringBootTest
public class BoardDummyTest {

	@Autowired
	private BoardDao boardDao;
	
	@Test
	public void before() {
		for(int i=1; i <= 18; i++) {
			boardDao.insert(BoardDto.builder()
									.boardHead(null)
									.boardTitle("테스트"+i)
									.boardContents("테스트"+i)
									.boardWriter("hello1234")
								.build());
		}
	}
	
	@BeforeEach
	public void after() {
		boardDao.clear();
	}
	
}







