package com.app.common.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CommonMapper {

	void insertUserAction(Map<String, Object> paramMap) throws Exception;
	
}
