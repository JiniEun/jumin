package com.dongne.community;

import lombok.Data;

@Data
public class CommunityDTO {

	private int cid;
	private int viewcnt;
	private String rdate;
	private String title;
	private String content;
	private String id;
	private String nickname;
	private String category;
	private int regionID;
}
