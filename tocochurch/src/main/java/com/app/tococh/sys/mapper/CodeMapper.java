package com.app.tococh.sys.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CodeMapper {

	List<Map<Object, String>> getMstCodeList() throws Exception;

	List<Map<Object, String>> getDtlCodeList(Map<String, Object> paramMap) throws Exception;

	void insertMstCode(Map<String, Object> paramMap)  throws Exception;

	void updateMstCode(HashMap<String, Object> map) throws Exception;
	
	void deleteMstCode(HashMap<String, Object> map) throws Exception;

	void insertDtlCode(HashMap<String, Object> map) throws Exception;
	
	void updateDtlCode(HashMap<String, Object> map) throws Exception;
	
	void deleteDtlCode(HashMap<String, Object> map) throws Exception;
	
}
