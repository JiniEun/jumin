package com.dongne.market;

import java.io.File;

public class Market {

	/** 페이지당 출력할 레코드 갯수 */
	public static int RECORD_PER_PAGE = 3;

	// Windows, VMWare, AWS cloud 절대 경로 설정
	public static synchronized String getUploadDir() {
		String path = "";
		if (File.separator.equals("\\")) {
			path = "E:/Aistudy/deploy/dongne/market/storage/";
			System.out.println("Windows 10: " + path);

		} else {
			// System.out.println("Linux");
			path = "/home/ubuntu/deploy/jumin/market/storage/";
			// 은진 - mac 경로
//			path = "/Users/AIstudy/deploy/jumin/market/storage/";
		}

		return path;
	}

}
