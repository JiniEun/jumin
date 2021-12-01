package com.dongne.fboard;

import lombok.Data;

@Data
public class FboardDTO {
	private int fbID;
	private String category;
	private String title;
	private String content;
	private String rdate;
	private String userID; // for user id
	private String nickname;
	private int regionID;
	private String gender;
	private String age;
}
