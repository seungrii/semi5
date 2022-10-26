package com.victory.semi5;

import org.junit.jupiter.api.BeforeEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.victory.semi5.repository.NoticeDao;

@SpringBootTest
public class NoticeDummyTest {

	@Autowired
	private NoticeDao noticeDao;
	
//	@Test
//	public void before() {
//		for(int i=1; i <= 371; i++) {
//			noticeDao.insert(NoticeDao.builder()
//									.noticeTitle("테스트"+i)
//									.noticeContents("테스트"+i)
//									.adminId("admin1234")
//								.build());
//		}
//	}
	
	@BeforeEach
	public void after() {
		noticeDao.clear();
	}
}
