package com.dongne.market;

import java.util.List;
import java.util.Map;

public interface MarketMapper {

	int total(Map map);
	
	int totalRegion(Map map);

	List<MarketDTO> list(Map map);

	int create(MarketDTO dto);

	void upCnt(int mid);

	MarketDTO read(int mid);

	int update(MarketDTO dto);

	int updateFile(Map map);

	int delete(int mid);

}
