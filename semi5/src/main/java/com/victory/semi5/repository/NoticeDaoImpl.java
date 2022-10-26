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

import com.victory.semi5.entity.NoticeDto;
import com.victory.semi5.vo.NoticeListSearchVO;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//등록
	@Override
	public void insert(NoticeDto noticeDto) {
		
		String sql = "insert into notice_board(notice_no, admin_id, notice_title, notice_contents) values(notice_board_seq.nextval,?,?,?)";
		Object[] param = {noticeDto.getAdminId(), noticeDto.getNoticeTitle(), noticeDto.getNoticeContents()};
		jdbcTemplate.update(sql, param);
	}
	
	//등록에서 리스트가 아닌 상세로
	@Override
	public int insert2(NoticeDto noticeDto) {
		String sql = "select notice_board_seq.nextval from dual";
		int noticeNo = jdbcTemplate.queryForObject(sql, int.class);
		
		sql = "insert into notice_board(notice_no, notice_title, notice_contents) values(?,?,?)";
		Object[] param = {
				noticeNo,noticeDto.getNoticeTitle(), noticeDto.getNoticeContents()
		};
		jdbcTemplate.update(sql, param);
		return noticeNo;
	}
	
	//RowMapper
	private RowMapper<NoticeDto> mapper = new RowMapper<NoticeDto>() {
		@Override
		public NoticeDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			return NoticeDto.builder()
					.noticeNo(rs.getInt("notice_no"))
					.adminId(rs.getString("admin_id"))
					.noticeTitle(rs.getString("notice_title"))
					.noticeContents(rs.getString("notice_contents"))
					.noticeWriteTime(rs.getDate("notice_write_time"))
					.noticeUpdateTime(rs.getDate("notice_update_time"))
					.noticeRead(rs.getInt("notice_read"))
					.build();
		}
	};
	
	@Override
	public List<NoticeDto> selectList() {	
		String sql = "select * from notice_board order by notice_no desc";
		return jdbcTemplate.query(sql, mapper);
	}
	@Override
	public List<NoticeDto> selectList(NoticeListSearchVO vo) {
		if(vo.isSearch()) {//검색이라면
			return search(vo);
		}
		else {//목록이라면
			return list(vo);
		}
	}
	@Override
	public List<NoticeDto> search(NoticeListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from notice_board "
					+ "where instr(#1, ?) > 0 "
					+ "order by notice_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {
		vo.getKeyword(), vo.startRow(), vo.endRow()
		};
		return jdbcTemplate.query(sql, mapper, param);
	}
	@Override
	public List<NoticeDto> list(NoticeListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from notice_board "
					+ "order by notice_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, mapper, param);
	}
	@Override
	public int count(NoticeListSearchVO vo) {
		if(vo.isSearch()) {
			return searchCount(vo);
		}
		else {
			return listCount(vo);
		}
	}
	@Override
	public int listCount(NoticeListSearchVO vo) {
		String sql = "select count(*) from notice_board";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	@Override
	public int searchCount(NoticeListSearchVO vo) {
		String sql = "select count(*) from notice_board "
				+ "where instr(#1, ?) > 0";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
		}
	
	@Override
	public void clear() {
		String sql = "delete notice_board";
		jdbcTemplate.update(sql);
	}
	
	@Override
	public boolean delete(int noticeNo) {
		String sql = "delete notice_board where notice_no=?";
		Object[] param = {noticeNo};
		return jdbcTemplate.update(sql, param)>0;
	}
	
	//detail을 위한 ResultSetExtractor
	private ResultSetExtractor<NoticeDto> extractor = new ResultSetExtractor<NoticeDto>() {
		@Override
		public NoticeDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				return NoticeDto.builder()
						.noticeNo(rs.getInt("notice_no"))
						.adminId(rs.getString("admin_id"))
						.noticeTitle(rs.getString("notice_title"))
						.noticeContents(rs.getString("notice_contents"))
						.noticeWriteTime(rs.getDate("notice_write_time"))
						.noticeUpdateTime(rs.getDate("notice_update_time"))
						.noticeRead(rs.getInt("notice_read"))
						.build();
			}
			else {
				return null;
			}
		}
	};
	//detail
	@Override
	public NoticeDto selectOne(int noticeNo) {
		String sql = "select * from notice_board where notice_no=?";
		Object[] param = {noticeNo};
		return jdbcTemplate.query(sql, extractor, param);
	}
	@Override
	public boolean update(NoticeDto noticeDto) {
		String sql = "update notice_board set "
				+ "notice_title=?, notice_contents=? "
				+ "notice_update_time=sysdate "
				+ "where notice_no=?";
		Object[] param = {
				noticeDto.getNoticeTitle(),
				noticeDto.getNoticeContents(),
				noticeDto.getNoticeNo(),
		};
		return jdbcTemplate.update(sql, param)>0;
	}
	
	//조회수
	@Override
	public boolean updateReadcount(int noticeNo) {
		String sql = "update notice_board set notice_read=notice_read+1 where notice_no=?";
		Object[] param= {noticeNo};
		return jdbcTemplate.update(sql, param)>0;
	}
	
	//조회수 증가
	@Override
	public NoticeDto read(int noticeNo) {
		this.updateReadcount(noticeNo);
		return this.selectOne(noticeNo);
	}
	@Override
	public int sequence() {
		String sql = "select notice_board_seq.nextval from dual";
		int noticeNo = jdbcTemplate.queryForObject(sql, int.class);
		return noticeNo;
	}
}
