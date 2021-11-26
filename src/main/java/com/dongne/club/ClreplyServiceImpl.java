package com.dongne.club;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.dongne.club.ClreplyServiceImpl")
public class ClreplyServiceImpl implements ClreplyService {

	@Autowired
	private ClreplyMapper mapper;

	@Override
	public int create(Map map) {
		// TODO Auto-generated method stub
		return mapper.create(map);
	}

	@Override
	public int delete(int clrID) {
		// TODO Auto-generated method stub
		return mapper.delete(clrID);
	}

	@Override
	public List<ClreplyDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public int update(ClreplyDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public int total(int clID) {
		// TODO Auto-generated method stub
		return mapper.total(clID);
	}

}
