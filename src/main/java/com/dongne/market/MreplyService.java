package com.dongne.market;

import java.util.List;
import java.util.Map;

public interface MreplyService {
	
	int create(Map map);
	 
    List<MreplyDTO> list(Map map);
 
    MreplyDTO read(int mrid);
  
    int update(MreplyDTO dto); 
   
    int delete(int mrid);
 


	int total(Map map);

	int total(int mid);

}
