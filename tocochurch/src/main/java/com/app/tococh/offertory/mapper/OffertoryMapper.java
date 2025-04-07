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

	void saveOffferInfoHis(Map<String, Object> paramMap) throws Exception;
	
	void approvalOfferInfo(Map<String, Object> paramMap) throws Exception;

	void deleteFinance(Map<String, Object> paramMap) throws Exception;
	
	void insertFinance(Map<String, Object> paramMap) throws Exception;

	List<Map<Object, String>> offerList(Map<String, Object> paramMap) throws Exception;

	void insertOfferInfoHis(Map<String, Object> paramMap) throws Exception;

	void updateOffFinanceMinus(Map<String, Object> paramMap) throws Exception;
	
	void updateOffFinancePluse(Map<String, Object> paramMap) throws Exception;

	void updateMngOfferInfo(Map<String, Object> paramMap) throws Exception;

	void deleteMngOfferInfo(Map<String, Object> paramMap) throws Exception;

	List<Map<Object, String>> offerListSum(Map<String, Object> paramMap) throws Exception;

	List<Map<Object, String>> offerDataList(Map<String, Object> paramMap) throws Exception;


}
