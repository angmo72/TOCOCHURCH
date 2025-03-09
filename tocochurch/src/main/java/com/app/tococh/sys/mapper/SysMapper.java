package com.app.tococh.sys.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SysMapper {

	void updateChurchInfo(Map<String, Object> paramMap) throws Exception;

	List<Map<Object, String>> selectChurchInfo(Map<String, Object> paramMap) throws Exception;
	
}
