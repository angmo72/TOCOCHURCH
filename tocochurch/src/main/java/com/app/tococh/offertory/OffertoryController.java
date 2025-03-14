package com.app.tococh.offertory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.tococh.offertory.service.OffertoryService;
import com.app.tococh.user.service.UserService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/offertory")
public class OffertoryController {


	private OffertoryService offertoryService;
	
	public OffertoryController(OffertoryService offertoryService) {
		this.offertoryService = offertoryService;
	}
	
	@GetMapping("/offerInsert.do")
	public String offerInsert() throws Exception {
		
		System.out.println("헌금등록");
		
		return "offertory/offerInsert";
	}
	
	
	@GetMapping("/offerManager.do")
	public String offerManager() throws Exception {
		
		System.out.println("헌금등록");
		
		return "offertory/offerManager";
	}
	
	@ResponseBody
	@RequestMapping("/offerUserList.do")
	public HashMap<String, Object> offerUserList(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		HashMap<String, Object> map  = new HashMap<String, Object>();
		String sch_userCode = (String) paramMap.get("sch_userCode");
		String sch_userNm = (String) paramMap.get("sch_userNm");
		
		map.put("SCH_USERNM", sch_userNm);
		map.put("SCH_USERCODE", sch_userCode);
		
		System.out.println(sch_userCode);
		System.out.println(sch_userNm);
		
		List<Map<Object, String>> userList = offertoryService.offerUserList(map);
//		System.out.println(userList);
			
		reMap.put("data", userList);
		
		return reMap;
	}
	
	@ResponseBody
	@RequestMapping("/saveOfferInfo.do")
	public HashMap<String, Object> saveOfferInfo(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		String sessEmail = (String) request.getSession().getAttribute("sessUserEmail");
		String sessName = (String) request.getSession().getAttribute("sessUserName");
		
		System.out.println("paramMap :" + paramMap);
		String mode = (String) paramMap.get("mode");
		
		paramMap.put("SESS_EMAIL",sessEmail);
		
		if(mode.equals("INSERT")) {
			
			offertoryService.insertOfferInfo(paramMap);
			
		} else if(mode.equals("UPDATE")) {
			
			offertoryService.updateOfferInfo(paramMap);
			
		} else if(mode.equals("DELETE")) {
			
			offertoryService.deleteOfferInfo(paramMap);

		}
			
		reMap.put("data", "");
		
		return reMap;
	}
}