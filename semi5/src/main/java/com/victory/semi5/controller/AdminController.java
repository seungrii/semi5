package com.victory.semi5.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.victory.semi5.entity.ImageDto;
import com.victory.semi5.entity.MovieDto;
import com.victory.semi5.entity.MoviePlayDto;
import com.victory.semi5.entity.UserDto;
import com.victory.semi5.repository.AdminDao;
import com.victory.semi5.repository.AttachmentDao;
import com.victory.semi5.repository.CharacterDao;
import com.victory.semi5.repository.CinemaDao;
import com.victory.semi5.repository.GenreDao;
import com.victory.semi5.repository.MovieDao;
import com.victory.semi5.repository.MoviePlayDao;
import com.victory.semi5.repository.OneQnaDao;
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
	@Autowired
	private GenreDao genreDao;
	@Autowired
	private OneQnaDao oneQnaDao;
	
	private final File dir = new File("D:\\upload\\kh10E"); //????????????
	@PostConstruct //?????? ?????? ???, ??? ????????? ???????????? ?????????
	public void prepare() {
		dir.mkdirs();
	}
	
	//admin home
	@GetMapping("/home")
	public String home() {
		return "admin/home";
	}
	
//	???????????????
	//admin ????????????
	@GetMapping("/adminAdd")
	public String adminAdd() {
		return "admin/adminAdd";
	}
	@PostMapping("/adminAdd")
	public String adminAdd(@ModelAttribute AdminDto adminDto) {
		adminDao.addAdmin(adminDto);
		return "redirect:adminList";
	}
	//admin ????????????
	@GetMapping("/adminList")
	public String adminList(Model model,
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
	
	@GetMapping("/mypage")
	public String mypage(Model model,
			HttpSession session, RedirectAttributes attr) {
		String userId = (String)session.getAttribute("LoginId");

		UserDto userDto = userDao.selectOne(userId);
		model.addAttribute("userDto", userDto);

//		boolean admin = session.getAttribute("loginGrade") != null;
		boolean admin = session.getAttribute("loginGrade") == "?????????";
		
		if(admin) {	//????????? ???????????? ??????
			attr.addAttribute("adminId", userId);
			return "redirect:/admin/adminDetail";
		}
		else {			
			model.addAttribute("userDto", userDto);
			
			//???????????? ???????????? ??????
			model.addAttribute("attachments", attachmentDao.selectProfileImageList(userId));
			return "user/userMyPage";
		}
	}
	//admin ????????????
	@GetMapping("/adminChange")
	public String adminChange(
			Model model, @RequestParam String adminId) {
		model.addAttribute("adminDto", adminDao.selectOne(adminId));
		return "admin/adminChange";
	}
	@PostMapping("/adminChange")
	public String adminChange(@ModelAttribute AdminDto adminDto,
			RedirectAttributes attr) {
		adminDao.changeAdmin(adminDto);
		attr.addAttribute("adminId", adminDto.getAdminId());
		return "redirect:adminDetail";
	}
	//admin ????????????
	@GetMapping("adminDelete")
	public String adminDelete(HttpSession session, 
			@RequestParam String adminId) {
		adminDao.deleteAdmin(adminId);
		String userId = (String)session.getAttribute("LoginId");
		if(userId.equals(adminId)) { //???????????? ????????? ????????????
			//session ?????? ???, ?????????????????? ??????????????? ?????????
			session.removeAttribute("LoginId");
			session.removeAttribute("loginGrade");
			return "redirect:/";
		}
		else {
			return "redirect:adminList";
		}
	}
	
	
//	???????????? ??????
	//????????????
	@GetMapping("/userList")
	public String userList(Model model,
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
	//????????????
	@GetMapping("/userDetail")
	public String userDatail(Model model, @RequestParam String userId) {
		UserDto userDto = userDao.selectOne(userId);
		model.addAttribute("userDto", userDto);
		//???????????? ???????????? ??????
		model.addAttribute("attachments", attachmentDao.selectProfileImageList(userId));
		return "admin/userDetail";
	}
	
	
//	????????????
	//???????????? - ??????
	@GetMapping("/cinemaAdd")
	public String cinemaAdd() {
		return "admin/cinemaAdd";
	}
	@PostMapping("/cinemaAdd")
	public String cinemaAdd(@ModelAttribute CinemaDto cinemaDto,
			@RequestParam List<MultipartFile> attachments) 
					throws IllegalStateException, IOException {
		//????????????
		cinemaDao.addCinema(cinemaDto);

		//????????????
		for(MultipartFile file : attachments) {
			if(!file.isEmpty()) {
				int fileNumber = attachmentService.attachmentsUp(attachments, file);	//????????? ?????? service???

				String cinemaPorin = cinemaDto.getCinemaPorin(); //????????? ?????????
				attachmentDao.addCinemaImage(cinemaPorin, fileNumber); //?????????????????? ??????						
			}
		}
		return "redirect:cinemaAdd";
	}
	//???????????? - ??????(??????)
	@GetMapping("/cinemaList")
	public String cinemaList(Model model,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) {
			model.addAttribute("cinemaList", cinemaDao.selectList(type, keyword));
		}
		else {
			model.addAttribute("cinemaList", cinemaDao.selectList());
		}
		return "admin/cinemaList";
	}
	//???????????? - ??????(??????)
	@GetMapping("/cinemaDetail")
	public String cinemaDetail(Model model, 
			@RequestParam String cinemaPorin) {
		
		//???????????? ??????
		CinemaDto cinemaDto = cinemaDao.selectOne(cinemaPorin);
		model.addAttribute("cinemaDto", cinemaDto);	

		//???????????? ???????????? ??????
		model.addAttribute("attachments", attachmentDao.selectCinemaImageList(cinemaPorin));
		
		return "admin/cinemaDetail";
	}
	//???????????? - ??????
	@GetMapping("/cinemaChange")
	public String cinemaChange(Model model, 
			@RequestParam String cinemaPorin) {		
		model.addAttribute("cinemaDto", cinemaDao.selectOne(cinemaPorin));
		model.addAttribute("attachments", attachmentDao.selectCinemaImageList(cinemaPorin));
		return "admin/cinemaChange";
	}
	@PostMapping("/cinemaChange")
	public String cinemaChange(@ModelAttribute CinemaDto cinemaDto,
			@RequestParam List<MultipartFile> attachments, RedirectAttributes attr) 
				throws IllegalStateException, IOException {
		cinemaDao.changeCinema(cinemaDto);
		attr.addAttribute("cinemaPorin", cinemaDto.getCinemaPorin());
		
		//????????????
		for(MultipartFile file : attachments) {
			if(!file.isEmpty()) {
				int fileNumber = attachmentService.attachmentsUp(attachments, file);	//????????? ?????? service???

				String cinemaPorin = cinemaDto.getCinemaPorin(); //????????? ?????????
				attachmentDao.addCinemaImage(cinemaPorin, fileNumber); //?????????????????? ??????						
			}
		}
		return "redirect:cinemaDetail";
	}
	//?????????????????? ??????
	@GetMapping("/cinemaImageDelete")
	public String cinemaImageDelete(@RequestParam String cinemaPorin,
			@RequestParam int fileNumber, RedirectAttributes attr) {
		//???????????? ??????(cinema_image ????????????)
		List<ImageDto> attachments = attachmentDao.selectList(fileNumber);
		attachmentService.attachmentsDelete(attachments);
		
		attr.addAttribute("cinemaPorin",cinemaPorin);
		return "redirect:cinemaChange";
	}
	//???????????? - ??????
	@GetMapping("/cinemaDelete") 
	public String cinemaDelete(@RequestParam String cinemaPorin) {
		//???????????? ???, ???????????? ??????
		List<ImageDto> attachments = attachmentDao.selectCinemaImageList(cinemaPorin);
		
		//????????????(DB: cinema_image ????????????)
		boolean result = cinemaDao.deleteCinema(cinemaPorin);
		
		if(result) { //???????????? ??????
			//???????????? ??????
			attachmentService.attachmentsDelete(attachments);
			return "redirect:cinemaList";
		}
		
		return "redirect:cinemaList";	//???????????????, ????????? ??????
	}
	
	
	
	
	
//	???????????? ??????
	//???????????? - ??????
	@GetMapping("/movieAdd")
	public String movieAdd() {
		return "admin/movieAdd";
	}
	@PostMapping("/movieAdd")
	public String movieAdd(@ModelAttribute MovieVO movieVO,
			List<MultipartFile> attachments) 
					throws IllegalStateException, IOException {
		
		//??????????????? - ????????? ?????? ???????????? ????????????
		int movieNumber=movieDao.insert2(movieVO);
		movieVO.setMovieNumber(movieNumber);
		
		//??????????????? - ??????
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
		
		//hashtag ????????? - ??????
		movieDao.insertHashtag(movieNumber, movieVO.getGenreNo());
		
		//????????????
		for(MultipartFile file : attachments) {
			if(!file.isEmpty()) {
				//????????? ?????? service???
				int fileNumber = attachmentService.attachmentsUp(attachments, file);	
				
				//??????????????? ??? ?????????????????? ??????
				attachmentDao.addPoster(movieNumber, fileNumber); 						
			}
		}
		return "redirect:movieList";
	}
	//???????????? - ?????? (??????)
    @GetMapping("/movieList")
    public String movieList(Model model,
            @RequestParam(required=false)String type,
            @RequestParam(required=false) String keyword) {
        boolean isSearch=type !=null&&keyword !=null;
        if(isSearch) {//??????
            model.addAttribute("movieList",movieDao.selectList(type,keyword));
        }
        else {//??????) ??? ??????
            model.addAttribute("movieList",movieDao.selectList());
        }
        return "admin/movieList";
    }
    //???????????? - ??????
    @GetMapping("/movieDetail")
    public String movieDetail(Model model, @RequestParam int movieNumber) {

        //????????????
        MovieDto movieDto = movieDao.selectOne(movieNumber);
        model.addAttribute("movieDto",movieDto);

        //??????
        List<CharacterDto> characterDtoDirector = characterDao.selectListDirector(movieNumber);
        model.addAttribute("characterDtoListDirector",characterDtoDirector);
        List<CharacterDto> characterDtoActor = characterDao.selectListActor(movieNumber);
        model.addAttribute("characterDtoListActor",characterDtoActor);
//        System.out.println(characterDtoActor);

        //??????
        List<HashtagVO> hashtagVO = genreDao.selectListHashtagVO(movieNumber);
        model.addAttribute("ListHashtag", hashtagVO);
//        System.out.println(hashtagVO);
        
        //???????????? ???????????? ??????
        model.addAttribute("attachments", attachmentDao.selectPosterList(movieNumber));
      		
        return "admin/movieDetail";
    }
    //?????????????????? ??????
    @PostMapping("/moviePosterAdd")
    public String moviePosterAdd(@RequestParam int movieNumber,
    		List<MultipartFile> attachments, RedirectAttributes attr) 
    				throws IllegalStateException, IOException {
    	
    	//????????????
  		for(MultipartFile file : attachments) {
  			if(!file.isEmpty()) {
  				//????????? ?????? service???
  				int fileNumber = attachmentService.attachmentsUp(attachments, file);	
  				
  				//??????????????? ??? ?????????????????? ??????
  				attachmentDao.addPoster(movieNumber, fileNumber); 						
  			}
		}
  		
    	attr.addAttribute("movieNumber",movieNumber);
		return "redirect:movieDetail";
    }
	//?????????????????? ??????
	@GetMapping("/posterDelete")
	public String posterDelete(@RequestParam int movieNumber,
			@RequestParam int fileNumber, RedirectAttributes attr) {
		//???????????? ??????(poster ????????????)
		List<ImageDto> attachments = attachmentDao.selectList(fileNumber);
		attachmentService.attachmentsDelete(attachments);
		
		attr.addAttribute("movieNumber",movieNumber);
		return "redirect:movieDetail";
	}
	//???????????? - ??????
	@GetMapping("/movieDelete")
    public String delete(@RequestParam int movieNumber) {
		//?????? ???, ???????????? ??????
		List<ImageDto> attachments = attachmentDao.selectPosterList(movieNumber);
		
		//???????????? ??????(DB: cinema_image ????????????)
		boolean result = movieDao.delete(movieNumber);
		
		if(result) { //?????? ??????
			//???????????? ??????
			attachmentService.attachmentsDelete(attachments);
			return "redirect:movieList";
		}
        return "redirect:movieList";
    }
	
	

//	??????????????? ??????
	//??????????????? - ??????
	@GetMapping("/moviePlayAdd")
	public String moviePlayAdd() {
		return "admin/moviePlayAdd";
	}
	@PostMapping("/moviePlayAdd")
	public String moviePlayAdd(@ModelAttribute MoviePlayDto moviePlayDto) 
			throws ParseException {

		String moviePlayStartDate = moviePlayDto.getMoviePlayStartDate();
		String moviePlayStartTime = moviePlayDto.getMoviePlayStartTime();		
		String start = moviePlayStartDate +" "+ moviePlayStartTime;
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date moviePlayStart = transFormat.parse(start);
		moviePlayDto.setMoviePlayStart(moviePlayStart);
		
		moviePlayDao.addMoviePlay(moviePlayDto);
		return "redirect:moviePlayList";
	}
	//??????????????? - ??????(??????)
	@GetMapping("/moviePlayList")
	public String moviePlayList( Model model,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) {
			//??? ??????) ???????????????-????????????-???????????????
			if(type.equals("movie_play_start")) {
				model.addAttribute("moviePlayList", 
						moviePlayDao.selectMoviePlayViewListDate(type, keyword));
			}
			else {				
				model.addAttribute("moviePlayList", 
						moviePlayDao.selectMoviePlayViewList(type, keyword));
			}
		}
		else {
			//??? ??????) ???????????????-????????????-???????????????
			model.addAttribute("moviePlayList", moviePlayDao.selectMoviePlayViewList());		
		}
		return "admin/moviePlayList";
	}
	//??????????????? - ??????(??????)
	@GetMapping("/moviePlayDetail")
	public String moviePlayDetail(Model model, @RequestParam int moviePlayNum) {
		
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
	//??????????????? - ??????
	@GetMapping("/moviePlayChange")
	public String moviePlayChange(Model model, @RequestParam int moviePlayNum) {
		
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
	//??????????????? - ??????
	@GetMapping("/moviePlayDelete")
	public String moviePlayDelete(@RequestParam int moviePlayNum) {
		moviePlayDao.deleteMoviePlay(moviePlayNum);
		return "redirect:moviePlayList";	//???????????????, ????????? ??????
	}
	


	// Q&A ??????
	@GetMapping("/askingList")
	public String askingList(Model model) {
		model.addAttribute("oneQnaDto",oneQnaDao.selectList());
		return "admin/askingList";
	}

	
	//????????? ????????? (ex. ?????? ?????????????????????????)
	
	
}
