package com.victory.semi5.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.victory.semi5.entity.BoardDto;
import com.victory.semi5.repository.BoardDao;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardDao boardDao;
	
	@GetMapping("/write")
	public String write() {
		return "board/write";
	}
	
	@PostMapping("/write")
	public String write(
			@ModelAttribute BoardDto boardDto){
		
		//...
		boardDao.insert(boardDto);
//		String userId = (String)session.getAttribute(SessionConstant.ID);
		return "redirect:list";
	}

//	@GetMapping("/edit")
//	public String edit(Model model, @RequestParam int boardNo) {
//		model.addAttribute("dto", boardDao.selectOne(boardNo));
//		return "board/edit";
//	}
	
//	@GetMapping("/list")
//	public String list(Model model) {
//		model.addAttribute("list", boardDao.selectList());
//		return "board/list";
//	}

	
//	@GetMapping("/search")
//	
//	@GetMapping("/detail")
//	
//	@GetMapping("/delete")
}
