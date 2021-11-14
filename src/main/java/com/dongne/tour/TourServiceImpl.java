package com.dongne.tour;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.dongne.tour.TourServiceImpl")
public class TourServiceImpl implements TourService{
	@Autowired
	private TourMapper mapper;

	
	@Override
	public int create(TourDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public void upcnt(int tid) {
		// TODO Auto-generated method stub
		mapper.upcnt(tid);
	}

	@Override
	public TourDTO read(int tid) {
		// TODO Auto-generated method stub
		return mapper.read(tid);
	}

	@Override
	public int update(TourDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public int delete(int tid) {
		// TODO Auto-generated method stub
		return mapper.delete(tid);
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public List<TourDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}
	
	
}
