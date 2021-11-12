package com.dongne.tour;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.dongne.tour.TreplyServiceImpl")
public class TreplyServiceImpl implements TreplyService {
	
	@Autowired
	private TreplyMapper mapper;
	
	

	@Override
	public int create(Map map) {
		// TODO Auto-generated method stub
		return mapper.create(map);
	}

	@Override
	public int delete(int trid) {
		// TODO Auto-generated method stub
		return mapper.delete(trid);
	}

	@Override
	public List<TreplyDTO> list() {
		// TODO Auto-generated method stub
		return mapper.list();
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

}
