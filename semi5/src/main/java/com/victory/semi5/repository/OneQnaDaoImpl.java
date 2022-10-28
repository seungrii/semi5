package com.victory.semi5.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.OneQnaDto;

@Repository
public class OneQnaDaoImpl implements OneQnaDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private ResultSetExtractor<OneQnaDto> qnaInsert = rs -> {
		if(rs.next()) {
			return OneQnaDto.builder()
					.askingNo(rs.getInt("asking_no"))
					.userId(rs.getString("user_id"))
					.askingTitle(rs.getString("asking_title"))
					.askingContents(rs.getString("asking_contents"))
					.askingWriteTime(rs.getDate("asking_write_time"))
				.build();
		}else {
			return null;
		}
	};
	
	@Override
	public void insert(OneQnaDto oneQnaDto) {
		String sql = "insert into asking(asking_no, user_id, asking_title, asking_contents, asking_write_time) "
				+ "values(asking_seq.nextval, ?, ?, ?, sysdate)";
		Object[] param = {oneQnaDto.getUserId(), oneQnaDto.getAskingTitle(),
				oneQnaDto.getAskingContents()};
		jdbcTemplate.update(sql, param);
	}

}
