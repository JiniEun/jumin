package com.dongne.club;

import java.util.List;
import java.util.Map;

public interface ClubMapper {
	int create(ClubDTO dto);

	int update(ClubDTO dto);

	int total(Map map);

	List<ClubDTO> list(Map map);

	int updateFile(Map map);

	ClubDTO read(int clID);

	void upViewcnt(int clID);

	int passwd(Map map);

	int delete(int clID);
}
