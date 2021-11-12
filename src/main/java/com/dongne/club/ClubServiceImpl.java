package com.dongne.club;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@MapperScan(basePackages = "com.dongne.club")
@Service("com.dongne.club.ClubServiceImpl")
public class ClubServiceImpl implements ClubService {
	  @Autowired
	  private ClubMapper mapper;
	
	  @Override
	  public int create(ClubDTO dto) {
	    // TODO Auto-generated method stub
	    return mapper.create(dto);
	  }
	  
	  @Override
		public int update(ClubDTO dto) {
			// TODO Auto-generated method stub
			return mapper.update(dto);
	  }
	  
	  @Override
		public int total(Map map) {
			// TODO Auto-generated method stub
			return mapper.total(map);
	  }
	  
	  @Override
		public List<ClubDTO> list(Map map) {
			// TODO Auto-generated method stub
			return mapper.list(map);
		}
	  
	  
	  @Override
		public ClubDTO read(int clID) {
			// TODO Auto-generated method stub
			return mapper.read(clID);
		}
	  
	  @Override
	  public void upViewcnt(int clID) {
	  	mapper.upViewcnt(clID);
	  }
	  
	  @Override
	  public int passwd(Map map) {
	  	// TODO Auto-generated method stub
	  	return mapper.passwd(map);
	  }
	  
	  @Override
	  public int delete(int clID) {
	  	// TODO Auto-generated method stub
	  	return mapper.delete(clID);
	  }
}
