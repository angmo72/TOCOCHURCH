package com.app.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.app.common.mapper.CommonMapper;

@Service
public class CommonService {

	private CommonMapper commonMapper;
	
	public CommonService(CommonMapper commonMapper) {
		this.commonMapper = commonMapper;
	}
	
	public void searchFinanceList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.insertUserAction(paramMap);
	}

}
