package com.dongne.user;

import lombok.Data;

@Data
public class UserDTO {
	private String ID; // for user id
	private String uname;
	private String nickname;
	private String password;
	private String email;
	private String phone;
	private String address1;
	private String address2;
	private String gender;
	private String birth;
	private String rdate;
	private String fileName;
	private String grade; // default 'H'
}
