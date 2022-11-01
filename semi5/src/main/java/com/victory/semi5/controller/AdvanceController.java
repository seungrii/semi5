package com.victory.semi5.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.victory.semi5.constant.SessionConstant;
import com.victory.semi5.entity.CinemaDto;
import com.victory.semi5.entity.MovieDto;
import com.victory.semi5.entity.TicketingDto;
import com.victory.semi5.repository.AdvanceDao;
import com.victory.semi5.vo.AdvanceConfirmVO;
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
	}//movieList() end
	
	@PostMapping("/insert")
	public String insertAdvance(@RequestParam int moviePlayNum, @RequestParam int seatNum,
			HttpSession session, @ModelAttribute TicketingDto ticketingDto,
			HttpServletResponse response) throws IOException {
		AdvanceConfirmVO confirm = advanceDao.selectConfirm(moviePlayNum, seatNum);
		
		String userId = (String)session.getAttribute(SessionConstant.ID);
		ticketingDto.setUserId(userId);
		
		if(confirm == null) {
			advanceDao.insertAdvance(ticketingDto);
			return "/";
		}
		else {
			response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>alert('이미 예매된 좌석입니다. 다시 예약 해주세요');history.go(-1);</script>");
	         out.flush();
	         return "advance/list";
		}
		
	}
	
}
