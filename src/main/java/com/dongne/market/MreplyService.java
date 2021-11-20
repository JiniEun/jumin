package com.dongne.market;

import java.util.List;
import java.util.Map;

public interface MreplyService {
	
	int create(Map map);
	 
    List<MreplyDTO> list(Map map);
 
    MreplyDTO read(int mrid);
  
    int update(MreplyDTO replyDTO); 
   
    int delete(int mrid);
 
    int total(int mid);

}
