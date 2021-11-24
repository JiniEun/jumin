package com.dongne.message;
import lombok.Data;

@Data
public class MessageDTO {
	private int mno;
	private int room;    
	private String sendID;
	private String recvID;
	private String sendTime;
	private String readTime;
	private String content;
	private int readChk;
	private String otherID; //현재 사용자의 메세지 상대 id
	private String profile; //현재 사용자의 메세지 상대 profile
	private String ID; //현재 사용자 id
	private int unread; //안읽은 메세지 갯수
}
