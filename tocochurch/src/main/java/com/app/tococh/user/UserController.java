package com.app.tococh.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.tococh.user.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/")
public class UserController {

	
	private UserService userService;
	
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	
	@GetMapping("/userEdite.do")
	public String userEdit() throws Exception {
		
		return "user/userEdite";
	}
	
	@GetMapping("/userPray.do")
	public String userManager() throws Exception {
		
		return "user/userPray";
	}	
	
	@ResponseBody
	@RequestMapping("/userPrayForm.do")
	public ModelAndView userPrayForm(HttpServletRequest request, @RequestParam Map<String, Object> paramMap, HttpSession session, ModelAndView mv) throws Exception {
		
		System.out.println(paramMap);
		
		request.setAttribute("srch_prno", (String) paramMap.get("srch_prno"));
		
		mv.setViewName("user/userPrayForm");
		return mv;
	}	
	
	@ResponseBody
	@RequestMapping("/selectUserList.do")
	public HashMap<String, Object> selectUserList(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		HashMap<String, Object> map  = new HashMap<String, Object>();
		String sch_userCode = (String) paramMap.get("sch_userCode");
		String sch_userNm = (String) paramMap.get("sch_userNm");
		
		map.put("SCH_USERNM", sch_userNm);
		map.put("SCH_USERCODE", sch_userCode);
		
		System.out.println(sch_userCode);
		System.out.println(sch_userNm);
		
		List<Map<Object, String>> userList = userService.selectUserList(map);
//		System.out.println(userList);
			
		reMap.put("data", userList);
		
		return reMap;
	}
	
	@ResponseBody
	@RequestMapping("/selectOneUser.do")
	public HashMap<String, Object> selectOneUser(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		HashMap<String, Object> map  = new HashMap<String, Object>();
		String sch_userCode = (String) paramMap.get("sch_userCode");
		
		map.put("SRCH_USER_CODE", sch_userCode);
		
		System.out.println(sch_userCode);
		
		Map<Object, String> userInfo = userService.selectOneUser(map);
		System.out.println(userInfo);
			
		reMap.put("data", userInfo);
		
		return reMap;
	}
	
	@ResponseBody
	@RequestMapping("/saveUserInfo.do")
	public HashMap<String, Object> saveMstCode(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		String sessEmail = (String) request.getSession().getAttribute("sessUserEmail");
		String sessName = (String) request.getSession().getAttribute("sessUserName");
		
		System.out.println("paramMap :" + paramMap);
		String mode = (String) paramMap.get("mode");
		
		paramMap.put("SESS_EMAIL",sessEmail);
		
		if(mode.equals("INSERT")) {
			
			userService.insertUserInfo(paramMap);
			
		} else if(mode.equals("UPDATE")) {
			
			userService.updateUserInfo(paramMap);
			
		} else if(mode.equals("DELETE")) {
			
			userService.deleteUserInfo(paramMap);

		}
			
		reMap.put("data", "");
		
		return reMap;
	}

	
	@ResponseBody
	@RequestMapping("/getFamilyList.do")
	public HashMap<String, Object> getFamilyList(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		HashMap<String, Object> map  = new HashMap<String, Object>();
		String FAMILY_CODE = (String) paramMap.get("FAMILY_CODE");
		
		map.put("FAMILY_CODE", FAMILY_CODE);
		
		List<Map<Object, String>> chDtList = userService.getFamilyList(map);
//		System.out.println(chDtList);
			
		reMap.put("data", chDtList);
		
		return reMap;
	}
	
	
	@ResponseBody
	@RequestMapping("/svaeFamilyInfo.do")
	public HashMap<String, Object> svaeFamilyInfo(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		
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
        
	        map.put("SESS_EMAIL",sessEmail);
	        
	        map.put("FAMILY_CODE",obj.getString("FAMILY_CODE"));
	        map.put("USER_NM",obj.getString("USER_NM"));
	        map.put("GENDER",obj.getString("GENDER"));
	        map.put("RELATION",obj.getString("RELATION"));
	        if(obj.getString("BIRTHDAY") != null )
	        	map.put("BIRTHDAY",obj.getString("BIRTHDAY"));
	        else 
	        	map.put("BIRTHDAY","");
	        
	        if(obj.getString("MOBILE") != null )
	        	map.put("MOBILE",obj.getString("MOBILE"));
	        else 
	        	map.put("MOBILE","");
	        
	        if(obj.getString("BAPTISM") != null )
	        	map.put("BAPTISM",obj.getString("BAPTISM"));
	        else 
	        	map.put("BAPTISM","");
	        
	        if(obj.getString("DUTY") != null )
	        	map.put("DUTY",obj.getString("DUTY"));
	        else 
	        	map.put("DUTY","");
	        
	        if(obj.getString("RMK") != null )
	        	map.put("RMK",obj.getString("RMK"));
	        else 
	        	map.put("RMK","");
	        

	        if(crud.equals("C")) {
				
	        	userService.insertFamilyInfo(map);
				
			} else if(crud.equals("U")) {
				
				userService.updateFamilyInfo(map);
				
			} else if(crud.equals("D")) {
				
				userService.deleteFamilyInfo(map);
				
			}
		}
			
		reMap.put("data", "");
		
		return reMap;
	}
	
	
	
	@ResponseBody
	@RequestMapping("/selectPrayList.do")
	public HashMap<String, Object> selectPrayList(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		HashMap<String, Object> map  = new HashMap<String, Object>();
		
		List<Map<Object, String>> chDtList = userService.selectPrayList(paramMap);
//		System.out.println(chDtList);
			
		reMap.put("data", chDtList);
		
		return reMap;
	}
	
	@ResponseBody
	@RequestMapping("/selectPrayOneData.do")
	public HashMap<String, Object> selectPrayOneData(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
				
		System.out.println("paramMap :" + paramMap);
		
		List<Map<Object, String>> chDtList = userService.selectPrayList(paramMap);
		System.out.println(chDtList);
			
		reMap.put("data", chDtList.get(0));
		
		return reMap;
	}
	
	@ResponseBody
	@RequestMapping("/savePrayData.do")
	public HashMap<String, Object> savePrayData(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		String sessEmail = (String) request.getSession().getAttribute("sessUserEmail");
		String sessName = (String) request.getSession().getAttribute("sessUserName");
		
		System.out.println("paramMap :" + paramMap);
		String mode = (String) paramMap.get("frm_mode");
		
		paramMap.put("SESS_EMAIL",sessEmail);
		
		if(mode.equals("INSERT")) {
			
			userService.insertPrayData(paramMap);
			
		} else if(mode.equals("UPDATE")) {
			
			userService.updatePrayData(paramMap);
			
		} else if(mode.equals("DELETE")) {
			
			userService.deletePrayData(paramMap);

		}
			
		reMap.put("data", "");
		
		return reMap;
	}
	
	
	@ResponseBody
	@RequestMapping("/selectPrayDtList.do")
	public HashMap<String, Object> selectPrayDtList(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		HashMap<String, Object> map  = new HashMap<String, Object>();
		
		List<Map<Object, String>> chDtList = userService.selectPrayDtList(paramMap);
		System.out.println(chDtList);
			
		reMap.put("data", chDtList);
		
		return reMap;
	}

	@ResponseBody
	@RequestMapping("/savePrayDtData.do")
	public HashMap<String, Object> savePrayDtData(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		String sessEmail = (String) request.getSession().getAttribute("sessUserEmail");
		String sessName = (String) request.getSession().getAttribute("sessUserName");
		
		System.out.println("paramMap :" + paramMap);
		String mode = (String) paramMap.get("frm_dt_mode");
		
		paramMap.put("SESS_EMAIL",sessEmail);
		
		if(mode.equals("INSERT")) {
			
			userService.insertPrayDtData(paramMap);
			
		} else if(mode.equals("UPDATE")) {
			
			userService.updatePrayDtData(paramMap);
			
		} else if(mode.equals("DELETE")) {
			
			userService.deletePrayDtData(paramMap);

		}
			
		reMap.put("data", "");
		
		return reMap;
	}
	
}
