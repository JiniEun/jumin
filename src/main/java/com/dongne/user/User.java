package com.dongne.user;

import java.io.File;

public class User {
	/** 페이지당 출력할 레코드 갯수 */
	public static int RECORD_PER_PAGE = 3;

	// Windows, VMWare, AWS cloud 절대 경로 설정
	public static synchronized String getUploadDir() {
		String path = "";
		if (File.separator.equals("\\")) {
			path = "f:/AIstudy/deploy/dongne/user/storage/";
			System.out.println("Windows 10: " + path);

		} else {
			// System.out.println("Linux");
			// 은진 - mac 경로
			path = "/home/ubuntu/deploy/jumin/user/storage/";
//			path = "/Users/AIstudy/deploy/jumin/user/storage/";

		}

		return path;
	}

}
