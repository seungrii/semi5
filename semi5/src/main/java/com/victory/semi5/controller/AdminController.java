package com.victory.semi5.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.victory.semi5.entity.AdminDto;
import com.victory.semi5.entity.UserDto;
import com.victory.semi5.repository.AdminDao;
import com.victory.semi5.repository.UserDao;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private UserDao userDao;
	
	//admin home
	@GetMapping("/home")
	public String home() {
		return "admin/home";
	}
	
	//admin 계정추가
	@GetMapping("/adminAdd")
	public String addAdmin() {
		return "admin/adminAdd";
	}
	@PostMapping("/adminAdd")
	public String addAdmin(
			@ModelAttribute AdminDto adminDto) {
		adminDao.addAdmin(adminDto);
		return "redirect:adminAdd";
	}
	
	//admin 계정조회
	@GetMapping("/adminList")
	public String listAdmin(
			Model model,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) {
			model.addAttribute("adminList", adminDao.selectList(type, keyword));
		}
		else {
			model.addAttribute("adminList", adminDao.selectList());
		}
		return "admin/adminList";
	}
	@GetMapping("/adminDetail")
	public String datailAdmin(
			Model model,
			@RequestParam String adminId) {
		AdminDto adminDto = adminDao.selectOne(adminId);
		model.addAttribute("adminDto", adminDto);
		return "admin/adminDetail";
	}
	
	//admin 계정수정
	@GetMapping("/adminChange")
	public String changeAdmin(
			Model model,
			@RequestParam String adminId) {
		model.addAttribute("adminDto", adminDao.selectOne(adminId));
		return "admin/adminChange";
	}
	@PostMapping("/adminChange")
	public String changeAdmin(
			@ModelAttribute AdminDto adminDto,
			RedirectAttributes attr) {
		adminDao.changeAdmin(adminDto);
		attr.addAttribute("adminId", adminDto.getAdminId());
		return "redirect:adminDetail";
	}
	
	//admin 계정삭제
	@GetMapping("adminDelete")
	public String deleteAdmin(
		HttpSession session, @RequestParam String adminId) {
		adminDao.deleteAdmin(adminId);
		String userId = (String)session.getAttribute("LoginId");
		if(userId.equals(adminId)) { //로그인한 관리자 본인이면
			//session 삭제 후, 로그인창이나 메인홈으로 쫓아냄
			session.removeAttribute("LoginId");
			session.removeAttribute("loginGrade");
			return "redirect:/";
		}
		else {
			return "redirect:adminList";
		}
	}
	
	
	//회원관리
	//회원관리 - 회원목록
	@GetMapping("/userList")
	public String list(
			Model model,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) {
			model.addAttribute("userList", userDao.selectList(type, keyword));
		}
		else {
			model.addAttribute("userList", userDao.selectList());
		}
		return "admin/userList";
	}
		
	//회원관리 - 회원상세
	@GetMapping("/userDetail")
	public String datail(
			Model model,
			@RequestParam String userId) {
		UserDto userDto = userDao.selectOne(userId);
		model.addAttribute("userDto", userDto);
		return "admin/userDetail";
	}
	
	
	//admin 추가 및 수정 시, id pw 정규표현식 추가
	
	//추가사항 : table 디자인css 작성
	//재확인 알람창 필요 (ex. 정말 삭제하시겠습니까?)
	
	
}
