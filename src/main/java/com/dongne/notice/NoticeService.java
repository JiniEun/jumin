package com.dongne.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	List<NoticeDTO> list(Map map);

	int total(Map map);

	NoticeDTO read(int nID);

	void upCnt(int nID);

	int create(NoticeDTO dto);

	int update(NoticeDTO dto);

	int delete(int nID);
	
	int checkPassword(Map map);
}
