package com.victory.semi5.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.victory.semi5.entity.AdminDto;
import com.victory.semi5.entity.CharacterDto;
import com.victory.semi5.entity.CinemaDto;
import com.victory.semi5.entity.GenreDto;
import com.victory.semi5.entity.ImageDto;
import com.victory.semi5.entity.MovieDto;
import com.victory.semi5.entity.UserDto;
import com.victory.semi5.repository.AdminDao;
import com.victory.semi5.repository.AttachmentDao;
import com.victory.semi5.repository.CharacterDao;
import com.victory.semi5.repository.CinemaDao;
import com.victory.semi5.repository.MovieDao;
import com.victory.semi5.repository.UserDao;
import com.victory.semi5.service.ImageService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private CinemaDao cinemaDao;
	@Autowired
	private AttachmentDao attachmentDao;
	@Autowired
	private MovieDao movieDao;
	@Autowired
	private CharacterDao characterDao;
	@Autowired
	private ImageService imageService;
	
	private final File dir = new File("C:\\study\\vic\\upload"); //파일경로
	@PostConstruct //최초 실행 시, 딱 한번만 실행되는 메소드
	public void prepare() {
		dir.mkdirs();
	}
	
	//admin home
	@GetMapping("/home")
	public String home() {
		return "admin/home";
	}
	
//	관리자계정
	//admin 계정추가
	@GetMapping("/adminAdd")
	public String adminAdd() {
		return "admin/adminAdd";
	}
	@PostMapping("/adminAdd")
	public String adminAdd(
			@ModelAttribute AdminDto adminDto) {
		adminDao.addAdmin(adminDto);
		return "redirect:adminAdd";
	}

	//admin 계정조회
	@GetMapping("/adminList")
	public String adminList(
			Model model,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) {
			model.addAttribute("adminList", adminDao.selectList(type, keyword));
		}
		else {
			model.addAttribute("adminList", adminDao.selectList());
		}
		return "admin/adminList";
	}
	@GetMapping("/adminDetail")
	public String adminDetail(
			Model model, @RequestParam String adminId) {
		AdminDto adminDto = adminDao.selectOne(adminId);
		model.addAttribute("adminDto", adminDto);
		return "admin/adminDetail";
	}
	
	//admin 계정수정
	@GetMapping("/adminChange")
	public String adminChange(
			Model model, @RequestParam String adminId) {
		model.addAttribute("adminDto", adminDao.selectOne(adminId));
		return "admin/adminChange";
	}
	@PostMapping("/adminChange")
	public String adminChange(
			@ModelAttribute AdminDto adminDto,
			RedirectAttributes attr) {
		adminDao.changeAdmin(adminDto);
		attr.addAttribute("adminId", adminDto.getAdminId());
		return "redirect:adminDetail";
	}
	
	//admin 계정삭제
	@GetMapping("adminDelete")
	public String adminDelete(
		HttpSession session, @RequestParam String adminId) {
		adminDao.deleteAdmin(adminId);
		String userId = (String)session.getAttribute("LoginId");
		if(userId.equals(adminId)) { //로그인한 관리자 본인이면
			//session 삭제 후, 로그인창이나 메인홈으로 쫓아냄
			session.removeAttribute("LoginId");
			session.removeAttribute("loginGrade");
			return "redirect:/";
		}
		else {
			return "redirect:adminList";
		}
	}
	
	
//	회원정보 조회
	//회원목록
	@GetMapping("/userList")
	public String userList(
			Model model,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) {
			model.addAttribute("userList", userDao.selectList(type, keyword));
		}
		else {
			model.addAttribute("userList", userDao.selectList());
		}
		return "admin/userList";
	}
	//회원상세
	@GetMapping("/userDetail")
	public String userDatail(
			Model model, @RequestParam String userId) {
		UserDto userDto = userDao.selectOne(userId);
		model.addAttribute("userDto", userDto);
		return "admin/userDetail";
	}
	
	
//	지점관리
	//지점관리 - 추가
	@GetMapping("/cinemaAdd")
	public String cinemaAdd() {
		return "admin/cinemaAdd";
	}
	@PostMapping("/cinemaAdd")
	public String cinemaAdd(
			@ModelAttribute CinemaDto cinemaDto,
			@RequestParam List<MultipartFile> attachments) 
					throws IllegalStateException, IOException {
		
		cinemaDao.addCinema(cinemaDto);	//지점추가

		//파일첨부
		for(MultipartFile file : attachments) {
			if(!file.isEmpty()) {
				int fileNumber = imageService.attachmentsUp(attachments, file);	//이미지 추가 service로

				String cinemaPorin = cinemaDto.getCinemaPorin(); //지점명 꺼내기
				attachmentDao.addCinemaImage(cinemaPorin, fileNumber); //지점이미지에 저장						
			}
			
		}
		return "redirect:cinemaAdd";
	}

	//지점관리 - 조회(목록)
	@GetMapping("/cinemaList")
	public String cinemaList(
			Model model,
			@RequestParam(required = false) String type,String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) {
			model.addAttribute("cinemaList", cinemaDao.selectList(type, keyword));
		}
		else {
			model.addAttribute("cinemaList", cinemaDao.selectList());
		}
		return "admin/cinemaList";
	}
	//지점관리 - 조회(상세)
	@GetMapping("/cinemaDetail")
	public String cinemaDetail(
		Model model, @RequestParam String cinemaPorin) {
		
		//지점정보 첨부
		CinemaDto cinemaDto = cinemaDao.selectOne(cinemaPorin);
		model.addAttribute("cinemaDto", cinemaDto);	

		//첨부파일 조회하여 첨부
		model.addAttribute("attachments", attachmentDao.selectCinemaImageList(cinemaPorin));
		
		return "admin/cinemaDetail";
	}
	
	//지점관리 - 수정
	@GetMapping("/cinemaChange")
	public String cinemaChange() {
		return "admin/cinemaChange";
	}
	@PostMapping("/cinemaChange")
	public String cinemaChange(
			RedirectAttributes attr) {
		return "redirect:cinemaDetail";
	}
	//지점관리 - 삭제
	@GetMapping ("/cinemaDelete") 
	public String cinemaDelete() {
		return "redirect:cinemaList";
	}
	
	
//	영화정보 관리
	//영화정보 - 추가
	@GetMapping("/movieAdd")
	public String movieAdd() {
		return "admin/movieAdd";
	}
	@PostMapping("/movieAdd")
	public String movieAdd(
			@ModelAttribute MovieDto moviedto, 
			CharacterDto characterDto, GenreDto genredto, 
			@RequestParam String charaterName1, String charaterName2, 
			String charaterName3, String charaterName4, String charaterName5,
			@RequestParam MultipartFile image) 
					throws IllegalStateException, IOException {
		
		//시퀀스 번호 생성하며 등록하기
		int movieNumber=movieDao.insert2(moviedto);
		characterDto.setMovieNumber(movieNumber);
		
		//imageDao.insert(imageDto);			
		characterDao.insertDirector(characterDto, charaterName1);
		characterDao.insertActor1(characterDto, charaterName2);
		if(!charaterName3.isEmpty()) {			
			characterDao.insertActor2(characterDto, charaterName3);
		}
		if(!charaterName4.isEmpty()) {			
			characterDao.insertActor3(characterDto, charaterName4);
		}
		if(!charaterName5.isEmpty()) {			
			characterDao.insertActor4(characterDto, charaterName5);
		}
		
		//hashtagVo
		movieDao.insertHashtagVO(movieNumber, genredto.getGenreNo());
		
//		//파일첨부
//		if(!image.isEmpty()) {
//			int imageNo = imageService.imageUp(image);	//이미지 추가
//			imageDao.addPoster(movieNumber, imageNo); //영화포스터 추가
//		}
		return "redirect:movieAdd";
	}

	//영화정보 - 조회(목록)
	@GetMapping("/movieList")
	public String movieList() {
		return "admin/movieList";
	}
	//영화정보 - 조회(상세)
	@GetMapping("/movieDetail")
	public String movieDetail() {
		return "admin/movieDetail";
	}
	//영화정보 - 수정
	@GetMapping("/movieChange")
	public String movieChange() {
		return "admin/movieChange";
	}
	@PostMapping("/movieChange")
	public String movieChange(
			RedirectAttributes attr) {
		return "redirect:movieDetail";
	}
	//영화정보 - 삭제
	@GetMapping ("/movieDelete") 
	public String movieDelete() {
		return "redirect:movieList";
	}
	
	
//	@GetMapping("/detailAdmin")
//	public String detail(Model model,@RequestParam int movieNumber ) {
//		model.addAttribute("dto", movieDao.selectOne(movieNumber));
//		return "movie/detailAdmin";
//	}
//	//수정
//	@GetMapping("/edit")
//	public String edit(Model model, @RequestParam int movieNumber) {
//		model.addAttribute("dto",movieDao.selectOne(movieNumber));
//		return "movie/edit";
//	}
//	@PostMapping("/edit")
//	public String edit(@ModelAttribute MovieDto dto,
//			//redirect 전용 저장소(Model의 자식 클래스),리다이렉트를 하는데 데이터를 넘길 경우
//			RedirectAttributes attr) {
//		boolean result=movieDao.update(dto);
//	if(result) {
//			attr.addAttribute("movieNumber",dto.getMovieNumber());
//			//return "redirect:detail?movieNumber="+dto.getMovieNumber();
//			return "redirect:detail";
//		}
//	else {//리스트에 있는 movieNumber가 아니면  edit_fail 페이지로
//		    
//			return "redirect:edit_fail";
//	    }
//  }
//	
//	@GetMapping("/edit_fail")
//	public String editFail() {
//		return "movie/editFail";
//	}
//	
//	//삭제
//	@GetMapping("/delete")
//	public String delete(@RequestParam int movieNumber) {
//		boolean result=movieDao.delete(movieNumber);
//		if(result) {
//			return "redirect:list";
//		}
//		else {
//			return "movie/editFail";
//		}
//	}
	
	
	
	
	
	
	
	
	
	

	
//	영화스케쥴 관리
	//영화스케쥴 - 추가
	@GetMapping("/moviePlayAdd")
	public String moviePlayAdd() {
		return "admin/moviePlayAdd";
	}
	//영화스케쥴 - 조회(목록)
	@GetMapping("/moviePlayList")
	public String moviePlayList() {
		return "admin/moviePlayList";
	}
	//영화정보 - 조회(상세)
	@GetMapping("/moviePlayDetail")
	public String moviePlayDetail() {
		return "admin/movieDetail";
	}
	//영화스케쥴 - 수정
	@GetMapping("/moviePlayChange")
	public String moviePlayChange() {
		return "admin/moviePlayChange";	
	}
	@PostMapping("/moviePlayChange")
	public String moviePlayChange(
			RedirectAttributes attr) {
		return "redirect:moviePlayDetail";
	}
	//영화스케쥴 - 삭제
	@GetMapping("/moviePlayDelete")
	public String moviePlayDelete() {
		return "redirect:moviePlayList";
	}
	
	

	
	//추가사항 : table 디자인css 작성
	//재확인 알람창 필요 (ex. 정말 삭제하시겠습니까?)
	
	
}
