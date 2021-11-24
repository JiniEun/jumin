package com.dongne.market;

import java.util.List;
import java.util.Map;

public interface MreplyMapper {
	
		int create(Map map);
	 
	    List<MreplyDTO> list(Map map);
	 
	    MreplyDTO read(int mrid);
	  
	    int update(MreplyDTO dto); 
	   
	    int delete(int mrid);
	 
	    int total(int mid);
	    
	    int total(Map map);


}
