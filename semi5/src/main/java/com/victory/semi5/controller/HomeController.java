package com.victory.semi5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.victory.semi5.repository.AttachmentDao;
import com.victory.semi5.repository.BoardDao;
import com.victory.semi5.repository.MovieDao;
import com.victory.semi5.repository.NoticeDao;
import com.victory.semi5.vo.BoardListSearchVO;
import com.victory.semi5.vo.NoticeListSearchVO;

@Controller
public class HomeController {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private BoardDao boardDao;;
	
	@Autowired
	private MovieDao movieDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	
	
	@RequestMapping("/")
	public String Home(Model model,
			@ModelAttribute(name="noticeVo") NoticeListSearchVO noticeVo,
			@ModelAttribute(name="boardVo") BoardListSearchVO boardVo
			) {
		
				int count = noticeDao.count(noticeVo);
				noticeVo.setCount(count);
				model.addAttribute("list", noticeDao.selectList(noticeVo));
				
				int count2 = boardDao.count(boardVo);
				boardVo.setCount(count);
				
				model.addAttribute("boardList", boardDao.selectList(boardVo));
				
				model.addAttribute("movieList",movieDao.selectList3());
				model.addAttribute("imageDto", attachmentDao.selectPosterList3()); //첨부

				return "home";
	}
	@GetMapping("/keywordSearch")
	public String keywordSearch(Model model,
			@RequestParam (required = false) String movieName) {
		if(movieName != null) {
			model.addAttribute("movieDto", movieDao.selectSearch(movieName));
			model.addAttribute("imageDto", attachmentDao.keywordSearchPosterList(movieName));
			
		}else {
			model.addAttribute("movieDto", null);
		}
		return "movie/homeSearch";
	}
	
}
