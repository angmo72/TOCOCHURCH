package com.app.tococh.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@ResponseBody
	@RequestMapping("/selectUserList")
	public HashMap<String, Object> selectUserList(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		HashMap<String, Object> map  = new HashMap<String, Object>();
		String sch_userCode = (String) paramMap.get("sch_userCode");
		String sch_userNm = (String) paramMap.get("sch_userNm");
		
		map.put("sch_userNm", sch_userNm);
		map.put("sch_userCode", sch_userCode);
		
		System.out.println(sch_userCode);
		System.out.println(sch_userNm);
//		
//		List<Map<Object, String>> chDtList = codeService.getDtlCodeList(map);
//		System.out.println(chDtList);
			
//		reMap.put("data", chDtList);
		
		return reMap;
	}

}
