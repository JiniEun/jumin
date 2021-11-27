package com.dongne.message;

import lombok.Data;

@Data
public class MessageDTO {
	private int meID;
	private int roomID;
	private String sender;
	private String receiver;
	private String content;
	private String sendTime;
	private String readTime;
	private int readChk;
	
	private String otherID;
	private String ID;
	private int unread;
}
