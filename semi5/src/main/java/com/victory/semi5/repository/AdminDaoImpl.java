package com.victory.semi5.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.victory.semi5.entity.AdminDto;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void addAdmin(AdminDto adminDto) {
		String sql = "insert into admin(admin_id, admin_pw, "
				+ "employee_no, admin_addMemo, admin_addDate) "
				+ "values(?, ?, ?, ?, sysdate)";
		Object[] param = {
			adminDto.getAdminId(), adminDto.getAdminPw(), 
			adminDto.getEmployeeNo(), adminDto.getAdminAddMemo()
		};
		jdbcTemplate.update(sql, param);
	}

	private RowMapper<AdminDto> mapper = (rs, idx) -> {
		return AdminDto.builder()
					.adminId(rs.getString("admin_id"))
					.adminPw(rs.getString("admin_pw"))
					.employeeNo(rs.getInt("employee_no"))
					.adminAddMemo(rs.getString("admin_addMemo"))
					.adminAddDate(rs.getDate("admin_addDate"))
				.build();
	};
	@Override
	public List<AdminDto> selectList() {
		String sql = "select * from admin order by admin_id asc";
		return jdbcTemplate.query(sql, mapper);
	}
	@Override
	public List<AdminDto> selectList(String type, String keyword) {
		String sql = "select * from admin "
					+ "where instr(#1, ?) >0 "
					+ "order by admin_id asc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	private ResultSetExtractor<AdminDto> extractor = (rs) -> {
		if(rs.next()) {
			return AdminDto.builder()
					.adminId(rs.getString("admin_id"))
					.adminPw(rs.getString("admin_pw"))
					.employeeNo(rs.getInt("employee_no"))
					.adminAddMemo(rs.getString("admin_addMemo"))
					.adminAddDate(rs.getDate("admin_addDate"))
				.build();
		}
		else {			
			return null;
		}
	};
	@Override
	public AdminDto selectOne(String adminId) {
		String sql = "select * from admin "
					+ "where admin_id = ?";
		Object[] param = {adminId};
		return jdbcTemplate.query(sql, extractor, param);
	}
	
	@Override
	public boolean changeAdmin(AdminDto adminDto) {
		String sql = "update admin set "
				+ "employee_no = ?, admin_addMemo = ? "
				+ "where admin_id = ?";
		Object[] param = {
			adminDto.getEmployeeNo(), adminDto.getAdminAddMemo(), 
			adminDto.getAdminId()};
		return jdbcTemplate.update(sql, param) >0;
	}
	
	@Override
	public boolean deleteAdmin(String adminId) {
		String sql = "delete admin where admin_id = ?";
		Object[] param = {adminId};
		return jdbcTemplate.update(sql, param) >0;
	}


}
