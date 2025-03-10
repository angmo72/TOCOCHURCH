package com.app.tococh.sys.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.app.tococh.sys.mapper.SysMapper;

/*
 * 교회정보
*/
@Service
public class SysService {

	private SysMapper sysMapper;
	
	public SysService(SysMapper sysMapper) {
		this.sysMapper = sysMapper;
	}
	
	public void updateChurchInfo(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		sysMapper.updateChurchInfo(paramMap);
	}

	public List<Map<Object, String>> selectChurchInfo(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return  sysMapper.selectChurchInfo(paramMap);
	}

	
	
}
