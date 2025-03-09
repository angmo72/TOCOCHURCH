package com.app.tococh.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.tococh.sys.service.SysService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/sys")
public class SysController {
	
	private SysService sysService;
	
	public SysController(SysService sysService) {
		this.sysService = sysService;
	}

	@GetMapping("/churchInfo.do")
	public String viewChurchInfo() throws Exception {
		
		System.out.println("교회환경설정");

		return "sys/churchInfo";
	}
	
	/*
	 * 교회정보 조회 
	 */
	
	@ResponseBody
	@RequestMapping("/selectChurchInfo.do")
	public HashMap<String, Object> selectChurchInfo(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		HashMap<String, Object> map  = new HashMap<String, Object>();
		
		List<Map<Object, String>> chInfo = sysService.selectChurchInfo(paramMap);
		System.out.println(chInfo);
			
		reMap.put("data", chInfo);
		
		return reMap;
	}
	
	/*
	 * 교회정보 등록
	 */
	@ResponseBody
	@RequestMapping("/saveChurchInfo.do")
	public HashMap<String, Object> saveChurchInfo(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		String sessEmail = (String) request.getSession().getAttribute("sessUserEmail");
		String sessName = (String) request.getSession().getAttribute("sessUserName");
		
		System.out.println("paramMap :" + paramMap);
		
		sysService.updateChurchInfo(paramMap);
			
		reMap.put("data", "");
		
		return reMap;
	}

}
