package com.app.tococh.finance.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface FinanceMapper {

	List<Map<Object, String>> searchFinanceList(Map<String, Object> paramMap) throws Exception;

	void insertFinanceData(HashMap<String, Object> map) throws Exception;

	void updateFinaceData(HashMap<String, Object> map) throws Exception;

	void deleteFinanceData(HashMap<String, Object> map) throws Exception;

	List<Map<Object, String>> searchMngFinanceList(Map<String, Object> paramMap) throws Exception;
	
}
