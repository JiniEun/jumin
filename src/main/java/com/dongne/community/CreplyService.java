package com.dongne.community;

import java.util.List;
import java.util.Map;

public interface CreplyService {

	int create(Map map);

	List<CreplyDTO> list(Map map);

	CreplyDTO read(int crid);

	int update(CreplyDTO dto);

	int delete(int crid);

	int total(Map map);

	int total(int cid);

}
