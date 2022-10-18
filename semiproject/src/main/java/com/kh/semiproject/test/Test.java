package com.kh.semiproject.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Test {

	@ResponseBody
	@RequestMapping("/test")
	public String test() {
		
		String name = "Victory"; 
		//포트번호 : 8000
		//깃 테스트 놀이 중
		//깃 연습
		//깃2
		return "영화관 사이트 명 : " + name + " ? ㅎㅎ" ;
		
		//충돌낸다! - hr  
		//또낸다 히히
		
		//ㅎ
	}
}
