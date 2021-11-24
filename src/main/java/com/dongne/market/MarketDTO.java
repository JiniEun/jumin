package com.dongne.market;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MarketDTO {

	private int mid;
	private int viewcnt;
	private String rdate;
	private String title;
	private String content;
	private String id;
	private String nickname;
	private String category;
	private String filename;
	private MultipartFile filenameMF;

}
