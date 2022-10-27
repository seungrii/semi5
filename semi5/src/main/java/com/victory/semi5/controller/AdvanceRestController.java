package com.victory.semi5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.victory.semi5.repository.AdvanceDao;
import com.victory.semi5.vo.CinemaNameVO;
import com.victory.semi5.vo.MovieScheduleVO;

//CrossOrigin 어노테이션을 붙이면 외부의 접근이 허용된다
@CrossOrigin(origins = {"http://127.0.0.1:5500"})
@RestController
@RequestMapping("/rest/advance")
public class AdvanceRestController {
	
	@Autowired
	private AdvanceDao advanceDao;
	
	@GetMapping("/cinemalist")
	public List<CinemaNameVO> selectCinemaList(@RequestParam int movieNumber ) {
		List<CinemaNameVO> cinemaNameVOs = advanceDao.selectMovieChoiceList(movieNumber);
		
		
		if(cinemaNameVOs != null) {
//			System.out.println("성공");
//			System.out.println(cinemaNameVOs);
			return cinemaNameVOs; //성공
		}
		else {
//			System.out.println("실패");
			return null; //실패
		}
		
	}//selectCinemaList() end

	
	@GetMapping("/datelist")
	public List<MovieScheduleVO> selectDateList(@RequestParam int movieNumber, @RequestParam String cinemaName) {
		
		List<MovieScheduleVO> movieScheduleVOs = advanceDao.selectMoviePlayDate(movieNumber, cinemaName);
		
		if(movieScheduleVOs != null) {
			System.out.println("성공");
			System.out.println(movieScheduleVOs);
			return movieScheduleVOs; //성공
		}
		else {
			System.out.println("실패");
			return null; //실패
		}
		
	}
	

}//AdvanceRestController end
