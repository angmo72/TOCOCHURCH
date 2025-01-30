package com.app.tococh.sys;

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

import com.app.tococh.sys.service.CodeService;

@Controller
@RequestMapping("/sysCode/")
public class CodeController {

	
	private CodeService codeService;
	
	public CodeController(CodeService codeService) {
		this.codeService = codeService;
	}

	@GetMapping("/codeListView.do")
	public String viewCodeList() throws Exception {
		
		return "sys/codeList";
	}
	
	
	@ResponseBody
	@RequestMapping("/getMstCodeList.do")
	public HashMap<String, Object> getMstCodeList(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		
//		System.out.println("paramMap");
		
		List<Map<Object, String>> chList = codeService.getMstCodeList();
		System.out.println(chList);
			
		reMap.put("data", chList);
		
		return reMap;
	}
	
	@ResponseBody
	@RequestMapping("/getDtlCodeList.do")
	public HashMap<String, Object> getDtlCodeList(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		HashMap<String, Object> map  = new HashMap<String, Object>();
		String grpCode = (String) paramMap.get("grpCode");
		
		map.put("GRP_CODE", grpCode);
		
		List<Map<Object, String>> chDtList = codeService.getDtlCodeList(map);
//		System.out.println(chDtList);
			
		reMap.put("data", chDtList);
		
		return reMap;
	}
	
	@ResponseBody
	@RequestMapping("/saveMstCode.do")
	public HashMap<String, Object> saveMstCode(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		HashMap<String, Object> map  = new HashMap<String, Object>();
		String grpCode = (String) paramMap.get("grpCode");
		String codeNm = (String) paramMap.get("codeNm");
		String rmk = (String) paramMap.get("rmk");
		String grpCodeList = (String) paramMap.get("grpCodeList");
		String mode = (String) paramMap.get("mode");
		
		map.put("grpCode", grpCode);
		map.put("codeNm", codeNm);
		map.put("rmk", rmk);
	
		System.out.println(map);
		
		if(mode.equals("INSERT")) {
			
			codeService.insertMstCode(map);
			
		} else if(mode.equals("UPDATE")) {
			
			codeService.updateMstCode(map);
			
		} else if(mode.equals("DELETE")) {

			String[] arrGrpCodeList =  grpCodeList.split(",");
			map.put("arrGrpCodeList", arrGrpCodeList);
			
			codeService.deleteMstCode(map);
			
		}
			
		reMap.put("data", "");
		
		return reMap;
	}
	
	
	@ResponseBody
	@RequestMapping("/saveDtlCode.do")
	public HashMap<String, Object> saveDtlCode(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		HashMap<String, Object> reMap = new HashMap<String, Object>();
		
		HashMap<String, Object> map  = new HashMap<String, Object>();

		System.out.println(paramMap.get("saveRows"));
		
//		JSONObject jObject = new JSONObject((String)paramMap.get("saveRows"));
		JSONArray jArray =  new JSONArray((String)paramMap.get("saveRows"));
	
		// 배열의 모든 아이템을 출력합니다.
		for (int i = 0; i < jArray.length(); i++) {
			
			map.clear();
			
	        JSONObject obj = jArray.getJSONObject(i);
	        String crud = obj.getString("CRUD");
	        
	        map.put("GRP_CODE",obj.getString("GRP_CODE"));
	        map.put("CODE",obj.getString("CODE"));
	        map.put("CODE_NM",obj.getString("CODE_NM"));
	        if(obj.getString("RMK") != null )
	        	map.put("RMK",obj.getString("RMK"));
	        else 
	        	map.put("RMK","");
	        
	        if(obj.getString("REF") != null )
	        	map.put("RMK",obj.getString("RMK"));
	        else 
	        	map.put("REF","");
	        
	        if(obj.getString("REF1") != null )
	        	map.put("REF1",obj.getString("REF1"));
	        else 
	        	map.put("REF1","");
	        
	        if(obj.getString("REF2") != null )
	        	map.put("REF2",obj.getString("REF2"));
	        else 
	        	map.put("REF2","");
	        

	        if(crud.equals("C")) {
				
				codeService.insertDtlCode(map);
				
			} else if(crud.equals("U")) {
				
				codeService.updateDtlCode(map);
				
			} else if(crud.equals("D")) {
				
				codeService.deleteDtlCode(map);
				
			}
		}
			
		reMap.put("data", "");
		
		return reMap;
	}
}
