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

import com.victory.semi5.entity.QnaDto;
import com.victory.semi5.vo.QnaListSearchVO;

@Repository
public class QnaDaoImpl implements QnaDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//등록
	@Override
	public void insert(QnaDto qnaDto) {
		String sql = "insert into qna_board("
				+ "qna_no, qna_writer, qna_title, qna_contents"
				+ ") values(qna_board_seq.nextval,?,?,?)";
		Object[] param = {
				qnaDto.getQnaWriter(), qnaDto.getQnaTitle(), 
				qnaDto.getQnaContents()
				};
		jdbcTemplate.update(sql, param);
	}
	
	private RowMapper<QnaDto> mapper = new RowMapper<QnaDto>() {
		public QnaDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return QnaDto.builder()
					.qnaNo(rs.getInt("qna_no"))
					.qnaWriter(rs.getString("qna_writer"))
					.adminId(rs.getString("admin_id"))
					.qnaTitle(rs.getString("qna_title"))
					.qnaContents(rs.getString("qna_contents"))
					.qnaWriteTime(rs.getDate("qna_write_time"))
					.qnaRead(rs.getInt("qna_read"))
					.qnaAnswer(rs.getString("qna_answer"))
					.qnaAnswerTime(rs.getDate("qna_answer_time"))
					.build();
		}
	};
	
	@Override
	public List<QnaDto> selectList() {
		String sql = "select * from qna_board order by qna_no desc";
		return jdbcTemplate.query(sql, mapper);
	}
	@Override
	public List<QnaDto> selectList(QnaListSearchVO vo) {
		if(vo.isSearch()) {//검색이라면
			return search(vo);
		}
		else {//목록이라면
			return list(vo);
		}
	}
	@Override
	public List<QnaDto> search(QnaListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from qna_board "
					+ "where instr(#1, ?) > 0 "
					+ "order by qna_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {
		vo.getKeyword(), vo.startRow(), vo.endRow()
		};
		return jdbcTemplate.query(sql, mapper, param);
	}
	@Override
	public List<QnaDto> list(QnaListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from qna_board "
					+ "order by qna_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, mapper, param);
	}
	@Override
	public int count(QnaListSearchVO vo) {
		if(vo.isSearch()) {
			return searchCount(vo);
		}
		else {
			return listCount(vo);
		}
	}
	@Override
	public int listCount(QnaListSearchVO vo) {
		String sql = "select count(*) from qna_board";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	@Override
	public int searchCount(QnaListSearchVO vo) {
		String sql = "select count(*) from qna_board "
				+ "where instr(#1, ?) > 0";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
	//detail을 위한 ResultSetExtractor
	private ResultSetExtractor<QnaDto> extractor = new ResultSetExtractor<QnaDto>() {
		
		@Override
		public QnaDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				return QnaDto.builder()
						.qnaNo(rs.getInt("qna_no"))
						.qnaWriter(rs.getString("qna_writer"))
						.adminId(rs.getString("admin_id"))
						.qnaTitle(rs.getString("qna_title"))
						.qnaContents(rs.getString("qna_contents"))
						.qnaWriteTime(rs.getDate("qna_write_time"))
						.qnaRead(rs.getInt("qna_read"))
						.qnaAnswer(rs.getString("qna_answer"))
						.qnaAnswerTime(rs.getDate("qna_answer_time"))
						.build();
			}
			else {
				return null;
			}
		}
	};
	
	@Override
	public QnaDto selectOne(int qnaNo) {
		String sql = "select * from qna_board where qna_no=?";
		Object[] param = {qnaNo};
		return jdbcTemplate.query(sql, extractor, param);
	}
	@Override
	public boolean update(QnaDto qnaDto) {
		String sql = "update qna_board set "
				+ "qna_title=?, qna_contents=? "
				+ "where qna_no=?";
		Object[] param = {
				qnaDto.getQnaTitle(),
				qnaDto.getQnaContents(),
				qnaDto.getQnaNo()
		};
		return jdbcTemplate.update(sql, param) > 0;
	}
	@Override
	public boolean delete(int qnaNo) {
		String sql = "delete qna_board where qna_no=?";
		Object[] param = {qnaNo};
		return jdbcTemplate.update(sql, param)>0;
	}
	@Override
	public void clear() {
		String sql = "delete qna_board";
		jdbcTemplate.update(sql);
	}
	@Override
	public boolean updateReadcount(int qnaNo) {
		String sql = "update qna_board "
				+ "set qna_read = qna_read + 1 "
				+ "where qna_no = ?";
		Object[] param = {qnaNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
	@Override
	public QnaDto read(int qnaNo) {
		this.updateReadcount(qnaNo);
		return this.selectOne(qnaNo);
	}
	//아이디로 검색
	@Override
	public List<QnaDto> selectIdList(String userId) {
		// TODO Auto-generated method stub
		return null;
	}
	//등록에서 상세 - 안해
	@Override
	public int insert2(QnaDto qnaDto) {
		String sql = "select qna_board_seq.nextval from dual";
		int qnaNo = jdbcTemplate.queryForObject(sql, int.class);
		
		sql = "insert into qna_board("
				+ "qna_no, qna_title, qna_contents,"
				+ "qna_writer "
				+ ") values(?, ?, ?, ?)";
		Object[] param = {
		                qnaNo, qnaDto.getQnaTitle(),
		                qnaDto.getQnaContents(), qnaDto.getQnaWriter(),
		};
		jdbcTemplate.update(sql, param);
		
		return qnaNo;
	}
	//시퀀스? - 안해
	@Override
	public int sequence() {
		String sql = "select qna_board_seq.nextval from dual";
		int qnaNo = jdbcTemplate.queryForObject(sql, int.class);
		return qnaNo;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
