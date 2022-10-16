package com.kh.semiproject.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Test {
	private String name = "Victory"; 

	@RequestMapping("/")
	public String test() {
		
		//깃 테스트 놀이 중
		//깃 연습
		//깃2
		return "영화관 사이트 명 : " + name + " ? ㅎㅎ" ;
	}
	
}
