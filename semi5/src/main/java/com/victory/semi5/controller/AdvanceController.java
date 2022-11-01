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
import com.victory.semi5.vo.DateVO;

@Controller
@RequestMapping("/advance")
public class AdvanceController {

	@Autowired
	private AdvanceDao advanceDao;
	
	@GetMapping("/list")
	public String movieList(Model model) {
		
		List<MovieDto> movieList = advanceDao.selectMovies();
		List<CinemaDto> cinemaList = advanceDao.selectCinemaList();
		List<DateVO> sysdate = advanceDao.selectDatelist();
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("cinemaList", cinemaList);
		model.addAttribute("dateList",sysdate);
		
		return "advance/list";
	}
	
	
}
