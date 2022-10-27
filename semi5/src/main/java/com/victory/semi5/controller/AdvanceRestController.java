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
import com.victory.semi5.vo.CinemaNameVO;
import com.victory.semi5.vo.MoviePlayStartVO;

//CrossOrigin 어노테이션을 붙이면 외부의 접근이 허용된다
@CrossOrigin(origins = {"http://127.0.0.1:5500"})
@RestController
@RequestMapping("/rest/advance")
public class AdvanceRestController {
	
	@Autowired
	private AdvanceDao advanceDao;
	
	@GetMapping("/list")
	public List<CinemaNameVO> selectCinemaList(@RequestParam int movieNumber ) {
		List<CinemaNameVO> cinemaNameVOs = advanceDao.selectMovieChoiceList(movieNumber);
		
		if(cinemaNameVOs != null) {
//			System.out.println("성공");
			return cinemaNameVOs; //성공
		}
		else {
//			System.out.println("실패");
			return null; //실패
		}
		
	}//selectCinemaList() end
	
	@GetMapping("/alist")
	public List<MoviePlayStartVO> selectMoviePlayDays(@RequestParam int movieNumber,
			@RequestParam String cinemaName) {
		List<MoviePlayStartVO> moviePlayStartVOs = advanceDao.selectCinemaChoiceList(movieNumber, cinemaName);
		
		if(moviePlayStartVOs != null) {
			return moviePlayStartVOs; //성공
		}
		else {
			return null; //실패
		}
	}//selectMoviePlayDays() end
	

}//AdvanceRestController end
