package com.victory.semi5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.victory.semi5.entity.UserDto;
import com.victory.semi5.repository.UserDao;

@CrossOrigin
@RestController
@RequestMapping("/rest/user")
public class UserRestController {
	@Autowired
	private UserDao userDao;
	
	@GetMapping("/id")
	public String idCheck(@RequestParam String userId) {
		UserDto userDto = userDao.selectOne(userId);
		if(userDto == null) {
			return "NNNNY";
		}else {
			return "NNNNN";
		}
	}
	@GetMapping("/userIdFind")
	public String idFind(@RequestParam String userName,
			@RequestParam String userTel) {
		UserDto findDto = userDao.selectId(userName, userTel);
		if(findDto != null) {
			return findDto.getUserId();
		}else {
			return "NNNNY";
		}
	}
	
}
