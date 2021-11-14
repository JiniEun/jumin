package com.dongne.tour;

import java.util.List;
import java.util.Map;

public interface TreplyMapper {



	int total(int tid);

	int create(Map map);

	int delete(int trid);

	List<TreplyDTO> list(int tid);

	int total(Map map);

	int update(TreplyDTO dto);

	

}
