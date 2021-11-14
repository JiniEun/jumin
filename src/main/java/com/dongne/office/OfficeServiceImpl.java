package com.dongne.office;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongne.tour.TourDTO;

@Service("com.dongne.office.OfficeServiceImpl")
public class OfficeServiceImpl implements OfficeService{
	@Autowired
	private OfficeMapper mapper;

	@Override
	public int create(OfficeDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int update(OfficeDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public int delete(int oid) {
		// TODO Auto-generated method stub
		return mapper.delete(oid);
	}

	@Override
	public List<OfficeDTO> list() {
		// TODO Auto-generated method stub
		return mapper.list();
	}

	@Override
	public OfficeDTO read(int oid) {
		// TODO Auto-generated method stub
		return mapper.read(oid);
	}
}
