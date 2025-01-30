package com.app.tococh.finance;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/finance")
public class financeController {

	
	@GetMapping("/financeInsert.do")
	public String viewChurchInfo() throws Exception {
		
		System.out.println("재정등록");
		
//		Map<Object, String> chMap = sysService.getChurchInfo();
//		System.out.println(chMap);
			
		
		return "finance/financeInsert";
	}
	
}
