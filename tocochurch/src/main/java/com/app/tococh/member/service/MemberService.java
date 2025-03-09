package com.app.tococh.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.app.tococh.member.mapper.MemberMapper;

@Service
public class MemberService {

	private MemberMapper memberMapper;
	
	public MemberService(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}
	
	public Map loginProc(Map paramMap) throws Exception {
		// TODO Auto-generated method stub
		return memberMapper.loginProc(paramMap);
	}

	public List<Map<Object, String>> selectManagerList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return memberMapper.selectManagerList(map);
	}


	public void insertManagerInfo(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		memberMapper.insertManagerInfo(map);
	}
	
	public void updateManagerInfo(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		memberMapper.updateManagerInfo(map);
	}
	
	public void deleteManagerInfo(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		memberMapper.deleteManagerInfo(map);
	}

	public void updateLastLogin(Map srchMap) throws Exception {
		memberMapper.updateLastLogin(srchMap);
		
	}
	
}
