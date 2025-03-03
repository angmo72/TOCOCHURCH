package com.app.tococh.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.app.tococh.user.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@RestController 
@RequestMapping("/member/")
public class MemberController {

	private MemberService memberService;
	
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("/memberListView.do")
	public ModelAndView viewCodeList(HttpServletRequest request, Model model, ModelAndView mv) throws Exception {
			
		String sessEmail = (String) request.getSession().getAttribute("sessUserEmail");
		String sessName = (String) request.getSession().getAttribute("sessUserName");

		model.addAttribute("sessEmail", sessEmail);
		model.addAttribute("sessName", sessName);

		mv.setViewName("/user/memberList");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/selectManagerList.do")
	public HashMap<String, Object> selectManagerList(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		HashMap<String, Object> map  = new HashMap<String, Object>();
		String srch_email = (String) paramMap.get("srch_email");
		String srch_userNm = (String) paramMap.get("srch_userNm");
		
		map.put("SRCH_EMAIL", srch_email);
		map.put("SRCH_USERNM", srch_userNm);
		
		List<Map<Object, String>> memberList = memberService.selectManagerList(map);
//		System.out.println(chDtList);
			
		reMap.put("data", memberList);
		
		return reMap;
	}
	
	@ResponseBody
	@RequestMapping("/saveManagerInfo.do")
	public HashMap<String, Object> saveManagerInfo(HttpServletRequest request,  @RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		HashMap<String, Object> map  = new HashMap<String, Object>();

		System.out.println(paramMap.get("saveRows"));
		
//		JSONObject jObject = new JSONObject((String)paramMap.get("saveRows"));
		JSONArray jArray =  new JSONArray((String)paramMap.get("saveRows"));
	
		String sessEmail = (String) request.getSession().getAttribute("sessUserEmail");
		String sessName = (String) request.getSession().getAttribute("sessUserName");

		
		// 배열의 모든 아이템을 출력합니다.
		for (int i = 0; i < jArray.length(); i++) {
			
			map.clear();
			
	        JSONObject obj = jArray.getJSONObject(i);
	        String crud = obj.getString("CRUD");
	        
	        map.put("USER_EMAIL"	,obj.getString("USER_EMAIL"));
	        map.put("USER_NM"		,obj.getString("USER_NM"));
	        map.put("MENU_CTR"		,obj.getString("MENU_CTR"));
	        map.put("MENU_CTR_NM"		,obj.getString("MENU_CTR_NM"));
	        map.put("USER_PW"		,obj.getString("USER_PW"));
	        map.put("SESS_EMAIL"	,sessEmail);
	        if(obj.getString("MOBILE") != null )
	        	map.put("MOBILE",obj.getString("MOBILE"));
	        else 
	        	map.put("MOBILE","");

	        if(crud.equals("C")) {
				
	        	memberService.insertManagerInfo(map);
				
			} else if(crud.equals("U")) {
				
				memberService.updateManagerInfo(map);
				
			} else if(crud.equals("D")) {
				
				memberService.deleteManagerInfo(map);
				
			}
		}
			
		reMap.put("data", "");
		
		return reMap;
	}
	
}
