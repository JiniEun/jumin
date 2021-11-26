package com.dongne.market;

import lombok.Data;

@Data
public class MreplyDTO {

	private int mrid;
	private String content;
	private String rdate;
	private String id;
	private String nickname;
	private int mid;

	private int limit;
	private int page;
	private int startpage;
	private int endpage;
	private int maxpage;
}
