package com.dongne.tour;

import java.util.List;
import java.util.Map;

public interface TreplyService {

	


	int delete(int trid);

	int create(Map map);


	List<TreplyDTO> list();

	int total(Map map);

}
