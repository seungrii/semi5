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
import com.victory.semi5.repository.ImageDao;
import com.victory.semi5.repository.MovieDao;
import com.victory.semi5.vo.HashtagVO;


@Controller
@RequestMapping("/movie")
public class MovieController {
	
	
	
	
	@Autowired 
	MovieDao movieDao;

	@Autowired 
	ImageDao imageDao;
	
	@Autowired 
	CharacterDao characterDao;
	
	@Autowired
	GenreDao genreDao;

	
	

//list시작
	
	@GetMapping("/list")//목록
	public String list(Model model){
//		boolean isSearch = type != null && keyword != null;
//		if(isSearch) {//검색
//			model.addAttribute("list",movieDao.selectList(type,keyword));
//		}
//		else {
//			model.addAttribute("list",movieDao.selectList());
//		}
	
		model.addAttribute("list",movieDao.selectList());
		
		
		return "movie/list";
	}
	
	@GetMapping("/detail")
	public String detail(
			Model model,@RequestParam int movieNumber
//			@ModelAttribute MovieDto moviedto, 
//			CharacterDto characterDto, GenreDto genredto, 
//			@RequestParam String charaterName1, String charaterName2, 
//			String charaterName3, String charaterName4, String charaterName5	
	
			
			) {
	
	    
		model.addAttribute("moviedto", movieDao.selectOne(movieNumber));
		model.addAttribute("characterdto",characterDao.selectList(movieNumber));
		
	//	model.addAttribute("moviedto",characterDao.selectList(movieNumber));
	 //   model.addAttribute("characterdto",characterDao.selectList(movieNumber));
		
//	    model.addAttribute("hashtagvo", movieDao.selectOne(movieNumber));
//	    int genreNo = genredto.getGenreNo();	
//	    model.addAttribute("hashtagvo", genreDao.selectOne(genreNo));	
//			
//		int genreNo = genredto.getGenreNo();		
//		model.addAttribute("hashtagvo",genreDao.selectOne(genreNo));
			
			
		
		//model.addAttribute("characterdto", movieDao.selectOne(movieNumber));
		
//		model.addAttribute("characterdto", characterDao.selectOneDirector(charaterName1));
//		model.addAttribute("characterdto", characterDao.selectOneActor1(charaterName2));
		//characterDao.insertDirector(characterDto, charaterName1);
		//characterDao.insertActor1(characterDto, charaterName2);
		
		
		
//		void insertDirector(CharacterDto characterDto, String charaterName1);
//		void insertActor1(CharacterDto characterDto,String charaterName2);
//		void insertActor2(CharacterDto characterDto,String charaterName3);
//		void insertActor3(CharacterDto characterDto,String charaterName4);
//		void insertActor4(CharacterDto characterDto,String charaterName5);
//		CharacterDto selectOne(int movieNumber);

//		if(!charaterName3.isEmpty()) {			
//			//characterDao.insertActor2(characterDto, charaterName3);
//			model.addAttribute("characterdto", characterDao.selectOneActor2(charaterName3));
//		}
//		if(!charaterName4.isEmpty()) {			
//			model.addAttribute("characterdto", characterDao.selectOneActor3(charaterName4));
//		}
//		if(!charaterName5.isEmpty()) {			
//			model.addAttribute("characterdto", characterDao.selectOneActor4(charaterName5));
//		}
//		
//		
//	   model.addAttribute("hashtagvo", movieDao.selectOne(movieNumber));
//		
//		
//		int genreNo = genredto.getGenreNo();		
//		model.addAttribute("hashtagvo",genreDao.selectOne(genreNo));
		
		return "movie/detail";
		
	}
	
	
	
	

//	
//	@GetMapping("/detail")
//	public String detail(@RequestParam int movieNumber,Model model,
//			@ModelAttribute CharacterDto characterdto , GenreDto genredto			
//		     
//			) {
//		
//
//	
//		//@RequestParam String charaterName1, String charaterName2, 
//		//String charaterName3, String charaterName4, String charaterName5
//		
//		model.addAttribute("moviedto", movieDao.selectOne(movieNumber));
//		
//		
//		
//		model.addAttribute("characterdto", movieDao.selectOne(movieNumber));
//		
//		model.addAttribute("hashtagvo", movieDao.selectOne(movieNumber));
//		
//		
//		int genreNo = genredto.getGenreNo();
//		model.addAttribute("hashtagvo",genreDao.selectOne(genreNo));
//	
//		
//
//		
//		return "movie/detail";
//	}
	

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
//			//	model.addAttribute("genreDto",genreDto);
	
	
//movieDao.insert(moviedto);
	
//		return "movie/list";
//	}
	
	

	
	
	
	
	
	//model은 jsp 불러 올 때 데이터 전달
	//redirect는 다른 컨트롤러를 불러 오는 것
	//redirect전용 어트리부트가 나옴
	
	
