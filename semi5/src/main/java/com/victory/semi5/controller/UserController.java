package com.victory.semi5.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.victory.semi5.entity.UserDto;
import com.victory.semi5.repository.UserDao;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserDao userDao;
	
	@GetMapping("/login")
	public String login() { 
		return "user/login";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute UserDto userDto, 
			HttpSession session) {
		UserDto findDto = userDao.selectOne(userDto.getUserId());
		System.out.println("user = "+userDto.getUserId());
		if(findDto==null) {
			return "redirect:login?error";
		}
		boolean passwordMatch = userDto.getUserId().equals(findDto.getUserId());
		if(passwordMatch) {
			session.setAttribute("LoginId", userDto.getUserId());
			return "redirect:/";
		}else {
			return "redirect:login?error";
		}
	}
	
	@GetMapping("/join")
	public String join() {
		return "user/join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute UserDto userDto) {
		return "";
	}
}
