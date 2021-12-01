package com.dongne.club;

import org.springframework.web.multipart.MultipartFile;
import lombok.Data;

@Data
public class ClubDTO {
	private int clID;
	private String title;
	private String content;
	private int viewcnt;
	private String rdate;
	private String fileName;
	private MultipartFile fileNameMF;
	private String ID;
	private String nickname;
	private int regionID;
}
