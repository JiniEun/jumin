package com.dongne.tour;

import java.util.List;
import java.util.Map;

public interface TreplyMapper {



	int total(int tid);

	int create(Map map);

	int delete(int trid);

	List<TreplyDTO> list(Map map);

	int total(Map map);

	int update(TreplyDTO dto);

	

}
