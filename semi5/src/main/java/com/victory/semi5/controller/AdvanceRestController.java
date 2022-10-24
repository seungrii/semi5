package com.victory.semi5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.victory.semi5.entity.CinemaDto;
import com.victory.semi5.repository.AdvanceDao;

@RestController
@RequestMapping("/rest/advance")
public class AdvanceRestController {
	
	@Autowired
	private AdvanceDao advanceDao;
	
	@GetMapping("/list")
	public String selectTheater(@ModelAttribute CinemaDto cinemaDto ) {
		
		return "";
	}

}
