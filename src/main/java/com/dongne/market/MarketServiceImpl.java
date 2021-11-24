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

	@Override
	public void upCnt(int mid) {
		// TODO Auto-generated method stub
		mapper.upCnt(mid);
	}

	@Override
	public MarketDTO read(int mid) {
		// TODO Auto-generated method stub
		return mapper.read(mid);
	}

	@Override
	public int update(MarketDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public int updateFile(Map map) {
		// TODO Auto-generated method stub
		return mapper.updateFile(map);
	}

	@Override
	public int delete(int mid) {
		// TODO Auto-generated method stub
		return mapper.delete(mid);
	}

}
