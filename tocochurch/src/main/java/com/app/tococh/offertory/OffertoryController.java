package com.app.tococh.offertory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.tococh.offertory.service.OffertoryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
	@RequestMapping("/offerPrint.do")
	public ModelAndView offerPrint(HttpServletRequest request, @RequestParam Map<String, Object> paramMap, HttpSession session, ModelAndView mv) throws Exception {
		
		System.out.println(paramMap);
		
		request.setAttribute("srch_indate", (String) paramMap.get("srch_indate"));
		request.setAttribute("srch_gubun", (String) paramMap.get("srch_gubun"));
		
		mv.setViewName("offertory/offerPrint");
		return mv;
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
			
		} else if(mode.equals("APPRAVOAL")) {
			// 이력저장 
			offertoryService.saveOffferInfoHis(paramMap);
			//제정으로 저장
			offertoryService.insertFinance(paramMap);
			//업데이트
			offertoryService.approvalOfferInfo(paramMap);

		}
			
		reMap.put("data", "");
		
		return reMap;
	}
	
	
	@ResponseBody
	@RequestMapping("/offerListSum.do")
	public HashMap<String, Object> offerListSum(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		List<Map<Object, String>> userList = offertoryService.offerListSum(paramMap);
		
		List<Map<Object, String>> dateList = offertoryService.offerDataList(paramMap);
		
		reMap.put("dateList", dateList);
		reMap.put("data", userList);
		
		return reMap;
	}
	
	@ResponseBody
	@RequestMapping("/offerList.do")
	public HashMap<String, Object> offerList(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		List<Map<Object, String>> offerList = offertoryService.offerList(paramMap);
			
		reMap.put("data", offerList);
		
		return reMap;
	}
	
	@ResponseBody
	@RequestMapping("/updateMngOfferInfo.do")
	public HashMap<String, Object> updateMngOfferInfo(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		String sessEmail = (String) request.getSession().getAttribute("sessUserEmail");
		String sessName = (String) request.getSession().getAttribute("sessUserName");
		
		System.out.println("paramMap :" + paramMap);
		String mode = (String) paramMap.get("mode");
		
		paramMap.put("SESS_EMAIL",sessEmail);
		
		offertoryService.updateMngOfferInfo(paramMap);
	
		reMap.put("data", "");
		
		return reMap;
	}
	
	@ResponseBody
	@RequestMapping("/deletMngOfferInfo.do")
	public HashMap<String, Object> deletMngOfferInfo(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		String sessEmail = (String) request.getSession().getAttribute("sessUserEmail");
		String sessName = (String) request.getSession().getAttribute("sessUserName");
		
		System.out.println("paramMap :" + paramMap);
		String mode = (String) paramMap.get("mode");
		
		paramMap.put("SESS_EMAIL",sessEmail);
		
		offertoryService.deletMngOfferInfo(paramMap);
		
		reMap.put("data", "");
		
		return reMap;
	}
	
	
	@ResponseBody
	@RequestMapping("/offerPrintList.do")
	public HashMap<String, Object> offerPrintList(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		List<Map<Object, String>> offerSumList = offertoryService.offerListSum(paramMap);
		List<Map<Object, String>> offerList = offertoryService.offerList(paramMap);
			
		reMap.put("dataSum", offerSumList);
		reMap.put("dataList", offerList);
		
		return reMap;
	}
}