package com.app.tococh.offertory.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.app.tococh.offertory.mapper.OffertoryMapper;
import com.app.tococh.sys.mapper.CodeMapper;

@Service
public class OffertoryService {
	
	private OffertoryMapper offertoryMapper;
	
	public OffertoryService(OffertoryMapper offertoryMapper) {
		this.offertoryMapper = offertoryMapper;
	}
	
	public List<Map<Object, String>> offerUserList(HashMap<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return offertoryMapper.offerUserList(map);
	}

	public void insertOfferInfo(Map<String, Object> paramMap) throws Exception{
		// TODO Auto-generated method stub
		offertoryMapper.insertOfferInfo(paramMap);
		
	}

	public void updateOfferInfo(Map<String, Object> paramMap) throws Exception{
		// TODO Auto-generated method stub
		offertoryMapper.updateOfferInfo(paramMap);
	}

	public void deleteOfferInfo(Map<String, Object> paramMap) throws Exception{
		// TODO Auto-generated method stub
		offertoryMapper.deleteOfferInfo(paramMap);
	}
	
	public void saveOffferInfoHis(Map<String, Object> paramMap) throws Exception{
		// TODO Auto-generated method stub
		offertoryMapper.saveOffferInfoHis(paramMap);
	}

	public void approvalOfferInfo(Map<String, Object> paramMap)  throws Exception{
		// TODO Auto-generated method stub
		offertoryMapper.approvalOfferInfo(paramMap);
	}

	public void insertFinance(Map<String, Object> paramMap)  throws Exception{
		// TODO Auto-generated method stub
		//동일일자 데이터 삭제
		offertoryMapper.deleteFinance(paramMap);
		
		//해당일의 모든 현금을 재정으로 등록
		offertoryMapper.insertFinance(paramMap);
	}

	public List<Map<Object, String>> offerList(Map<String, Object> paramMap) throws Exception{
		// TODO Auto-generated method stub
		return offertoryMapper.offerList(paramMap);
	}

	public void updateMngOfferInfo(Map<String, Object> paramMap) throws Exception{
		// TODO Auto-generated method stub
		
		// 기존헌금 내역 백업 
		offertoryMapper.insertOfferInfoHis(paramMap);
		
		// 기존금은 차감 및 현재금액 추가
		//차감
		offertoryMapper.updateOffFinanceMinus(paramMap);
		
		//증감
		offertoryMapper.updateOffFinancePluse(paramMap);
	
		// 신규 헌금내역 업데이트
		offertoryMapper.updateMngOfferInfo(paramMap);
		
	}

	public void deletMngOfferInfo(Map<String, Object> paramMap) throws Exception{
		// TODO Auto-generated method stub
		
		// 기존헌금 내역 백업 
		offertoryMapper.insertOfferInfoHis(paramMap);
		
		//차감
		offertoryMapper.updateOffFinanceMinus(paramMap);
		
		//헌금내역 삭제
		offertoryMapper.deleteMngOfferInfo(paramMap);
	}

	public List<Map<Object, String>> offerListSum(Map<String, Object> paramMap)  throws Exception{
		// TODO Auto-generated method stub
		return offertoryMapper.offerListSum(paramMap);
	}

	public List<Map<Object, String>> offerDataList(Map<String, Object> paramMap)  throws Exception{
		// TODO Auto-generated method stub
		return offertoryMapper.offerDataList(paramMap);
	}



}
