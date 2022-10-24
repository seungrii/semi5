package com.victory.semi5.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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
				+ ") values(board_seq.nextval, ?, ?, ?, sysdate, null, 0, ?, 0)";
		Object[] param = {
				boardDto.getBoardWriter(), boardDto.getBoardTitle(),
				boardDto.getBoardContents(),
				boardDto.getBoardHead()
		};
		jdbcTemplate.update(sql, param);
	}
	
	private RowMapper<BoardDto> mapper = new RowMapper<BoardDto>() {

		@Override
		public BoardDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return BoardDto.builder()
					.boardNo(rs.getInt("board_no"))
					.boardWriter(rs.getString("board_writer"))
					.boardTitle(rs.getString("board_title"))
					.boardContents(rs.getString("board_contents"))
					.boardWriteTime(rs.getDate("board_write_time"))
					.boardUpdateTime(rs.getDate("board_update_time"))
					.boardRead(rs.getInt("board_read"))
					.boardHead(rs.getString("board_head"))
					.boardLike(rs.getInt("boadr_like"))
					.build();
		}
		
		
	};

	@Override
	public List<BoardDto> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

//	@Override
//	public List<BoardDto> selectList() {
//		String sql = "select * from board order by board_no desc";
//		return jdbcTemplate.query(sql, mapper);
//	}	
//
//	@Override
//	public List<BoardDto> selectList() {
//		String sql = "select * from board "
//						+ "where instr(#1, ?) > 0 "
//						+ "order by #1 asc";
//		sql = sql.replace("#1", type);
//		Object[] param = {keyword};
//		return jdbcTemplate.query(sql, mapper, param);
//	}

	
}
