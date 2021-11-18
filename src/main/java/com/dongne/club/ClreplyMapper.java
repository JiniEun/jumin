package com.dongne.club;

import java.util.List;
import java.util.Map;

public interface ClreplyMapper {

	int total(int clID);

	int create(Map map);

	int delete(int clrID);

	List<ClreplyDTO> list(Map map);
	
	ClreplyDTO read(int clrID);

	int total(Map map);

	int update(ClreplyDTO dto);

}
