package com.app.tococh.sermon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sermon")
public class worshipWordController {

	
	@GetMapping("/sunService.do")
	public String sunService() throws Exception {
		
		System.out.println("주일예배");
		
		return "sermon/sunWords";
	}
	
	@GetMapping("/sunEvenService.do")
	public String sunEvenService() throws Exception {
		
		System.out.println("주일저녁예배");
		
		return "sermon/sunEvenWords";
	}
	
	@GetMapping("/wedService.do")
	public String wedService() throws Exception {
		
		System.out.println("수요예배");
		
		return "sermon/wedWords";
	}
	
	@GetMapping("/friService.do")
	public String friService() throws Exception {
		
		System.out.println("금요예배");
		
		return "sermon/friWords";
	}
	
	@GetMapping("/morningWords.do")
	public String morningWords() throws Exception {
		
		System.out.println("새벽말씀");
		
		return "sermon/morningWords";
	}
}
