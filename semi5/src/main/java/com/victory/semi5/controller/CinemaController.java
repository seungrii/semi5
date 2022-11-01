package com.victory.semi5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.victory.semi5.repository.CinemaDao;

@Controller
@RequestMapping("/cinema")
public class CinemaController {
	
	@Autowired
	private CinemaDao cinemaDao;
	
	@GetMapping("/home")
	public String cinemaHome() {
		return "cinema/home";
	}
}
