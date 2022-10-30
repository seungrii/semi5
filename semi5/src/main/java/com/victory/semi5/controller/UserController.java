package com.victory.semi5.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.victory.semi5.constant.SessionConstant;
import com.victory.semi5.entity.AdminDto;
import com.victory.semi5.entity.BoardDto;
import com.victory.semi5.entity.OneQnaDto;
import com.victory.semi5.entity.UserDto;
import com.victory.semi5.repository.AdminDao;
import com.victory.semi5.repository.BoardDao;
import com.victory.semi5.repository.OneQnaDao;
import com.victory.semi5.repository.UserDao;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private OneQnaDao oneQnaDao;
	
	@GetMapping("/login")
	public String login() { 
		return "user/login";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute UserDto userDto,
			HttpSession session, @RequestParam String rank) {
		if(rank.equals("off")) {
			UserDto findDto = userDao.selectOne(userDto.getUserId());
			if(findDto==null) {
				return "redirect:login?error";
			}
			boolean passwordMatch = userDto.getUserPw().equals(findDto.getUserPw());
			if(passwordMatch) {
				session.setAttribute("LoginId", userDto.getUserId());
				return "redirect:/";
			}else {
				return "redirect:login?error";
			}			
		}else if(rank.equals("on")){
			AdminDto findDto = adminDao.selectOne(userDto.getUserId());
			if(findDto == null) {
				return "redirect:login?error";
			}
			boolean passwordMatch = userDto.getUserPw().equals(findDto.getAdminPw());
			if(passwordMatch) {

				session.setAttribute(SessionConstant.ID, userDto.getUserId());
				session.setAttribute(SessionConstant.GRADE, "관리자");

				return "redirect:/";
			}else {
				return "redirect:login?error";
			}		
		}else {
			return "redirect:login?error";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("LoginId");
		session.removeAttribute("loginGrade");
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public String join() {
		return "user/join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute UserDto userDto,
			@RequestParam MultipartFile userProfile) throws IllegalStateException, IOException {
		userDao.join(userDto);
		
		File directory = new File("C:/dev/user");
		directory.mkdirs();
		File target = new File(directory, userDto.getUserId());
		userProfile.transferTo(target);
		
		return "redirect:login";
	}
	
	@GetMapping("/download")
	@ResponseBody
	public ResponseEntity<ByteArrayResource> download(
			@RequestParam String userId) throws IOException{
		File directory = new File("C:/dev/user");
		File target = new File(directory, userId);
		
		if(target.exists()) {
			byte[] date = FileUtils.readFileToByteArray(target);
			ByteArrayResource resource = new ByteArrayResource(date);
			
			return ResponseEntity.ok()
					.header("Content-Encoding", "UTF-8")
					.header("Content-Length", String.valueOf(date.length))
					.header("Content-Disposition", "attachment; filename="+userId)
					.header("Content-Type", "application/octet-stream")
					.body(resource);
		}else {
			return ResponseEntity.notFound().build();
		}
	}
	
	@GetMapping("/mypage")
	public String mypage(Model model,
			HttpSession session, RedirectAttributes attr) {
		String userId = (String)session.getAttribute("LoginId");

		UserDto userDto = userDao.selectOne(userId);
		model.addAttribute("userDto", userDto);

//		boolean admin = session.getAttribute("loginGrade") != null;
		boolean admin = session.getAttribute("loginGrade") == "관리자";
		
		if(admin) {	//관리자 로그인일 경우
			attr.addAttribute("adminId", userId);
			return "redirect:/admin/adminDetail";
		}
		else {			
			model.addAttribute("userDto", userDto);
			return "user/userMyPage";
		}

	}
	@GetMapping("/idFind")
	public String idFind() {
		return "user/idFind";
	}
	@GetMapping("/pwFind")
	public String pwFind() {
		return "user/pwFind";
	}

	@GetMapping("/delete")
	public String delete() {
		return "user/delete";
	}
	@PostMapping("/delete")
	public String delete(@RequestParam String userPw,
			HttpSession session) {
		String userId = (String)session.getAttribute("LoginId");
		UserDto userDto = userDao.selectOne(userId);
		if(userDto==null) {
			return "redirect:delete?error";
		}
		if(userPw.equals(userDto.getUserPw())) {
			userDao.delete(userId);
			session.removeAttribute(SessionConstant.ID);
			session.removeAttribute(SessionConstant.GRADE);
			
			return "redirect:/";
		}else {			
			return "redirect:delete?error";
		}
	}
	@GetMapping("/changePwFind")
	public String changePwFind() {
		return "user/changePwFind";
	}
	@PostMapping("/changePwFind")
	public String changePwFind(HttpSession session,
			@RequestParam String userPw) {
		String userId = (String)session.getAttribute("LoginId");
		UserDto userDto = userDao.selectOne(userId);
		if(userDto==null) {
			return "redirect:changePwFind?error";
		}
		if(userPw.equals(userDto.getUserPw())) {
			return "redirect:changePw";
		}else {
			return "redirect:changePwFind?error";
		}
	}
	@GetMapping("/changePw")
	public String changePw() {
		return "user/changePw";
	}
	@PostMapping("changePw")
	public String changePw(HttpSession session,
			@RequestParam String userPw) {
		String userId = (String)session.getAttribute("LoginId");
		UserDto userDto = userDao.selectOne(userId);
		userDto.setUserPw(userPw);
		
		boolean result = userDao.pwupdate(userDto);
		if(result) {
			return "redirect:logout";			
		}else {
			return "redirect:changePw?error";
		}
	}
	
	@GetMapping("/change")
	public String change() {
		return "user/change";
	}
	@PostMapping("/change")
	public String change(HttpSession session,
			@RequestParam String userPw) {
		String userId = (String)session.getAttribute("LoginId");
		UserDto userDto = userDao.selectOne(userId);
		if(userDto==null) {
			return "redirect:change?error";
		}
		if(userPw.equals(userDto.getUserPw())) {
			return "redirect:userChange";
		}else {
			return "redirect:change?error";
		}
	}
	@GetMapping("/userChange")
	public String userChange(Model model,
			HttpSession session) {
		String userId = (String)session.getAttribute("LoginId");
		model.addAttribute("userDto", userDao.selectOne(userId));
		return "user/userChange";
	}
	@PostMapping("/userChange")
	public String userChange(@ModelAttribute UserDto userDto,
			HttpSession session,RedirectAttributes attr) {
		String userId = (String)session.getAttribute("LoginId");
		userDto.setUserId(userId);
		boolean result = userDao.update(userDto);
		if(result) {
			attr.addAttribute("userId", userId);
			return "redirect:mypage";
		}else {
			return "redirect:userChange?error";
		}
	}
	@GetMapping("/oneQna")
	public String oneQna() {
		return "user/oneQna";
	}
	
	@PostMapping("/oneQna")
	public String oneQna(@ModelAttribute OneQnaDto oneQnaDto,
			HttpSession session) {
		String userId = (String)session.getAttribute(SessionConstant.ID);
		oneQnaDto.setUserId(userId);
		oneQnaDao.insert(oneQnaDto);
		return "redirect:mypage";
	}
	
	@GetMapping("/oneQnaList")
	public String oneQnaList(Model model
			,HttpSession session) {
		String userId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("oneQnaDto", oneQnaDao.selectIdList(userId));
		return "user/oneQnaList";
	}
	@GetMapping("/oneQnaDetail")
	public String oneQnaDetail(Model model,
			@RequestParam int askingNo, HttpSession session) {
		model.addAttribute("oneQnaDto", oneQnaDao.selectOne(askingNo));
		return "user/qnaDetail";
	}
	
	@GetMapping("/boardList")
	public String boardList(Model model,
			HttpSession session) {
		String userId = (String)session.getAttribute("LoginId");
		List<BoardDto> boardDto = boardDao.selectIdList(userId);
		model.addAttribute("boardDto", boardDto);
		return "user/boardList";
	}
}




