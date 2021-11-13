package com.dongne.market;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.dongne.market.MarketServiceImpl")
public class MarketServiceImpl implements MarketService {

	@Autowired
	private MarketMapper mapper;

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public List<MarketDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int create(MarketDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	
}
