package com.victory.semi5.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.victory.semi5.entity.NoticeDto;

public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void write(NoticeDto noticeDto) {
		
		String sql = "insert into notice_board(notice_no, admin_id, notice_title, notice_contents) values(notice_board_seq.nextval, ?,?,?";
		Object[] param = {noticeDto.getAdminId(), noticeDto.getNoticeTitle(), noticeDto.getNoticeContents()};
		jdbcTemplate.update(sql, param);
	}
}
