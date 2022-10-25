package com.victory.semi5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.victory.semi5.entity.MovieDto;
import com.victory.semi5.repository.MovieDao;





@Controller
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired 
	MovieDao movieDao;
	
	
	@GetMapping("/insert")
	public String insert() {

		return "movie/insert";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute MovieDto dto) {
//		DB insert
		movieDao.insert(dto);
		
//		insert_success 매핑으로 redirect(강제이동) 처리하세요
		return "redirect:insert_success";
	}
	
	@GetMapping("/insert_success")
	public String insertSuccess() {

		return "movie/insertSuccess";
	}

	
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
	
	@GetMapping("/detail")
	public String detail(Model model,@RequestParam int movieNumber ) {
		model.addAttribute("dto", movieDao.selectOne(movieNumber));
		return "movie/detail";
	}
	//수정
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam int movieNumber) {
		model.addAttribute("dto",movieDao.selectOne(movieNumber));
		return "수정입력페이지";
	}
//	@PostMapping("/edit")
//	public String edit(@ModelAttribute MovieDto dto,
//			//redirect 전용 저장소(Model의 자식 클래스)
//			RedirectAttributes attr) {
//		boolean result=movieDao.update(dto);
//		if(result) {
//			attr
//			//return "redirect:detail?movieNumber="+dto.getMovieNumber();
//			return "redirect:detail";
//		}
//		else {
//		return "redirect:edit_fail";
//	    }
//  }
	
	
	
	
}