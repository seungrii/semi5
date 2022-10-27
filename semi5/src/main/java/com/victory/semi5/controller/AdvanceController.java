package com.victory.semi5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.victory.semi5.entity.CinemaDto;
import com.victory.semi5.entity.MovieDto;
import com.victory.semi5.repository.AdvanceDao;

@Controller
@RequestMapping("/advance")
public class AdvanceController {

	@Autowired
	private AdvanceDao advanceDao;
	
	@GetMapping("/list")
	public String movieList(Model model) {
		
		List<MovieDto> movieList = advanceDao.selectMovies();
		List<CinemaDto> cinemaList = advanceDao.selectCinemaList();
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("cinemaList", cinemaList);
		
		return "advance/list";
	}
	
	
}
