package com.dongne.market;

import java.util.List;
import java.util.Map;


public interface MarketMapper {

	int total(Map map);
	
	List<MarketDTO> list(Map map);

	int create(MarketDTO dto);

}
