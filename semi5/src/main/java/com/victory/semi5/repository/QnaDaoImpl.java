package com.victory.semi5.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
					.qnaAnswerTime(rs.getDate("qna_anwer_timme"))
					.build();
		}
	};
	
	@Override
	public List<QnaDto> selectList() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<QnaDto> selectList(QnaListSearchVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<QnaDto> search(QnaListSearchVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<QnaDto> list(QnaListSearchVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int count(QnaListSearchVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int listCount(QnaListSearchVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int searchCount(QnaListSearchVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	//detail을 위한 ResultSetExtractor

	@Override
	public QnaDto selectOne(int qnaNo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean update(QnaDto qnaNo) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean delete(int qnaNo) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public void clear() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public boolean updateReadcount(int qnaNo) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public QnaDto read(int qnaNo) {
		// TODO Auto-generated method stub
		return null;
	}
	//아이디로 검색
	
	//등록에서 상세 - 안해
	
	//시퀀스? - 안해
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
