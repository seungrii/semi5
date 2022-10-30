package com.victory.semi5.controller;

import java.util.HashSet;
import java.util.Set;

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

import com.victory.semi5.constant.SessionConstant;
import com.victory.semi5.entity.NoticeDto;
import com.victory.semi5.error.TargetNotFoundException;
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
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		noticeDto.setAdminId(memberId);
		
		int noticeNo = noticeDao.insert2(noticeDto);
		attr.addAttribute("noticeNo", noticeNo);
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
	
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam int noticeNo, HttpSession session) {
		Set<Integer> history = (Set<Integer>) session.getAttribute("history");
		if(history == null) {
			history = new HashSet<>();
		}
		if(history.add(noticeNo)) {
			model.addAttribute("noticeDto", noticeDao.read(noticeNo));
		}
		else {
			model.addAttribute("noticeDto", noticeDao.selectOne(noticeNo));
		}
		session.setAttribute("history", history);
		return "notice/detail";
	}
	
	@GetMapping("edit")
	public String edit(Model model, @RequestParam int noticeNo) {
		NoticeDto noticeDto = noticeDao.selectOne(noticeNo);
		if(noticeDto == null) {
			throw new TargetNotFoundException();
		}
		model.addAttribute("noticeDto", noticeDto);
		return "notice/edit";
	}
	@PostMapping("edit")
	public String edit(@ModelAttribute NoticeDto noticeDto,
						RedirectAttributes attr) {
		boolean result = noticeDao.update(noticeDto);
		if(result) {
			attr.addAttribute("noticeNo", noticeDto.getNoticeNo());
			return "redirect:detail";
		}
		else {
			throw new TargetNotFoundException();
		}
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int noticeNo) {
		boolean result = noticeDao.delete(noticeNo);
		if(result) {
			return "redirect:list";
		}
		else {
			throw new TargetNotFoundException();
		}
	}
	




}
