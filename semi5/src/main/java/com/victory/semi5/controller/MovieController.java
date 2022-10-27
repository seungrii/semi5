package com.victory.semi5.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.victory.semi5.entity.CharacterDto;
import com.victory.semi5.entity.GenreDto;
import com.victory.semi5.entity.MovieDto;
import com.victory.semi5.repository.CharacterDao;
import com.victory.semi5.repository.GenreDao;
import com.victory.semi5.repository.MovieDao;
import com.victory.semi5.vo.HashtagVO;


@Controller
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired 
	MovieDao movieDao;
//
//	@Autowired 
//	ImageDao imageDao;
	
	@Autowired 
	CharacterDao characterDao;
	
	@Autowired
	GenreDao genreDao;
	

//list시작
	
	@GetMapping("/list")//목록
	public String list(Model model,
								@RequestParam(required=false) String type,
								@RequestParam(required=false) String keyword){
		boolean isSearch = type != null && keyword != null;
		if(isSearch) {//검색
			model.addAttribute("list",movieDao.selectList(type,keyword));
		}
		else {
			model.addAttribute("list",movieDao.selectList());
		}
		
		
		return "movie/list";
	}
	
//	@GetMapping("/list")//목록
//	public String list(Model model,
//								@RequestParam(required=false) String type,
//								@RequestParam(required=false) String keyword){
//		boolean isSearch = type != null && keyword != null;
//		if(isSearch) {//검색
//			model.addAttribute("list",imageDao.selectList(type,keyword));
//		}
//		else {
//			model.addAttribute("list",movieDao.selectList());
//		}
//		
//		
//		return "movie/list";
//	}

	
	
	
	
	
	//model은 jsp 불러 올 때 데이터 전달
	//redirect는 다른 컨트롤러를 불러 오는 것
	//redirect전용 어트리부트가 나옴
	
	
}