package com.app.tococh.offertory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/offertory")
public class offertoryController {

	
	@GetMapping("/offerInsert")
	public String offerInsert() throws Exception {
		
		System.out.println("헌금등록");
		
		return "offertory/offerInsert";
	}
	
	
	@GetMapping("/offerManager")
	public String offerManager() throws Exception {
		
		System.out.println("헌금등록");
		
		return "offertory/offerManager";
	}
}
