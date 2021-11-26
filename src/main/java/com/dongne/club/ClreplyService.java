package com.dongne.club;

import java.util.List;
import java.util.Map;

public interface ClreplyService {
	int delete(int clrID);

	int create(Map map);

	int total(Map map);

	int update(ClreplyDTO dto);

	List<ClreplyDTO> list(Map map);

	int total(int clID);
}
