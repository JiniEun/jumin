package com.dongne.community;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.dongne.community.CommunityServiceImpl")
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityMapper mapper;
	
	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public List<CommunityDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int create(CommunityDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public void upCnt(int cid) {
		// TODO Auto-generated method stub
		mapper.upCnt(cid);
	}

	@Override
	public CommunityDTO read(int cid) {
		// TODO Auto-generated method stub
		return mapper.read(cid);
	}

	@Override
	public int update(CommunityDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	

}
