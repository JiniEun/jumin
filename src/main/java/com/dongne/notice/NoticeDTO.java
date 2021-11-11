package com.dongne.notice;

import lombok.Data;

@Data
public class NoticeDTO {
	private int nID;
	private String title;
	private String content;
	private String password;
	private int viewcnt;
	private String rdate;
	private String ID; // for user id
}
