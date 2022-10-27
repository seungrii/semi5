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
	

	
	
	
	
	@GetMapping("/insert")
	public String insert() {

		return "movie/insert";
	}
//insert시작
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute MovieDto moviedto,CharacterDto characterDto,GenreDto genredto,RedirectAttributes attr)  {
//		DB insert
		
	
	
		movieDao.insert(moviedto);
		
		//시퀀스 번호 생성하며 등록하기
		int movieNumber=movieDao.insert2(moviedto);
		attr.addAttribute("movieNumber",movieNumber);
		
		
		characterDto.setMovieNumber(movieNumber);
		
		//imageDao.insert(imageDto);
		characterDao.insert(characterDto);
		
		int genreNo=genreDao.insert2(genredto);
		attr.addAttribute("genreNo",genreNo);
		
		//hashtagVo
		movieDao.insertHashtagVO(movieNumber, genreNo);
		
		
		
		
		
	
		
//		insert_success 매핑으로 redirect(강제이동) 처리하세요
		return "redirect:insert_success";
	}
	
//	@PostMapping("/insert")
//	public String insert(@ModelAttribute ImageDto dto) {
////		DB insert
//		
//		imageDao.insert(dto);
//		
////	insert_success 매핑으로 redirect(강제이동) 처리하세요
//		return "redirect:insert_success";
//	}
//	
//	@PostMapping("/insert")
//	public String insert(@ModelAttribute CharacterDto dto) {
////		DB insert
//		
//	characterDao.insert(dto);
//	//void insert(CharacterDto dto);//데이터 넣기   
//	
//	
////		insert_success 매핑으로 redirect(강제이동) 처리하세요
//		return "redirect:insert_success";
//	}
	
	
	
	
	@GetMapping("/insert_success")
	public String insertSuccess() {

		return "movie/insertSuccess";
	}


	
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
	@GetMapping("/detailAdmin")
	public String detail(Model model,@RequestParam int movieNumber ) {
		model.addAttribute("dto", movieDao.selectOne(movieNumber));
		return "movie/detailAdmin";
	}
	//수정
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam int movieNumber) {
		model.addAttribute("dto",movieDao.selectOne(movieNumber));
		return "movie/edit";
	}
	@PostMapping("/edit")
	public String edit(@ModelAttribute MovieDto dto,
			//redirect 전용 저장소(Model의 자식 클래스),리다이렉트를 하는데 데이터를 넘길 경우
			RedirectAttributes attr) {
		boolean result=movieDao.update(dto);
	if(result) {
			attr.addAttribute("movieNumber",dto.getMovieNumber());
			//return "redirect:detail?movieNumber="+dto.getMovieNumber();
			return "redirect:detail";
		}
	else {//리스트에 있는 movieNumber가 아니면  edit_fail 페이지로
		    
			return "redirect:edit_fail";
	    }
  }
	
	@GetMapping("/edit_fail")
	public String editFail() {
		return "movie/editFail";
	}
	
	//삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int movieNumber) {
		boolean result=movieDao.delete(movieNumber);
		if(result) {
			return "redirect:list";
		}
		else {
			return "movie/editFail";
		}
	}
	
	
	
	
	//model은 jsp 불러 올 때 데이터 전달
	//redirect는 다른 컨트롤러를 불러 오는 것
	//redirect전용 어트리부트가 나옴
	
	
}