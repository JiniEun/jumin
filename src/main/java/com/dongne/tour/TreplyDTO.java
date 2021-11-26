package com.dongne.tour;

import lombok.Data;

@Data
public class TreplyDTO {

	private int trid;
	private String content;
	private String rdate;
	private String id;
	private String nickname;
	private int tid;

	private int limit;
	private int page;
	private int startpage;
	private int endpage;
	private int maxpage;
}
