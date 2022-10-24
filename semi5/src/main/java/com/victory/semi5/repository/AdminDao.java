package com.victory.semi5.repository;

import java.util.List;

import com.victory.semi5.entity.AdminDto;

public interface AdminDao {
	
	void addAdmin(AdminDto adminDto);
	
	List<AdminDto> selectList();
	List<AdminDto> selectList(String type, String keyword);
	AdminDto selectOne(String adminId);
	
}
