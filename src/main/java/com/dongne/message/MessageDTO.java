package com.dongne.message;

import lombok.Data;

@Data
public class MessageDTO {
	private String title;
	private String recvNick;
	private int cate;
	private String rdate;
	private String content;
	private String sendNick;
	private String ID;
	private int readChk;
}