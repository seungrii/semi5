package com.victory.semi5.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.victory.semi5.entity.CharacterDto;
import com.victory.semi5.entity.ImageDto;
import com.victory.semi5.entity.MovieDto;
import com.victory.semi5.repository.AttachmentDao;
import com.victory.semi5.repository.CharacterDao;
import com.victory.semi5.repository.GenreDao;
import com.victory.semi5.repository.MovieDao;
import com.victory.semi5.vo.HashtagVO;


@Controller
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired 
	MovieDao movieDao;
	@Autowired 
	AttachmentDao attachmentDao;
	@Autowired 
	CharacterDao characterDao;
	@Autowired
	GenreDao genreDao;
	

//list시작
	
	@GetMapping("/list")//목록
	public String list(Model model) {
//				@RequestParam(required=false) String type,
//				@RequestParam(required=false) String keyword){
		
		
//		boolean isSearch = type != null && keyword != null;
//		if(isSearch) {//검색
//			if(type.equals("moviePlayDate")) {
//				model.addAttribute("movieList", movieDao.selectListMoviePlayDate(keyword));
//				model.addAttribute("imageDto", attachmentDao.selectPosterList(keyword)); //첨부
//			}
//			else {				
//				model.addAttribute("movieList",movieDao.selectList(type,keyword));
//				model.addAttribute("imageDto", attachmentDao.selectPosterList(type,keyword)); //첨부
//			}
//		}
//		else {
			model.addAttribute("movieList",movieDao.selectList());
			model.addAttribute("imageDto", attachmentDao.selectPosterList()); //첨부
//		}
   
		return "movie/list";
	}
	
	//영화정보 - 상세
    @GetMapping("/movieDetail")
    public String movieDetail(Model model, @RequestParam int movieNumber) {

        //영화정보
        MovieDto movieDto = movieDao.selectOne(movieNumber);
        model.addAttribute("movieDto",movieDto);

        //인물
        List<CharacterDto> characterDtoDirector = characterDao.selectListDirector(movieNumber);
        model.addAttribute("characterDtoListDirector",characterDtoDirector);
        List<CharacterDto> characterDtoActor = characterDao.selectListActor(movieNumber);
        model.addAttribute("characterDtoListActor",characterDtoActor);
//        System.out.println(characterDtoActor);

        //장르
        List<HashtagVO> hashtagVO = genreDao.selectListHashtagVO(movieNumber);
        model.addAttribute("ListHashtag", hashtagVO);
//        System.out.println(hashtagVO);
        
        //첨부파일 조회하여 첨부
        model.addAttribute("attachments", attachmentDao.selectPosterList(movieNumber));
      		
        return "movie/detail2";
    }
	
	
	
	
	
	//model은 jsp 불러 올 때 데이터 전달
	//redirect는 다른 컨트롤러를 불러 오는 것
	//redirect전용 어트리부트가 나옴
	
	
}