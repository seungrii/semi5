package com.victory.semi5.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.OneQnaDto;
import com.victory.semi5.entity.UserDto;

@Repository
public class OneQnaDaoImpl implements OneQnaDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private ResultSetExtractor<OneQnaDto> selectOne = rs -> {
		if(rs.next()) {
			return OneQnaDto.builder()
					.userId(rs.getString("user_id"))
					.askingNo(rs.getInt("asking_no"))
					.AdminId(rs.getString("Admin_id"))
					.askingTitle(rs.getString("asking_title"))
					.askingContents(rs.getString("asking_contents"))
					.askingAnswer(rs.getString("asking_answer"))
					.askingWriteTime(rs.getDate("asking_write_time"))
					.askingAnswerTime(rs.getDate("asking_answer_time"))
				.build();
		}else {
			return null;
		}
	};
	private RowMapper<OneQnaDto> mapper = (rs, idx) -> {
		return OneQnaDto.builder()
					.userId(rs.getString("user_id"))
					.askingNo(rs.getInt("asking_no"))
					.AdminId(rs.getString("Admin_id"))
					.askingTitle(rs.getString("asking_title"))
					.askingContents(rs.getString("asking_contents"))
					.askingAnswer(rs.getString("asking_answer"))
					.askingWriteTime(rs.getDate("asking_write_time"))
					.askingAnswerTime(rs.getDate("asking_answer_time"))
				.build();
	};
	
	@Override
	public void insert(OneQnaDto oneQnaDto) {
		String sql = "insert into asking(asking_no, user_id, asking_title, asking_contents, asking_write_time) "
				+ "values(asking_seq.nextval, ?, ?, ?, sysdate)";
		Object[] param = {oneQnaDto.getUserId(), oneQnaDto.getAskingTitle(),
				oneQnaDto.getAskingContents()};
		jdbcTemplate.update(sql, param);
	}

	@Override
	public List<OneQnaDto> selectIdList(String userId) {
		String sql = "select * from asking where user_id= ?";
		Object[] param = {userId};
		return jdbcTemplate.query(sql, mapper, param);
	}

	@Override
	public OneQnaDto selectOne(int askingNo) {
		String sql = "select * from asking where asking_no=?";
		Object[] param = {askingNo};
		return jdbcTemplate.query(sql, selectOne, param);
	}

	@Override
	public List<OneQnaDto> selectList() {
		String sql = "select * from asking order by asking_no desc";
		return jdbcTemplate.query(sql, mapper);
	}

	@Override
	public void insertAnswer(OneQnaDto oneQnaDto) {
		String sql = "insert into asking(admin_id, asking_answer, asking_answer_time) "
				+ "values(?, ?, sysdate)";
		Object[] param = {oneQnaDto.getAdminId(), oneQnaDto.getAskingAnswer()};
		jdbcTemplate.update(sql, param); 
	}
	

}
