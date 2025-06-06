package com.app.tococh;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mortbay.log.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.common.SHA256;
import com.app.tococh.interceptor.LoginInterceptor;
import com.app.tococh.member.service.MemberService;
import com.app.tococh.sys.service.SysService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SysService sysService;
	
	private static final Logger logger = LogManager.getLogger(MainController.class);
	
	@GetMapping("/")
	public String homeRoot(HttpServletRequest request, Model model) throws Exception {

		String sessEmail = (String) request.getSession().getAttribute("sessUserEmail");
		String sessName = (String) request.getSession().getAttribute("sessUserName");

		model.addAttribute("sessEmail", sessEmail);
		model.addAttribute("sessName", sessName);
	
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		List<Map<Object, String>> chInfo = chInfo = sysService.selectChurchInfo(paramMap);
			
		request.setAttribute("YOUTUBE_LIVE", chInfo.get(0).get("YOUTUBE_LIVE"));
		return "index";
	}
	
	@GetMapping("/churcherp.do")
	public String manageHome(HttpServletRequest request, Model model) {

		String sessEmail = (String) request.getSession().getAttribute("sessUserEmail");
		String sessName = (String) request.getSession().getAttribute("sessUserName");
		
		model.addAttribute("sessEmail", sessEmail);
		model.addAttribute("sessName", sessName);
		
		return "churcherp";
	}	

	
	@RequestMapping("loginProc.do")
	@ResponseBody
	public ModelAndView loginProc(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelAndView mv) throws Exception {
		
		SHA256 sha256 = new SHA256();
		
		HashMap<String, Object> srchMap= new HashMap<String, Object>();
		srchMap.put("USER_EMAIL", request.getParameter("userEmail"));
				
        String userPw = request.getParameter("userPw");
        userPw = sha256.encrypt(userPw);
        
//        System.out.println("userPw : "+ userPw);
		
		Map loginMap = memberService.loginProc(srchMap);
		
		if(loginMap != null) {
			
//			System.out.println("loginPw : "+ loginMap.get("user_pw"));
			
			if(userPw.equals(loginMap.get("user_pw"))) {
			
				memberService.updateLastLogin(srchMap);
				
				session.setAttribute("sessUserEmail", loginMap.get("user_email"));
				session.setAttribute("sessUserName", loginMap.get("user_nm"));
				// 세션 유지기간 30분
				session.setMaxInactiveInterval(60*30);
				
				String sessUserEmail = (String) session.getAttribute("sessUserEmail");
				
				
				mv.setViewName("redirect:/churcherp.do");
				
			}else {
				//비밀번호가 다름
				mv.setViewName("redirect:/login.do");
			}
			
		}else {
			//회원정보가 달라 
			mv.setViewName("redirect:/login.do");
		}
		return mv;
	}
	
	@GetMapping("/login.do")
	public String loign() {

		logger.info("로그인 정보가 있음");
		return "loginForm";
	}
	
	
	//로그아웃
	@GetMapping("loginOut.do")
	public String loginOut(HttpSession session) {
		session.invalidate();		
		return "redirect:/";
	}
	
	//세션정보조회
	@ResponseBody
	@RequestMapping("getSessionInfo.do")
	public HashMap<String, Object> getSessionInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String sessEmail = (String) request.getSession().getAttribute("sessUserEmail");
		String sessName = (String) request.getSession().getAttribute("sessUserName");

		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		reMap.put("sessEmail", sessEmail);
		reMap.put("sessName", sessName);
		
		return reMap;
	}
}
