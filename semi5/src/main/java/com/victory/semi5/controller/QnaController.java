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
import com.victory.semi5.entity.QnaDto;
import com.victory.semi5.repository.QnaDao;
import com.victory.semi5.vo.QnaListSearchVO;

@Controller
@RequestMapping("/qna")
public class QnaController {
	
	@Autowired
	private QnaDao qnaDao;
	
	@GetMapping("/write")
	public String write() {
		return "qna/write";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute QnaDto qnaDto,
			HttpSession session, RedirectAttributes attr) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		qnaDto.setQnaWriter(memberId);
		return "qna/list";
	}
	
	@GetMapping("/list")
	public String list(Model model, @ModelAttribute(name="vo") QnaListSearchVO vo) {
		int count = qnaDao.count(vo);
		vo.setCount(count);
		model.addAttribute("list", qnaDao.selectList(vo));
		return "qna/list";
	}
	
	
}
