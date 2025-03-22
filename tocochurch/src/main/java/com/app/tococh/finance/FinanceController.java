package com.app.tococh.finance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.tococh.finance.service.FinanceService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/finance")
public class FinanceController {

	
	private FinanceService financeService;
	
	public FinanceController(FinanceService financeService) {
		this.financeService = financeService;
	}
	
	@GetMapping("/financeInsert.do")
	public String financeInsert() throws Exception {
		
		System.out.println("재정등록");
		
//		Map<Object, String> chMap = sysService.getChurchInfo();
//		System.out.println(chMap);
			
		
		return "finance/financeInsert";
	}
	
	@GetMapping("/financeManager.do")
	public String financeManager() throws Exception {
		
		System.out.println("재정등록");
		
//		Map<Object, String> chMap = sysService.getChurchInfo();
//		System.out.println(chMap);
			
		
		return "finance/financeManager";
	}
	
	
	@ResponseBody
	@RequestMapping("/searchFinanceList.do")
	public HashMap<String, Object> searchFinanceList(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		
		System.out.println(paramMap);
		
		List<Map<Object, String>> fnList = financeService.searchFinanceList(paramMap);
		System.out.println(fnList);
			
		reMap.put("data", fnList);
		
		return reMap;
	}
	
	@ResponseBody
	@RequestMapping("/saveFinanceData.do")
	public HashMap<String, Object> saveFinanceData(HttpServletRequest request,  @RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		HashMap<String, Object> map  = new HashMap<String, Object>();
		
		String sessEmail = (String) request.getSession().getAttribute("sessUserEmail");
		String sessName = (String) request.getSession().getAttribute("sessUserName");
		
		String fnNo = (String) paramMap.get("frm_fnno");
		
		map.put("FNNO",  fnNo);
		map.put("GUBUN",  (String) paramMap.get("frm_gubun"));
		map.put("CATEGORY",  (String) paramMap.get("frm_category"));
		map.put("SUB_MEMO",  (String) paramMap.get("frm_sub_memo"));
		map.put("FNDATE",  (String) paramMap.get("frm_fndate"));
		map.put("MONEY",  (String) paramMap.get("frm_money"));
		map.put("MEMO",  (String) paramMap.get("frm_memo"));
        map.put("SESS_EMAIL",sessEmail);
		
		System.out.println(map);
		
		if(fnNo == null || fnNo.equals("")) {
			
			financeService.insertFinanceData(map);
			
		} else {
			
			financeService.updateFinaceData(map);
		} 
			
		reMap.put("data", "");
		
		return reMap;
	}
	
	@ResponseBody
	@RequestMapping("/deleteFinanceData.do")
	public HashMap<String, Object> deleteFinanceData(HttpServletRequest request,  @RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		HashMap<String, Object> map  = new HashMap<String, Object>();
		
		String sessEmail = (String) request.getSession().getAttribute("sessUserEmail");
		String sessName = (String) request.getSession().getAttribute("sessUserName");
		
		String fnNo = (String) paramMap.get("frm_fnno");
		
		map.put("FNNO",  fnNo);
        map.put("SESS_EMAIL",sessEmail);
		
        System.out.println(map);
        
		financeService.deleteFinanceData(map);
			
		reMap.put("data", "");
		
		return reMap;
	}
	
	/*
	 * 재정관리 재정조회
	 */
	@ResponseBody
	@RequestMapping("/searchMngFinanceList.do")
	public HashMap<String, Object> searchMngFinanceList(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		
		System.out.println(paramMap);
		
		List<Map<Object, String>> fnList = financeService.searchMngFinanceList(paramMap);
		System.out.println(fnList);
			
		reMap.put("data", fnList);
		
		return reMap;
	}
	
	
	
}
