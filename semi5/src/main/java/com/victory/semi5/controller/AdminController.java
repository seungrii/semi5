package com.victory.semi5.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.victory.semi5.entity.MoviePlayDto;
import com.victory.semi5.entity.UserDto;
import com.victory.semi5.repository.AdminDao;
import com.victory.semi5.repository.AttachmentDao;
import com.victory.semi5.repository.CharacterDao;
import com.victory.semi5.repository.CinemaDao;
import com.victory.semi5.repository.MovieDao;
import com.victory.semi5.repository.MoviePlayDao;
import com.victory.semi5.repository.UserDao;
import com.victory.semi5.service.AttachmentService;
import com.victory.semi5.vo.HashtagVO;
import com.victory.semi5.vo.MoviePlayVO;
import com.victory.semi5.vo.MovieVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	
	
	
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private AttachmentDao attachmentDao;
	@Autowired
	private AttachmentService attachmentService;
	@Autowired
	private CinemaDao cinemaDao;
	@Autowired
	private MovieDao movieDao;
	@Autowired
	private CharacterDao characterDao;
	@Autowired
	private MoviePlayDao moviePlayDao;
	
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
		return "redirect:adminList";
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
				int fileNumber = attachmentService.attachmentsUp(attachments, file);	//이미지 추가 service로

				String cinemaPorin = cinemaDto.getCinemaPorin(); //지점명 꺼내기
				attachmentDao.addCinemaImage(cinemaPorin, fileNumber); //지점이미지에 저장						
			}
		}
		return "redirect:cinemaAdd";
	}
	//지점관리 - 조회(목록)
	@GetMapping("/cinemaList")
	public String cinemaList(Model model,
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
	public String cinemaDetail(Model model, 
			@RequestParam String cinemaPorin) {
		
		//지점정보 첨부
		CinemaDto cinemaDto = cinemaDao.selectOne(cinemaPorin);
		model.addAttribute("cinemaDto", cinemaDto);	

		//첨부파일 조회하여 첨부
		model.addAttribute("attachments", attachmentDao.selectCinemaImageList(cinemaPorin));
		
		return "admin/cinemaDetail";
	}
	//지점관리 - 수정
	@GetMapping("/cinemaChange")
	public String cinemaChange(Model model, 
			@RequestParam String cinemaPorin) {		
		model.addAttribute("cinemaDto", cinemaDao.selectOne(cinemaPorin));
		model.addAttribute("attachments", attachmentDao.selectCinemaImageList(cinemaPorin));
		return "admin/cinemaChange";
	}
	@PostMapping("/cinemaChange")
	public String cinemaChange(@ModelAttribute CinemaDto cinemaDto,
			RedirectAttributes attr,
			@RequestParam List<MultipartFile> attachments) 
				throws IllegalStateException, IOException {
		cinemaDao.changeCinema(cinemaDto);
		attr.addAttribute("cinemaPorin", cinemaDto.getCinemaPorin());
		
		//파일첨부
		for(MultipartFile file : attachments) {
			if(!file.isEmpty()) {
				int fileNumber = attachmentService.attachmentsUp(attachments, file);	//이미지 추가 service로

				String cinemaPorin = cinemaDto.getCinemaPorin(); //지점명 꺼내기
				attachmentDao.addCinemaImage(cinemaPorin, fileNumber); //지점이미지에 저장						
			}
		}
		return "redirect:cinemaDetail";
	}
	//지점이미지만 삭제
	@GetMapping("/cinemaImageDelete")
	public String cinemaImageDelete(
			@RequestParam String cinemaPorin,int fileNumber,
			RedirectAttributes attr) {
		//실제파일 삭제(cinema_image 자동삭제)
		List<ImageDto> attachments = attachmentDao.selectList(fileNumber);
		attachmentService.attachmentsDelete(attachments);
		
		attr.addAttribute("cinemaPorin",cinemaPorin);
		return "redirect:cinemaChange";
	}
	//지점관리 - 삭제
	@GetMapping("/cinemaDelete") 
	public String cinemaDelete(@RequestParam String cinemaPorin) {
		//지점삭제 전, 첨부파일 조회
		List<ImageDto> attachments = attachmentDao.selectCinemaImageList(cinemaPorin);
		
		//지점삭제(DB: cinema_image 자동삭제)
		boolean result = cinemaDao.deleteCinema(cinemaPorin);
		
		if(result) { //지점삭제 성공
			//실제파일 삭제
			attachmentService.attachmentsDelete(attachments);
			return "redirect:cinemaList";
		}
		
		return "redirect:cinemaList";	//삭제실패시, 알람창 필요
	}
	
	
//  영화정보 관리
  //영화정보 - 추가
  @GetMapping("/movieAdd")
  public String movieAdd() {
      return "admin/movieAdd";
  }
  @PostMapping("/movieAdd")
  public String movieAdd(@ModelAttribute MovieVO movieVO,
          List<MultipartFile> attachments) 
                  throws IllegalStateException, IOException {

      //영화테이블 - 시퀀스 번호 생성하며 추가하기
      int movieNumber=movieDao.insert2(movieVO);
      movieVO.setMovieNumber(movieNumber);

      //인물테이블 - 추가
      characterDao.insertDirector1(movieVO);

      characterDao.insertActor1(movieVO);

      if(!movieVO.getActorName2().isEmpty()) {
          characterDao.insertActor2(movieVO);
      }
      if(!movieVO.getActorName3().isEmpty()) {
          characterDao.insertActor3(movieVO);
      }
      if(!movieVO.getActorName4().isEmpty()) {
          characterDao.insertActor4(movieVO);
      }

      //hashtag 테이블 - 추가
      movieDao.insertHashtag(movieNumber, movieVO.getGenreNo());

      //파일첨부
      for(MultipartFile file : attachments) {
          if(!file.isEmpty()) {
              //이미지 추가 service로
              int fileNumber = attachmentService.attachmentsUp(attachments, file);

              //영화번호로 → 영화포스터에 저장
              attachmentDao.addPoster(movieNumber, fileNumber);
          }
      }
      return "redirect:movieList";
  }
  
  

	//영화정보 - 조회(목록)
//	@GetMapping("/movieList")
//	public String movieList() {
//	
//		
//		
//	
//		
//		return "admin/movieList";
////	}
//	//영화정보 - 조회(상세)
//	@GetMapping("/movieDetail")
//	public String movieDetail() {
//		return "admin/movieDetail";
//	}
//	//영화정보 - 수정
//	@GetMapping("/movieChange")
//	public String movieChange() {
//		return "admin/movieChange";
//	}
//	@PostMapping("/movieChange")
//	public String movieChange(
//			RedirectAttributes attr) {
//		return "redirect:movieDetail";
//	}
//	//영화정보 - 삭제
//	@GetMapping ("/movieDelete") 
//	public String movieDelete() {
//		return "redirect:movieList";
//	}
	
	
	

	//영화정보 - 조회 (목록)
	@GetMapping("/movieList")
	public String movieList(Model model,
			@RequestParam(required=false)String type,
			@RequestParam(required=false) String keyword) {
		
		boolean isSearch=type !=null&&keyword !=null;
		if(isSearch) {//검색
			//model.addAttribute("list",movieDao.selectList(type,keyword));
			model.addAttribute("movieList",movieDao.selectMovieViewList(type,keyword));
		}
		else {//목록) 뷰 조회
			model.addAttribute("movieList",movieDao.selectList());
		}
		return "admin/movieList";
	}
	
//	@GetMapping("/moviePlayList")
//	public String moviePlayList( Model model,
//			@RequestParam(required = false) String type,
//			@RequestParam(required = false) String keyword) {
//		boolean isSearch = type != null && keyword != null;
//		if(isSearch) {
//			//뷰 조회) 상영스케쥴-영화정보-상영관정보
//			model.addAttribute("moviePlayList", moviePlayDao.selectMoviePlayViewList(type, keyword));
//		}
//		else {
//			//뷰 조회) 상영스케쥴-영화정보-상영관정보
//			model.addAttribute("moviePlayList", moviePlayDao.selectMoviePlayViewList());		
//		}
//		return "admin/moviePlayList";
//	}
	
	
//상세"/movieDetail"
	@GetMapping("/movieDetail")
	public String movieDetail(Model model,
			@RequestParam int movieNumber ) {
		//MovieVO movieVO = movieDao.selectMovieView(movieNumber);
		//model.addAttribute("movieVO",movieVO)

		MovieDto movieDto = movieDao.selectOne(movieNumber);
		model.addAttribute("movieDto",movieDto);
		
		List<HashtagVO> hashtagVO = movieDao.selectListHashtagVO(movieNumber);
		model.addAttribute("hashtagVOList",hashtagVO);

//		List<CharacterDto> characterDto = characterDao.selectList(movieNumber);
//		model.addAttribute("characterDtoList",characterDto);
		List<CharacterDto> characterDtoDirector = characterDao.selectListDirector(movieNumber);
		model.addAttribute("characterDtoListDirector",characterDtoDirector);
		List<CharacterDto> characterDtoActor = characterDao.selectListActor(movieNumber);
		model.addAttribute("characterDtoListActor",characterDtoActor);
		
		//System.out.println(movieVO.getMovieNumber());
		return "admin/movieDetail";
	}
		///////////////////////////////////////////////////////////
		//지점관리 - 조회(상세)
//		@GetMapping("/cinemaDetail")
//		public String cinemaDetail(Model model, 
//				@RequestParam String cinemaPorin) {
//			
//			//지점정보 첨부
//			CinemaDto cinemaDto = cinemaDao.selectOne(cinemaPorin);
//			model.addAttribute("cinemaDto", cinemaDto);	
//
//			//첨부파일 조회하여 첨부
//			model.addAttribute("attachments", attachmentDao.selectCinemaImageList(cinemaPorin));
//			
//			return "admin/cinemaDetail";
//		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	
	
	//영화스케쥴 - 조회(상세)
//	@GetMapping("/moviePlayDetail")
//	public String moviePlayDetail(Model model,
//			@RequestParam int moviePlayNum) {
//		
//		MoviePlayVO moviePlayVO = moviePlayDao.selectMoviePlayView(moviePlayNum);
//
//	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//	    String moviePlayStart = format.format(moviePlayVO.getMoviePlayStart());
//		String moviePlayStartDate = moviePlayStart.substring(0,10);
//		String moviePlayStartTime = moviePlayStart.substring(11);
//		
//		moviePlayVO.setMoviePlayStartDate(moviePlayStartDate);
//		moviePlayVO.setMoviePlayStartTime(moviePlayStartTime);
//		
//		model.addAttribute("moviePlayVO", moviePlayVO);
//		
//		return "admin/moviePlayDetail";
//	}
//	//영화정보 - 수정	-"/movieChange"
//	@GetMapping("/movieChange")
//	public String movieChange(Model model, @RequestParam int movieNumber) {
//		model.addAttribute("dto",movieDao.selectOne(movieNumber));
//		return "admin/movieChange";
//	}

//
//	@PostMapping("/movieChange")
//	public String movieChange(@ModelAttribute MovieDto dto,RedirectAttributes attr) {
//	boolean result=movieDao.update(dto);
//	if(result) {
//		attr.addAttribute("movieNumber",dto.getMovieNumber());
//		//return "redirect:detail?movieNumber="+dto.getMovieNumber();
//		return "redirect:admin/movieDetail";
//	}
//	
////	else {//리스트에 있는 movieNumber가 아니면  edit_fail 페이지로
////    
////		return "redirect:edit_fail";
////   }
//}
	@GetMapping("/movieDelete")
	public String delete(@RequestParam int movieNumber) {
		boolean result=movieDao.delete(movieNumber);
		if(result) {
			return "redirect:list";
		}
		else {
			return "movie/editFail";
		}
	}
	

	

	
	
	

	
//	영화스케쥴 관리
	//영화스케쥴 - 추가
	@GetMapping("/moviePlayAdd")
	public String moviePlayAdd() {
		return "admin/moviePlayAdd";
	}
	@PostMapping("/moviePlayAdd")
	public String moviePlayAdd(
			@ModelAttribute MoviePlayDto moviePlayDto) throws ParseException {

		String moviePlayStartDate = moviePlayDto.getMoviePlayStartDate();
		String moviePlayStartTime = moviePlayDto.getMoviePlayStartTime();		
		String start = moviePlayStartDate +" "+ moviePlayStartTime;
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date moviePlayStart = transFormat.parse(start);
		moviePlayDto.setMoviePlayStart(moviePlayStart);
		
		moviePlayDao.addMoviePlay(moviePlayDto);
		return "redirect:moviePlayList";
	}
	//영화스케쥴 - 조회(목록)
	@GetMapping("/moviePlayList")
	public String moviePlayList( Model model,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) {
			//뷰 조회) 상영스케쥴-영화정보-상영관정보
			model.addAttribute("moviePlayList", moviePlayDao.selectMoviePlayViewList(type, keyword));
		}
		else {
			//뷰 조회) 상영스케쥴-영화정보-상영관정보
			model.addAttribute("moviePlayList", moviePlayDao.selectMoviePlayViewList());		
		}
		return "admin/moviePlayList";
	}
	//영화스케쥴 - 조회(상세)
	@GetMapping("/moviePlayDetail")
	public String moviePlayDetail(Model model,
			@RequestParam int moviePlayNum) {
		
		MoviePlayVO moviePlayVO = moviePlayDao.selectMoviePlayView(moviePlayNum);

	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	    String moviePlayStart = format.format(moviePlayVO.getMoviePlayStart());
		String moviePlayStartDate = moviePlayStart.substring(0,10);
		String moviePlayStartTime = moviePlayStart.substring(11);
		
		moviePlayVO.setMoviePlayStartDate(moviePlayStartDate);
		moviePlayVO.setMoviePlayStartTime(moviePlayStartTime);
		
		model.addAttribute("moviePlayVO", moviePlayVO);
		
		return "admin/moviePlayDetail";
	}
	//영화스케쥴 - 수정
	@GetMapping("/moviePlayChange")
	public String moviePlayChange(Model model, 
			@RequestParam int moviePlayNum) {
		
		MoviePlayDto moviePlayDto = moviePlayDao.selectOne(moviePlayNum);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String moviePlayStart = format.format(moviePlayDto.getMoviePlayStart());
		String moviePlayStartDate = moviePlayStart.substring(0,10);
		String moviePlayStartTime = moviePlayStart.substring(11);
		
		moviePlayDto.setMoviePlayStartDate(moviePlayStartDate);
		moviePlayDto.setMoviePlayStartTime(moviePlayStartTime);
		
		model.addAttribute("moviePlayDto", moviePlayDto);
		return "admin/moviePlayChange";	
	}
	@PostMapping("/moviePlayChange")
	public String moviePlayChange(@ModelAttribute MoviePlayDto moviePlayDto,
			RedirectAttributes attr) throws ParseException {
		
		String moviePlayStartDate = moviePlayDto.getMoviePlayStartDate();
		String moviePlayStartTime = moviePlayDto.getMoviePlayStartTime();		
		String start = moviePlayStartDate +" "+ moviePlayStartTime;
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date moviePlayStart = transFormat.parse(start);
		moviePlayDto.setMoviePlayStart(moviePlayStart);
		
		moviePlayDao.changeMoviePlay(moviePlayDto);
		
		attr.addAttribute("moviePlayNum", moviePlayDto.getMoviePlayNum());
		return "redirect:moviePlayDetail";
	}
	//상영스케쥴 - 삭제
	@GetMapping("/moviePlayDelete")
	public String moviePlayDelete(@RequestParam int moviePlayNum) {
		moviePlayDao.deleteMoviePlay(moviePlayNum);
		return "redirect:moviePlayList";	//삭제실패시, 알람창 필요
	}
	
	

	// Q&A 답변
	@GetMapping("/qnaAsking")
	public String qnaAsking() {
		return "admin/askingList";
	}	
	//추가사항 : table 디자인css 작성
	//재확인 알람창 필요 (ex. 정말 삭제하시겠습니까?)
	
	
}
