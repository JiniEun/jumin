package com.dongne.community;

import java.util.List;
import java.util.Map;

public interface CreplyMapper {
	
		int create(Map map);
	 
	    List<CreplyDTO> list(Map map);
	 
	    CreplyDTO read(int crid);
	  
	    int update(CreplyDTO dto); 
	   
	    int delete(int crid);
	 
	    int total(int cid);
	    
	    int total(Map map);


}
