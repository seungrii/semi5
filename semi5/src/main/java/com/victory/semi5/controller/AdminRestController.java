package com.victory.semi5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.victory.semi5.entity.AdminDto;
import com.victory.semi5.repository.AdminDao;

@CrossOrigin(origins = {"http://127.0.0.1:5500"})
@RestController
@RequestMapping("/rest/admin")
public class AdminRestController {

	@Autowired
	private AdminDao adminDao;
	
	@RequestMapping("/id")	//id 중복검사
	public String id(@RequestParam String adminId) {
		AdminDto admindto = adminDao.selectOne(adminId);
		if(admindto == null) {
			return "NNNNY";	//아이디 없음
		}
		else {
			return "NNNNN";	//아이디 있음
		}
	}
	
}
