package com.victory.semi5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.victory.semi5.entity.CinemaDto;
import com.victory.semi5.repository.AdminDao;
import com.victory.semi5.repository.AttachmentDao;
import com.victory.semi5.repository.CharacterDao;
import com.victory.semi5.repository.CinemaDao;
import com.victory.semi5.repository.GenreDao;
import com.victory.semi5.repository.MovieDao;
import com.victory.semi5.repository.MoviePlayDao;
import com.victory.semi5.repository.OneQnaDao;
import com.victory.semi5.repository.UserDao;
import com.victory.semi5.service.AttachmentService;

@Controller
@RequestMapping("/cinema")
public class CinemaController {
	
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private AttachmentDao attachmentDao;
	@Autowired
	private AttachmentService attachmentService;
	@Autowired
	private CinemaDao cinemaDao;
	@Autowired
	private MovieDao movieDao;
	@Autowired
	private CharacterDao characterDao;
	@Autowired
	private MoviePlayDao moviePlayDao;
	@Autowired
	private GenreDao genreDao;
	@Autowired
	private OneQnaDao oneQnaDao;
	
	@GetMapping("/home")
	public String cinemaList(Model model,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) {
			model.addAttribute("cinemaList", cinemaDao.selectList(type, keyword));
		}
		else {
			model.addAttribute("cinemaList", cinemaDao.selectList());
		}
		return "cinema/home";
	}
	
	@GetMapping("/cinemaDetail")
	public String cinemaDetail(Model model, 
			@RequestParam String cinemaPorin) {
		
		//지점정보 첨부
		CinemaDto cinemaDto = cinemaDao.selectOne(cinemaPorin);
		model.addAttribute("cinemaDto", cinemaDto);	

		//첨부파일 조회하여 첨부
		model.addAttribute("attachments", attachmentDao.selectCinemaImageList(cinemaPorin));
		
		return "cinema/detail";
	}
	
	
}
