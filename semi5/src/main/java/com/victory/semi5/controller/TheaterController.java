package com.victory.semi5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/theater")
public class TheaterController {
	
	@GetMapping("/home")
	public String home() {
		return "theater/home";
	}
	
	@GetMapping("/normal")
	public String normal() {
		return "theater/normal";
	}
	
	@GetMapping("/special")
	public String special() {
		return "theater/special";
	}
	
	@GetMapping("/imax")
	public String imax() {
		return "theater/imax";
	}
	
	@GetMapping("/4d")
	public String fourd() {
		return "theater/4d";
	}
	
	@GetMapping("/suite")
	public String suite() {
		return "theater/suite";
	}
	
	@GetMapping("/kids")
	public String kids() {
		return "theater/kids";
	}
	
}
