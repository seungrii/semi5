package com.victory.semi5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.victory.semi5.entity.CinemaDto;
import com.victory.semi5.repository.AdvanceDao;

//CrossOrigin 어노테이션을 붙이면 외부의 접근이 허용된다
@CrossOrigin(origins = {"http://127.0.0.1:5500"})
@RestController
@RequestMapping("/rest/advance")
public class AdvanceRestController {
	
	@Autowired
	private AdvanceDao advanceDao;
	
	@GetMapping("/list")
	public String selectCinemaList(@RequestParam int movieNumber ) {
		List<CinemaDto> cinemaDto = advanceDao.selectChoiceList(movieNumber);
		
		if(cinemaDto == null) {
			return "Y"; //성공
		}
		else {
			return "N"; //실패			
		}
		
	}

}
