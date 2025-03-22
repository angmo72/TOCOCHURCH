package com.app.tococh.finance.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.app.tococh.finance.mapper.FinanceMapper;

@Service
public class FinanceService {

	private FinanceMapper financeMapper;
	
	public FinanceService(FinanceMapper financeMapper) {
		this.financeMapper = financeMapper;
	}
	
	public List<Map<Object, String>> searchFinanceList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return financeMapper.searchFinanceList(paramMap);
	}

	public void insertFinanceData(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		financeMapper.insertFinanceData(map);
	}

	public void updateFinaceData(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		financeMapper.updateFinaceData(map);
	}

	public void deleteFinanceData(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		financeMapper.deleteFinanceData(map);
	}

	public List<Map<Object, String>> searchMngFinanceList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return financeMapper.searchMngFinanceList(paramMap);
	}
	
}
