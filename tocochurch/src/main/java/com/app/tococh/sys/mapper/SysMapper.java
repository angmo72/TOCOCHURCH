package com.app.tococh.sys.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SysMapper {

	Map<Object, String> getChurchInfo() throws Exception;
	
}
