package com.dongne.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.dongne.notice.NoticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;

	@Override
	public List<NoticeDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public NoticeDTO read(int nID) {
		// TODO Auto-generated method stub
		return mapper.read(nID);
	}

	@Override
	public void upCnt(int nID) {
		mapper.upCnt(nID);
	}

	@Override
	public int create(NoticeDTO dto) {
		return mapper.create(dto);
	}

	@Override
	public int update(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public int delete(int nID) {
		// TODO Auto-generated method stub
		return mapper.delete(nID);
	}

	@Override
	public int checkPassword(Map map) {
		// TODO Auto-generated method stub
		return mapper.checkPassword(map);
	}

}
