package com.dongne.tour;

import java.util.List;
import java.util.Map;

public interface TreplyService {

	


	int delete(int trid);

	int create(Map map);


	int total(Map map);

	int update(TreplyDTO dto);

	List<TreplyDTO> list(Map map);

	int total(int tid);

	 

}
