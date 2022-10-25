package com.victory.semi5.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.victory.semi5.constant.SessionConstant;
import com.victory.semi5.entity.NoticeDto;
import com.victory.semi5.repository.NoticeDao;
import com.victory.semi5.vo.NoticeListSearchVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeDao noticeDao;
	
	@GetMapping("/write")
	public String write() {
		return "notice/write";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute NoticeDto noticeDto,
						HttpSession session,
						RedirectAttributes attr) {
		String adminId = (String)session.getAttribute(SessionConstant.ID);
		noticeDto.setAdminId(adminId);
		
		int noticeNo = noticeDao.write2(noticeDto);
		attr.addAttribute("noticeNo", noticeDto);
		return "redirect:detail";
	}

	@GetMapping("/list")
	public String list(Model model,
						@ModelAttribute(name="vo") NoticeListSearchVO vo){
		int count = noticeDao.count(vo);
		vo.setCount(count);
		model.addAttribute("list", noticeDao.selectList(vo));
		return "notice/list";
	}




}
