package com.app.tococh.offertory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/offertory")
public class offertoryController {

	
	@GetMapping("/offerInsert.do")
	public String viewChurchInfo() throws Exception {
		
		System.out.println("헌금등록");
		
//		Map<Object, String> chMap = sysService.getChurchInfo();
//		System.out.println(chMap);
			
		
		return "offertory/offerInsert";
	}
	
}
