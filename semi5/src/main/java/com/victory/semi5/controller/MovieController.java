package com.victory.semi5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.victory.semi5.entity.MovieDao;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired
	private MovieDao movieDao;
	//무비차트
	//@GetMapping("/chart")
	//@PostMapping("/chart")
	
	
	//상영중
	//@GetMapping("/now")
	//@PostMapping("/now")
	
	
	//상영예정
	//@GetMapping("/plan")
	//@PostMapping("/plan")

	
	
	

}
