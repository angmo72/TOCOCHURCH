package com.app.tococh.member.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MemberMapper {

	Map loginProc(Map paramMap) throws Exception;

	List<Map<Object, String>> selectManagerList(HashMap<String, Object> map) throws Exception;
	
	void insertManagerInfo(HashMap<String, Object> map) throws Exception;
	
	void updateManagerInfo(HashMap<String, Object> map) throws Exception;
	
	void deleteManagerInfo(HashMap<String, Object> map) throws Exception;

	void updateLastLogin(Map srchMap) throws Exception;
	
	
}
