package com.victory.semi5.controller;

import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
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
import com.victory.semi5.entity.UserDto;
import com.victory.semi5.repository.AdminDao;
import com.victory.semi5.repository.BoardDao;
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
				session.setAttribute("LoginId", userDto.getUserId());
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
			HttpSession session) {
		String userId = (String)session.getAttribute("LoginId");
		UserDto userDto = userDao.selectOne(userId);
		List<BoardDto> boardDto = boardDao.selectIdList(userId);
		model.addAttribute("userDto", userDto);
		model.addAttribute("boardDto", boardDto);
		return "user/userMyPage";
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
	public String changePw(@RequestParam String userPw,
			@RequestParam(required = false) String inputId,
			HttpSession session) {
		if(inputId == null) {
			String userId = (String) session.getAttribute("LoginId");
		}
		return "";
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
}




