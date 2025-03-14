package com.app.tococh.user.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface UserMapper {

	List<Map<Object, String>> selectUserList(HashMap<String, Object> map) throws Exception;

	Map<Object, String> selectOneUser(HashMap<String, Object> map) throws Exception;
	
	void insertUserInfo(Map<String, Object> map) throws Exception;

	void updateUserInfo(Map<String, Object> map) throws Exception;

	void deleteUserInfo(Map<String, Object> map) throws Exception;

	List<Map<Object, String>> getFamilyList(HashMap<String, Object> map) throws Exception;

	void insertFamilyInfo(HashMap<String, Object> map) throws Exception;

	void updateFamilyInfo(HashMap<String, Object> map) throws Exception;

	void deleteFamilyInfo(HashMap<String, Object> map) throws Exception;

	void insertPrayData(Map<String, Object> paramMap) throws Exception;
	
	void updatePrayData(Map<String, Object> paramMap) throws Exception;
	
	void deletePrayData(Map<String, Object> paramMap) throws Exception;

	List<Map<Object, String>> selectPrayList(Map<String, Object> paramMap) throws Exception;

	List<Map<Object, String>> selectPrayDtList(Map<String, Object> paramMap) throws Exception;

	void insertPrayDtData(Map<String, Object> paramMap) throws Exception;
	
	void updatePrayDtData(Map<String, Object> paramMap) throws Exception;
	
	void deletePrayDtData(Map<String, Object> paramMap) throws Exception;

	List<Map<Object, String>> getUserCodeData() throws Exception;
}
