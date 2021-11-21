package com.dongne.club;

import java.io.File;

public class Club {
	/** 페이지당 출력할 레코드 갯수 */
	public static int RECORD_PER_PAGE = 3;

	// Windows, VMWare, AWS cloud 절대 경로 설정
	public static synchronized String getUploadDir() {
		String path = "";
		if (File.separator.equals("\\")) {
			path = "c:/AIstudy/deploy/jumin/club/storage/";
			System.out.println("Windows 10: " + path);

		} else {
			// System.out.println("Linux");
			path = "/home/ubuntu/deploy/jumin/club/storage/";
		}

		return path;

	}
}
