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

}
