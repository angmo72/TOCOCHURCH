package com.app.tococh.interceptor;

import java.util.Map;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor implements HandlerInterceptor {
	
	private static final String[] exceptURIs = {"/login.do", "/test3"};
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		String requestURI = request.getRequestURI();
		
        // 1. 세션에서 회원 정보 조회
        HttpSession session = (HttpSession) request.getSession();
        String sessUserEmail = (String) session.getAttribute("sessUserEmail");
//        MemberResponse member = (MemberResponse) session.getAttribute("loginMember");

        // 2. 회원 정보 체크
        if (sessUserEmail == null || sessUserEmail.equals("") ) {
            response.sendRedirect("/login");
            return false;
        }

        return HandlerInterceptor.super.preHandle(request, response, handler);
    }
	

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//        log.debug("==================== END ======================");
//        log.debug("===============================================");
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

	

}
