package com.dongne.community;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("com.dongne.community.CreplyServiceImpl")
public class CreplyServiceImpl implements CreplyService {

	@Autowired
	private CreplyMapper mapper;

	

	@Override
	public List<CreplyDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public CreplyDTO read(int crid) {
		// TODO Auto-generated method stub
		return mapper.read(crid);
	}

	@Override
	public int update(CreplyDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public int delete(int crid) {
		// TODO Auto-generated method stub
		return mapper.delete(crid);
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return total(map);
	}

	@Override
	public int create(Map map) {
		// TODO Auto-generated method stub
		return mapper.create(map);
	}

	@Override
	public int total(int cid) {
		// TODO Auto-generated method stub
		return mapper.total(cid);
	}
}
