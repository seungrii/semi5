package com.victory.semi5;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.victory.semi5.entity.ReplyDto;
import com.victory.semi5.repository.ReplyDao;


@SpringBootTest
public class ReplyTest {
	
	@Autowired
	private ReplyDao replyDao;
	
	@BeforeEach
	public void before() {
		//insert
		for(int i=1; i <= 100; i++) {
			replyDao.insert(ReplyDto.builder()
										.replyWriter("hello1234")
										.replyOrigin(520)
										.replyContent("댓글테스트"+i)
									.build());
		}
	}
	
	@Test
	public void test() {
		//select
		List<ReplyDto> list = replyDao.selectList(520);
		for(ReplyDto replyDto : list) {
			System.out.println(replyDto);
		}
	}
}
