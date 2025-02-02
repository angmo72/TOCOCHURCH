package com.app.tococh.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/")
public class userController {

	

	@GetMapping("userEdite")
	public String userEdit() throws Exception {
		
		return "user/userEdite";
	}
	
	@GetMapping("userManager")
	public String userManager() throws Exception {
		
		return "user/userManager";
	}	

}
