package com.victory.semi5.controller;

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
import com.victory.semi5.entity.BoardDto;
import com.victory.semi5.error.TargetNotFoundException;
import com.victory.semi5.repository.BoardDao;
import com.victory.semi5.vo.BoardListSearchVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardDao boardDao;
	
	
	//등록 
	@GetMapping("/write")
	public String write() {
		return "board/write";
	}
	
	@PostMapping("/write")
	public String write(
			@ModelAttribute BoardDto boardDto,
			HttpSession session, RedirectAttributes attr) {
		
		// session에 있는 아이디를 작성자로 추가한 뒤 등록
//		String memberId = (String)session.getAttribute("LoginId");
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		boardDto.setBoardWriter(memberId);
		
		int boardNo = boardDao.insert2(boardDto);
		attr.addAttribute("boardNo", boardNo);
		
//		return "redirect:list";
		
		//문제점 : 등록 후에 상세를 갈 때 등록은 되는데 몇 번인지 모름 boardtest2
		//해결책 : boardtest2 , 등록한 데이터 번호?
		return "redirect:detail";
	}
	
//	@GetMapping("/write_success")
//	public String writeSuccess() {
//		return "board/list";
//	}
	
	//목록 및 검색
	@GetMapping("/list")
	public String list(Model model, //데이터를 넘겨야 하면 무조건 모델
//			@RequestParam(required = false) String type,
//			@RequestParam(required = false) String keyword
			@ModelAttribute(name="vo") BoardListSearchVO vo) {
//		boolean search = type != null && keyword != null;
//		List<BoardDto> data;
		//검색
//		if(search) {
//			model.addAttribute("list", boardDao.selectList(type, keyword));
//		}
//		//목록
//		else {
//			model.addAttribute("list", boardDao.selectList());
//		}
		if(vo.isSearch()) {
			model.addAttribute("list", boardDao.selectList(vo));
		}
		else {
			model.addAttribute("list", boardDao.selectList());
		}
//		model.addAttribute("list", boardDao.selectList());
		return "board/list";
	}
	
	//상세
	@GetMapping("/detail")
	public String detail(Model model,
			@RequestParam int boardNo) {
		
		//조회수 증가
		
//		1. 조회수 증가시켜서 데이터를 불러온다
//		boardDao.updateReadCount(boardNo);
//		model.addAttribute("dto", boardDao.selectOne(boardNo));
		
//		2. 데이터를 읽도록 처리한다
		model.addAttribute("boardDto", boardDao.read(boardNo));
		return "board/detail";

	}

	//수정
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam int boardNo) {
		BoardDto boardDto = boardDao.selectOne(boardNo);
		if(boardDto == null) {//없는 경우 내가 만든 예외 발생
			throw new TargetNotFoundException();
		}
		model.addAttribute("boardDto", boardDto);
		return "board/edit";

//		model.addAttribute("dto", boardDao.selectOne(boardNo));
		
//		boolean result = boardDao.update(boardDto);
//		if(result) {
////			attr.addAttribute("boardNo", boardDto.getBoardNo());
////			return "redirect:detail";
//			return "변경 성공";
//		}
//		else {//실패했다면 오류 발생
////			throw new TargetNotFoundException();
//			return "없는 번호";
//		}
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute BoardDto boardDto,
			RedirectAttributes attr) {
		boolean result = boardDao.update(boardDto);
		if(result) {//성공했다면 상세페이지로 이동
//			return "redirect:detail?boardNo="+boardDto.getBoardNo(); (비추천)
			attr.addAttribute("boardNo", boardDto.getBoardNo());
			return "redirect:detail";
		}
		else {//실패했다면 오류 발생
			throw new TargetNotFoundException();
//			return "redirect:edit_fail";
		}
	}
	
//	@GetMapping("/edit_fail")
//	public String editFail() {
//		return "board/edit_fail";
//	}
	
	//삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int boardNo) {
		boolean result = boardDao.delete(boardNo);
		if(result) {
			return "redirect:list";
		}
		else {//구문은 실행되었지만 바뀐 게 없는 경우(강제 예외 처리)
			throw new TargetNotFoundException();
		}
	}
	
}