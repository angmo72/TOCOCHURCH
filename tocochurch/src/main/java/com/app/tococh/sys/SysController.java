package com.app.tococh.sys;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.tococh.sys.service.SysService;

@Controller
@RequestMapping("/sys")
public class SysController {
	
	private SysService sysService;
	
	public SysController(SysService sysService) {
		this.sysService = sysService;
	}

	@GetMapping("/churchInfo")
	public String viewChurchInfo() throws Exception {
		
		System.out.println("교회환경설정");
		
		Map<Object, String> chMap = sysService.getChurchInfo();
		System.out.println(chMap);
			
		
		return "sys/churchInfo";
	}

}
