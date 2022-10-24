package com.victory.semi5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.victory.semi5.entity.AdminDto;
import com.victory.semi5.repository.AdminDao;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminDao adminDao;
	
	//admin home
	@GetMapping("/home")
	public String home() {
		return "admin/home";
	}
	
	//admin 계정추가
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
	//계정추가 완료시, 추가완료 알람창 구현필요(js)
	
	//admin 계정조회
	@GetMapping("/listAdmin")
	public String listAdmin(
			Model model,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) {
			model.addAttribute("listAdmin", adminDao.selectList(type, keyword));
		}
		else {
			model.addAttribute("listAdmin", adminDao.selectList());
		}
		return "admin/listAdmin";
	}
	@GetMapping("/detailAdmin")
	public String datailAdmin(
			Model model,
			@RequestParam String adminID) {
		AdminDto adminDto = adminDao.selectOne(adminID);
		model.addAttribute("adminDto", adminDto);
		return "admin/detailAdmin";
	}
	
	//admin 계정수정
	
	
	//admin 계정삭제
	
	
}
