package com.app.tococh.sys.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.app.tococh.sys.mapper.CodeMapper;

/*
 * 코드관리
 */
@Service
public class CodeService {

	private CodeMapper codeMapper;
	
	public CodeService(CodeMapper codeMapper) {
		this.codeMapper = codeMapper;
	}
	
	public List<Map<Object, String>> getMstCodeList() throws Exception {
		
		return codeMapper.getMstCodeList();
	}

	public List<Map<Object, String>> getDtlCodeList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return codeMapper.getDtlCodeList(map);
	}

	public void insertMstCode(Map<String, Object> map) throws Exception {
		codeMapper.insertMstCode(map);
	}

	public void updateMstCode(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		codeMapper.updateMstCode(map);
	}
	
	public void deleteMstCode(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		codeMapper.deleteMstCode(map);
	}

	public void insertDtlCode(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		codeMapper.insertDtlCode(map);
	}
	
	public void updateDtlCode(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		codeMapper.updateDtlCode(map);
	}
	
	public void deleteDtlCode(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		codeMapper.deleteDtlCode(map);
	}
	
}
