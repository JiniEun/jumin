package com.dongne.tour;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TourDTO {
	private int tid;
	private String title;
	private String writer;
	private String rdate;
	private String viewcnt;
	private String score;
	private String contents;
	private String password;
	private String filename;
	private String nickname;
	private String districtcode;
	private String addname;

	private MultipartFile filenameMF;
}