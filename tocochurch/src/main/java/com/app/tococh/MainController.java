package com.app.tococh;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/")
	public String homeRoot() {
		
		return "index";
	}

	@GetMapping("/login.do")
	public String loign() {
		
		return "login";
	}
}
