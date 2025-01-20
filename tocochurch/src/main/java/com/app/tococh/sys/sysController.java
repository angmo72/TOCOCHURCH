package com.app.tococh.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sys")
public class sysController {

	@GetMapping("/churchInfo")
	public String viewChurchInfo() {
		
		System.out.println("교회환경설정");
		
		return "sys/churchInfo";
	}
}
