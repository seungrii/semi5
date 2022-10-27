package com.victory.semi5.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.UserDto;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private ResultSetExtractor<UserDto> userExtractor = rs -> {
		if(rs.next()) {
			return UserDto.builder()
					.userId(rs.getString("user_id"))
					.userPw(rs.getString("user_pw"))
					.userName(rs.getString("user_name"))
					.userGender(rs.getString("user_gender"))
					.userBirth(rs.getDate("user_birth"))
					.userEmail(rs.getString("user_email"))
					.userRank(rs.getString("user_rank"))
					.userTel(rs.getString("user_tel"))
					.userBlurb(rs.getString("user_blurb"))
				.build();
		}else {
			return null;
		}
	};
	
	private ResultSetExtractor<UserDto> userIdExtractor = rs -> {
		if(rs.next()) {
			return UserDto.builder()
					.userName(rs.getString("user_name"))
					.userBirth(rs.getDate("user_birth"))
					.userEmail(rs.getString("user_email"))
					.userTel(rs.getString("user_tel"))
				.build();
		}else {
			return null;
		}
	};
	
	@Override
	public UserDto selectOne(String userId) {
		String sql = "select * from user_information where user_id=?";
		Object[] param= {userId};
		return jdbcTemplate.query(sql, userExtractor, param);
	}

	@Override
	public void join(UserDto userDto) {
		String conId = "select userId user_information";
		if(userDto.getUserBlurb() == null) {
			userDto.setUserBlurb("off");
		}
		String sql = "insert into user_information (user_id, user_pw, user_name, "
				+ "user_gender, user_birth, user_email, user_tel, user_blurb) values "
				+ "(?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] param = {userDto.getUserId(), userDto.getUserPw(),
				userDto.getUserName(), userDto.getUserGender(), userDto.getUserBirth(),
				userDto.getUserEmail(), userDto.getUserTel(), userDto.getUserBlurb()};
		
		jdbcTemplate.update(sql, param);
	}

	private RowMapper<UserDto> mapper = (rs, idx) -> {
		return UserDto.builder()
					.userId(rs.getString("user_id"))
					.userPw(rs.getString("user_pw"))
					.userName(rs.getString("user_name"))
					.userGender(rs.getString("user_gender"))
					.userBirth(rs.getDate("user_birth"))
					.userEmail(rs.getString("user_email"))
					.userRank(rs.getString("user_rank"))
					.userTel(rs.getString("user_tel"))
					.userBlurb(rs.getString("user_blurb"))
				.build();
	};
	@Override
	public List<UserDto> selectList() {
		String sql = "select * from user_information order by user_id asc";
		return jdbcTemplate.query(sql, mapper);
	}
	@Override
	public List<UserDto> selectList(String type, String keyword) {
		String sql = "select * from user_information "
				+ "where instr(#1, ?) >0 "
				+ "order by user_id asc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}

}
