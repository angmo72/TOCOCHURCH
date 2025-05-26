package com.app.tococh.interceptor;

import java.util.HashMap;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mortbay.log.Log;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.app.common.service.CommonService;
import com.app.tococh.MainController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor implements HandlerInterceptor {
	
	private static final String[] exceptURIs = {"/login", "/test3"};
	
	private static final Logger logger = LogManager.getLogger(MainController.class);
	
//	private CommonService commonService;
//	
//	public LoginInterceptor(CommonService commonService) {
//		this.commonService = commonService;
//	}
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		String requestURI = request.getRequestURI();
		
        // 1. 세션에서 회원 정보 조회
        HttpSession session = (HttpSession) request.getSession();
        String sessUserEmail = (String) session.getAttribute("sessUserEmail");
//        MemberResponse member = (MemberResponse) session.getAttribute("loginMember");

        
        // 2. 회원 정보 체크
        if (sessUserEmail == null || sessUserEmail.equals("") ) {
            response.sendRedirect("/login.do");
            return false;
        } else {
        	//접속 정보를 저장 함
        	//이전 페이지 
//        	String before_address = request.getHeader("referer");
//        	logger.error("before_address : " + before_address);
        	
//       	
//        	//사용자 IP 
//        	String user_ip   = request.getRemoteAddr();
//        	
//        	String fullUrl = request.getRequestURI();   //프로젝트경로부터 파일까지의 경로값을 얻어옴 (/test/index.jsp)
//        	String pjtUrl = request.getContextPath();  //프로젝트의 경로값만 가져옴(/test)
//        	String httpFullUrl = request.getRequestURL().toString();   //전체 경로를 가져옴 (http://localhost:8080/test/index.jsp)
//        	String serviceUrl = request.getServletPath();  //파일명 (/index.jsp)
//
//    		HashMap<String, Object> map  = new HashMap<String, Object>();
//	        map.put("USER_ID"		,sessUserEmail);
//	        map.put("PATH"			,fullUrl);
//	        map.put("IP"			,user_ip);
//	        
//	        commonService.insertUserAction(map);
        	
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
