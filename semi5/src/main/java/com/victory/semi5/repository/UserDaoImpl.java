package com.victory.semi5.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
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
}
