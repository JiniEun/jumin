package com.dongne.region;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.dongne.region.RegionServiceImpl")
public class RegionServiceImpl implements RegionService {

	@Autowired
	private RegionMapper mapper;

	@Override
	public List<RegionDTO> list() {
		// TODO Auto-generated method stub
		return mapper.list();
	}

	@Override
	public RegionDTO read(int nID) {
		// TODO Auto-generated method stub
		return mapper.read(nID);
	}

}
