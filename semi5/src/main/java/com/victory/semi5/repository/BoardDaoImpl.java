package com.victory.semi5.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void insert(BoardDto boardDto) {

		String sql = "insert into board("
				+ "board_no, board_writer, "
				+ "board_title, board_contents, "
				+ "board_write_time, board_update_time, "
				+ "board_read, board_head, board_like"
				+ ") values(board_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?";
		Object[] param = {
				boardDto.getBoardWriter(), boardDto.getBoardTitle(),
				boardDto.getBoardContents(), boardDto.getBoardWriteTime(),
				boardDto.getBoardUpdateTime(), boardDto.getBoardRead(),
				boardDto.getBoardHead(), boardDto.getBoardLike()
		};
		jdbcTemplate.update(sql, param);
	}
	
}
