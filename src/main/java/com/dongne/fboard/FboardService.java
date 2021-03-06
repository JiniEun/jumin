package com.dongne.fboard;

import java.util.List;
import java.util.Map;

public interface FboardService {
	List<FboardDTO> list(Map map);

	int total(Map map);

	FboardDTO read(int fbID);

	int create(FboardDTO dto);

	int update(FboardDTO dto);

	int delete(int fbID);
	
	int totalRegion(Map map);
	
}
