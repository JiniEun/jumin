package com.dongne.club;

import lombok.Data;

@Data
public class ClreplyDTO {
	
	private int clrID;              
    private String content;              
    private String rdate;
    private String ID;
    private int clID;
    private String nickname;
    
    private int limit;
    private int page;
    private int startpage;
    private int endpage;
    private int maxpage;
}
