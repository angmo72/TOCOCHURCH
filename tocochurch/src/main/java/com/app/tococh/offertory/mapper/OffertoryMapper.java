package com.app.tococh.offertory.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OffertoryMapper {

	List<Map<Object, String>> offerUserList(HashMap<String, Object> map) throws Exception;

	void insertOfferInfo(Map<String, Object> paramMap) throws Exception;

	void updateOfferInfo(Map<String, Object> paramMap) throws Exception;

	void deleteOfferInfo(Map<String, Object> paramMap) throws Exception;

}
