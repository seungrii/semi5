package com.victory.semi5.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.victory.semi5.constant.SessionConstant;

 

@Component
public class AdminInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String mg = (String)session.getAttribute(SessionConstant.GRADE);
		
		boolean admin = mg.equals("관리자");
		//String mg=(String)session.getAttribute("LoginId");
		//boolean admin = mg != null && mg.equals("admin01");
		if(admin) {//관리자라면
			return true;//통과
		}
		else {//관리자가 아니라면
			response.sendRedirect("/");//메인으로 리다이렉트
			//response.sendError(403);//사용자에게 권한없음(403) 전송
			return false;//차단
		}
	}
}
