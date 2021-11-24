package com.dongne.community;

import lombok.Data;

@Data
public class CreplyDTO {
	
	private int crid;              
    private String content;              
    private String rdate;
    private String id;
    private String nickname;
    private int cid;
	
    private int limit;
    private int page;
    private int startpage;
    private int endpage;
    private int maxpage;
}
