package com.victory.semi5.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.QnaDto;


@Repository
public class QnaDaoImpl {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//등록
//	@Override
//	public void insert(QnaDto qnaDto) {
//		
//		String sql = "insert into qna_board(qna_no, qna_writer, qna_title, qna_contents, ana_answer) values(notice_board_seq.nextval,?,?,?)";
//		Object[] param = {qnaDto.getAdminId(), qnaDto.getNoticeTitle(), qnaDto.getNoticeContents()};
//		jdbcTemplate.update(sql, param);
//	}
}
