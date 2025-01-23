package com.app.tococh.sys.service;

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
	
	public Map<Object, String> getChurchInfo() throws Exception {
		
		return sysMapper.getChurchInfo();
	}

	
}
