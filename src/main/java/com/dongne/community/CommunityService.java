package com.dongne.community;

import java.util.List;
import java.util.Map;

import com.dongne.tour.TourDTO;

public interface CommunityService {

	int total(Map map);

	List<CommunityDTO> list(Map map);

	int create(CommunityDTO dto);

	void upCnt(int cid);

	CommunityDTO read(int cid);

	int update(CommunityDTO dto);

	int delete(int cid);

}
