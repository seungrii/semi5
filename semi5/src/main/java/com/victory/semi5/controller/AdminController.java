package com.victory.semi5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.victory.semi5.entity.AdminDto;
import com.victory.semi5.repository.AdminDao;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminDao adminDao;
	
	@GetMapping("/home")
	public String home() {
		return "admin/home";
	}
	
	@GetMapping("/addAdmin")
	public String addAdmin() {
		return "admin/addAdmin";
	}
	@PostMapping("/addAdmin")
	public String addAdmin(
			@ModelAttribute AdminDto adminDto) {
		adminDao.addAdmin(adminDto);
		return "redirect:addAdmin";
	}
	
	
}
