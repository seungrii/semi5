package com.victory.semi5.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.BoardDto;
import com.victory.semi5.vo.BoardListSearchVO;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	//등록
	@Override
	public void insert(BoardDto boardDto) {

		String sql = "insert into board("
				+ "board_no, board_writer, "
				+ "board_title, board_contents, board_head"
				+ ") values(board_seq.nextval, ?, ?, ?, ?)";

		Object[] param = {
				boardDto.getBoardWriter(), boardDto.getBoardTitle(),
				boardDto.getBoardContents(), boardDto.getBoardHead()
		};
		//db insert
		jdbcTemplate.update(sql, param);
	}
	

	// list를 위한 RowMapper
	private RowMapper<BoardDto> mapper = new RowMapper<BoardDto>() {
		@Override
		public BoardDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		
//			BoardDto dto = new BoardDto();
//			dto.setBoardNo(rs.getInt("board_no"));
//			dto.setBoardWriter(rs.getString("board_writer"));
//			dto.setBoardTitle(rs.getString("board_title"));
//			dto.setBoardContents(rs.getString("board_contents"));
//			dto.setBoardWriteTime(rs.getDate("board_write_time"));
//			dto.setBoardUpdateTime(rs.getDate("board_update_time"));
//			dto.setBoardRead(rs.getInt("board_read"));
//			dto.setBoardHead(rs.getString("board_head"));
//			dto.setBoardLike(rs.getInt("board_like"));
//			return dto;
			
			return BoardDto.builder()
					.boardNo(rs.getInt("board_no"))
					.boardWriter(rs.getString("board_writer"))
					.boardTitle(rs.getString("board_title"))
					.boardContents(rs.getString("board_contents"))
					.boardWriteTime(rs.getDate("board_write_time"))
					.boardUpdateTime(rs.getDate("board_update_time"))
					.boardRead(rs.getInt("board_read"))
					.boardHead(rs.getString("board_head"))
					.boardLike(rs.getInt("board_like"))
					.build();
		}
	};
	
	//목록
	@Override
	public List<BoardDto> selectList() {
		String sql = "select * from board order by board_no desc";
		return jdbcTemplate.query(sql, mapper);
	}
	
	//검색
	@Override
//	public List<BoardDto> selectList(String type, String keyword) {
	public List<BoardDto> selectList(BoardListSearchVO vo) {
	
		if(vo.isSearch()) {//검색이라면
			return search(vo);
		}
		else {//목록이라면
			return list(vo);
		}
		
//		String sql = "select * from board "
//				+ "where instr(#1, ?) > 0 "
//				+ "order by #1 desc";
//		sql = sql.replace("#1", vo.getType());
//		Object[] param = {vo.getKeyword()};
//		return jdbcTemplate.query(sql, mapper, param);
	}
	//페이징~~~~~~~~~~~~~~~~아힘들어
	@Override
	public List<BoardDto> search(BoardListSearchVO vo) {
		String sql = "select * from ("
							+ "select rownum rn, TMP.* from ("
								+ "select * from board "
								+ "where instr(#1, ?) > 0 "
								+ "order by board_no desc"
							+ ")TMP"
						+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {
			vo.getKeyword(), vo.startRow(), vo.endRow()
		};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	//페이징 리스트 ㅋㅋ ㅋㅋ ㅋ ㅋ ㅋ ㅋ ㅋ ㅋ 
	@Override
	public List<BoardDto> list(BoardListSearchVO vo) {
		String sql = "select * from ("
							+ "select rownum rn, TMP.* from ("
								+ "select * from board "
								+ "order by board_no desc"
							+ ")TMP"
						+ ") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	//검색 카운트 구하는 어쩌고 페이징 - 마지막 페이지 마지막 글이 몇번인지 구하는 어쩌고임
	@Override
	public int count(BoardListSearchVO vo) {
		if(vo.isSearch()) {
			return searchCount(vo);
		}
		else {
			return listCount(vo);
		}
	}
	
	@Override
	public int listCount(BoardListSearchVO vo) {
		String sql = "select count(*) from board";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	@Override
	public int searchCount(BoardListSearchVO vo) {
		String sql = "select count(*) from board "
						+ "where instr(#1, ?) > 0";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
	
	
	
	
	//detail을 위한 ResultSetExtractor
	private ResultSetExtractor<BoardDto> extractor = new ResultSetExtractor<BoardDto>() {
		@Override
		public BoardDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
//				BoardDto dto = new BoardDto();
//				dto.setBoardNo(rs.getInt("board_no"));
//				dto.setBoardWriter(rs.getString("board_writer"));
//				dto.setBoardTitle(rs.getString("board_title"));
//				dto.setBoardContents(rs.getString("board_contents"));
//				dto.setBoardWriteTime(rs.getDate("board_write_time"));
//				dto.setBoardUpdateTime(rs.getDate("board_update_time"));
//				dto.setBoardRead(rs.getInt("board_read"));
//				dto.setBoardHead(rs.getString("board_head"));
//				dto.setBoardLike(rs.getInt("board_like"));
//				return dto;
				return BoardDto.builder()
						.boardNo(rs.getInt("board_no"))
						.boardWriter(rs.getString("board_writer"))
						.boardTitle(rs.getString("board_title"))
						.boardContents(rs.getString("board_contents"))
						.boardWriteTime(rs.getDate("board_write_time"))
						.boardUpdateTime(rs.getDate("board_update_time"))
						.boardRead(rs.getInt("board_read"))
						.boardHead(rs.getString("board_head"))
						.boardLike(rs.getInt("board_like"))
						.build();
			}	
			else {
				return null;
			}	
		}
	};
	//detail
	@Override
	public BoardDto selectOne(int boardNo) {
		String sql = "select * from board where board_no=?";
		Object[] param = {boardNo};
		return jdbcTemplate.query(sql, extractor, param);
	}
	
	//수정
	@Override
	public boolean update(BoardDto boardDto) {
		String sql = "update board set "
				+ "board_title=?, board_contents=?, board_head=?, "
				+ "board_update_time=sysdate "
				+ "where board_no=?";
		Object[] param = {
				boardDto.getBoardTitle(),
				boardDto.getBoardContents(),
				boardDto.getBoardHead(),
				boardDto.getBoardNo()
		};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	
	//삭제
	@Override
	public boolean delete(int boardNo) {
		String sql = "delete board where board_no=?";
		Object[] param = {boardNo};
		return jdbcTemplate.update(sql, param)>0;
	}
	
	//DB clear
	@Override
	public void clear() {
		String sql = "delete board";
		jdbcTemplate.update(sql);
	}
	
	//조회수
	@Override
	public boolean updateReadcount(int boardNo) {
		String sql = "update board "
				+ "set board_read = board_read + 1 "
				+ "where board_no = ?";
		Object[] param = {boardNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	//조회수 증가까지
	@Override
	public BoardDto read(int boardNo) {
		this.updateReadcount(boardNo);
		return this.selectOne(boardNo);
	}
	
	//등록에서 상세로
	@Override
	public int insert2(BoardDto boardDto) {

		String sql = "select board_seq.nextval from dual";
		int boardNo = jdbcTemplate.queryForObject(sql, int.class);
		
		sql = "insert into board("
				+ "board_no, board_title, board_contents,"
				+ "board_writer, board_head "
				+ ") values(?, ?, ?, ?, ?)";
		Object[] param = {
		                boardNo, boardDto.getBoardTitle(),
		                boardDto.getBoardContents(), boardDto.getBoardWriter(),
		      			boardDto.getBoardHead()
		};
		jdbcTemplate.update(sql, param);
		
		return boardNo;
	}
	
	
}