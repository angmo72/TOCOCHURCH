package com.app.tococh.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class HomeController {

	
	@GetMapping("/worshipInfo.do")
	public String worshipInfo() throws Exception {
		
		return "home/worshipInfo";
	}
	
	@GetMapping("/map.do")
	public String mapview() throws Exception {
		
		return "home/map";
	}
	
	@GetMapping("/minister.do")
	public String minster() throws Exception {
		
		return "home/minister";
	}
}
