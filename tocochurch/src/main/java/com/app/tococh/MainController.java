package com.app.tococh;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.app.tococh.user.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

	private MemberService memberService;
	
	public MainController(MemberService memberService) {
		this.memberService = memberService;
	}

	
	@GetMapping("/")
//	public String homeRoot() {
//	@GetMapping(value = {"","/"})
	public String homeRoot(HttpServletRequest request, Model model) {

		String sessEmail = (String) request.getSession().getAttribute("sessUserEmail");
		String sessName = (String) request.getSession().getAttribute("sessUserName");

		model.addAttribute("sessEmail", sessEmail);
		model.addAttribute("sessName", sessName);
		
		return "index";
	}

	
	@RequestMapping("loginProc")
	@ResponseBody
	public ModelAndView loginProc(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelAndView mv) throws Exception {
		
		Map srchMap= new HashMap<String, Object>();
		srchMap.put("USER_EMAIL", request.getParameter("userEmail"));
		srchMap.put("USER_PW", request.getParameter("userPw"));
		
		Map loginMap = memberService.loginProc(srchMap);
		if(loginMap != null) {
			
			memberService.updateLastLogin(srchMap);
			
			session.setAttribute("sessUserEmail", loginMap.get("user_email"));
			session.setAttribute("sessUserName", loginMap.get("user_nm"));
			// 세션 유지기간 30분
			session.setMaxInactiveInterval(60*30);
			
			String sessUserEmail = (String) session.getAttribute("sessUserEmail");
			
			
			mv.setViewName("redirect:/");
		}else {
			//회원정보가 달라 
			mv.setViewName("/loginForm");
		}
		return mv;
	}
	
	@GetMapping("/login")
	public String loign() {
		System.out.println(" login.do를 호출합니다. ");
		return "loginForm";
	}
	
	
	//로그아웃
	@GetMapping("loginOut")
	public String loginOut(HttpSession session) {
		session.invalidate();		
		return "redirect:/";
	}
	
	//세션정보조회
	@ResponseBody
	@RequestMapping("getSessionInfo")
	public HashMap<String, Object> getSessionInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String sessEmail = (String) request.getSession().getAttribute("sessUserEmail");
		String sessName = (String) request.getSession().getAttribute("sessUserName");

		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		System.out.println("sessEmail :" + sessEmail);
		
		reMap.put("sessEmail", sessEmail);
		reMap.put("sessName", sessName);
		
		return reMap;
	}
}
