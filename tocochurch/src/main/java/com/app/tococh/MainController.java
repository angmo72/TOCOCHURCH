package com.app.tococh;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/")
	public String homeRoot() {
		
		System.out.println("홈페이지 연결");
		
		return "index";
	}

}
