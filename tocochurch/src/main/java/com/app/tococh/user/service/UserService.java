package com.app.tococh.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.app.tococh.user.mapper.UserMapper;

@Service
public class UserService {

	private UserMapper userMapper;
	
	public UserService(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	public List<Map<Object, String>> selectUserList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.selectUserList(map);
	}

	public Map<Object, String> selectOneUser(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.selectOneUser(map);
	}
	
	
	public void insertUserInfo(Map<String, Object> paramMap)  throws Exception {
		// TODO Auto-generated method stub
		userMapper.insertUserInfo(paramMap);
	}

	public void updateUserInfo(Map<String, Object> map)  throws Exception {
		// TODO Auto-generated method stub
		userMapper.updateUserInfo(map);
	}

	public void deleteUserInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		userMapper.deleteUserInfo(map);
	}

	public List<Map<Object, String>> getFamilyList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getFamilyList(map);
	}

	public void insertFamilyInfo(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		userMapper.insertFamilyInfo(map);
	}

	public void updateFamilyInfo(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		userMapper.updateFamilyInfo(map);
		
	}

	public void deleteFamilyInfo(HashMap<String, Object> map)  throws Exception {
		// TODO Auto-generated method stub
		userMapper.deleteFamilyInfo(map);
	}

	public void insertPrayData(Map<String, Object> paramMap)  throws Exception {
		// TODO Auto-generated method stub
		userMapper.insertPrayData(paramMap);
	}
	
	public void updatePrayData(Map<String, Object> paramMap)  throws Exception {
		// TODO Auto-generated method stub
		userMapper.updatePrayData(paramMap);
	}
	
	public void deletePrayData(Map<String, Object> paramMap)  throws Exception {
		// TODO Auto-generated method stub
		userMapper.deletePrayData(paramMap);
	}

	public List<Map<Object, String>> selectPrayList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.selectPrayList(paramMap);
	}

	public List<Map<Object, String>> selectPrayDtList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.selectPrayDtList(paramMap);
	}

	public void insertPrayDtData(Map<String, Object> paramMap)  throws Exception {
		// TODO Auto-generated method stub
		userMapper.insertPrayDtData(paramMap);
	}
	
	public void updatePrayDtData(Map<String, Object> paramMap)  throws Exception {
		// TODO Auto-generated method stub
		userMapper.updatePrayDtData(paramMap);
	}
	
	public void deletePrayDtData(Map<String, Object> paramMap)  throws Exception {
		// TODO Auto-generated method stub
		userMapper.deletePrayDtData(paramMap);
	}


}
