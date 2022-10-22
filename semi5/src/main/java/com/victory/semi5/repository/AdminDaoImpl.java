package com.victory.semi5.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.AdminDto;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void addAdmin(AdminDto adminDto) {
		String sql = "insert into admin(admin_id, admin_pw, employee_no) values(?, ?, ?)";
		Object[] param = {
			adminDto.getAdminId(), adminDto.getAdminPw(), adminDto.getEmployeeNo()
		};
		jdbcTemplate.update(sql, param);
	}

}
