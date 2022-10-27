package com.victory.semi5.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.ReplyDto;


@Repository
public class ReplyDaoImpl implements ReplyDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<ReplyDto> mapper = new RowMapper<ReplyDto>() {
		@Override
		public ReplyDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return ReplyDto.builder()
							.replyNo(rs.getInt("reply_no"))
							.replyWriter(rs.getString("reply_writer"))
							.replyOrigin(rs.getInt("reply_origin"))
							.replyContent(rs.getString("reply_content"))
							.replyWriteTime(rs.getDate("reply_write_time"))
							.replyUpdateTime(rs.getDate("reply_update_time"))
							.replyBlind(rs.getString("reply_blind") != null)
						.build();
		}
	};
	
	@Override
	public void insert(ReplyDto replyDto) {
		String sql = "insert into reply(reply_no, reply_writer, reply_origin, reply_content) values(reply_seq.nextval, ?,?,?)";
		Object[] param = {
				replyDto.getReplyWriter(), replyDto.getReplyOrigin(),
				replyDto.getReplyContent()
		};
		jdbcTemplate.update(sql, param);
	}
	@Override
	public List<ReplyDto> selectList(int replyOrigin) {
		String sql = "select * from reply "
				+ "where reply_origin=? "
				+ "order by reply_no asc";
		Object[] param = {replyOrigin};
		return jdbcTemplate.query(sql, mapper, param);
	}
	@Override
	public boolean delete(int replyNo) {
		String sql = "delete reply where reply_no = ?";
		Object[] param = {replyNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	@Override
	public boolean update(ReplyDto replyDto) {
		String sql = "update reply "
				+ "set reply_content=? "
				+ "where reply_no=?";
		Object[] param = {
		replyDto.getReplyContent(), replyDto.getReplyNo()
		};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
}
