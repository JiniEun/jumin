package com.dongne.tour;

import java.util.List;
import java.util.Map;

public interface TreplyMapper {

	List<TreplyDTO> list(Map map);

	int total(int tid);

}
