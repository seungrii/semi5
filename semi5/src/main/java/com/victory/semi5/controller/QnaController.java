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
import com.victory.semi5.entity.QnaDto;
import com.victory.semi5.error.TargetNotFoundException;
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
		
		int qnaNo = qnaDao.insert2(qnaDto);
		attr.addAttribute("qnaNo", qnaNo);
		
		return "redirect:detail";
	}
	
	@GetMapping("/list")
	public String list(Model model, @ModelAttribute(name="vo") QnaListSearchVO vo) {
		int count = qnaDao.count(vo);
		vo.setCount(count);
		model.addAttribute("list", qnaDao.selectList(vo));
		return "qna/list";
	}
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam int qnaNo, HttpSession session) {
		Set<Integer> history = (Set<Integer>) session.getAttribute("history");
		if(history == null) {
			history = new HashSet<>();
		}
		if(history.add(qnaNo)) {
			model.addAttribute("qnaDto", qnaDao.read(qnaNo));
		}
		else {//추가가 안된 경우 - 읽은 적이 있는 번호면
			model.addAttribute("qnaDto", qnaDao.selectOne(qnaNo));
		}
		session.setAttribute("history", history);
//		(+추가) 댓글 목록을 조회하여 첨부
		model.addAttribute("qnaReplyList", qnaDao.selectList(qnaNo));

		return "qna/detail";
	}
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam int qnaNo) {
		QnaDto qnaDto = qnaDao.selectOne(qnaNo);
		if(qnaDto == null) {
			throw new TargetNotFoundException();
		}
		model.addAttribute("qnaDto", qnaDto);
		return "qna/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute QnaDto qnaDto, RedirectAttributes attr){
		boolean result = qnaDao.update(qnaDto);
		if(result) {//성공했다면 상세페이지로 이동
//			return "redirect:detail?boardNo="+boardDto.getBoardNo(); (비추천)
			attr.addAttribute("qnaNo", qnaDto.getQnaNo());
			return "redirect:detail";
		}
		else {//실패했다면 오류 발생
			throw new TargetNotFoundException();
//			return "redirect:edit_fail";
		}
	}
	 
	@GetMapping("/delete")
	public String delete(@RequestParam int qnaNo) {
		boolean result = qnaDao.delete(qnaNo);
		if(result) {
			return "redirect:list";
		}
		else {
			throw new TargetNotFoundException();
		}
	}
	
	@PostMapping("/qnaReply/write")
	public String qnaReplyWrite(
			@ModelAttribute QnaDto qnaDto,
			RedirectAttributes attr, HttpSession session) {
		String admin = (String)session.getAttribute(SessionConstant.ID);
		qnaDto.setAdminId(admin);
		qnaDao.insertReply(qnaDto);
		
		attr.addAttribute("qnaNo", qnaDto.getQnaNo());
		return "redirect:/qna/detail";
	}
	
	
	
}
