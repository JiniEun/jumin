package com.dongne.market;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("com.dongne.market.MreplyServiceImpl")
public class MreplyServiceImpl implements MreplyService {

	@Autowired
	private MreplyMapper mapper;

	

	@Override
	public List<MreplyDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public MreplyDTO read(int mrid) {
		// TODO Auto-generated method stub
		return mapper.read(mrid);
	}

	@Override
	public int update(MreplyDTO replyDTO) {
		// TODO Auto-generated method stub
		return mapper.update(replyDTO);
	}

	@Override
	public int delete(int mrid) {
		// TODO Auto-generated method stub
		return mapper.delete(mrid);
	}

	@Override
	public int total(int mid) {
		// TODO Auto-generated method stub
		return total(mid);
	}

	@Override
	public int create(Map map) {
		// TODO Auto-generated method stub
		return mapper.create(map);
	}
}
