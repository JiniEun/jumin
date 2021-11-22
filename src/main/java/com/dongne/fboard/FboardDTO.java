package com.dongne.fboard;

import lombok.Data;

@Data
public class FboardDTO {
	private int fbID;
	private String category;
	private String title;
	private String content;
	private String password;
	private int viewcnt;
	private String rdate;
	private String userID; // for user id
	private String nickname;
}
