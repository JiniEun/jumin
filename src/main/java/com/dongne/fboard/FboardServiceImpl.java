package com.dongne.fboard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.dongne.fboard.FboardServiceImpl")
public class FboardServiceImpl implements FboardService {
	@Autowired
	private FboardMapper mapper;

	@Override
	public List<FboardDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public FboardDTO read(int fbID) {
		// TODO Auto-generated method stub
		return mapper.read(fbID);
	}


	@Override
	public int create(FboardDTO dto) {
		return mapper.create(dto);
	}

	@Override
	public int update(FboardDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public int delete(int fbID) {
		// TODO Auto-generated method stub
		return mapper.delete(fbID);
	}

	
}
