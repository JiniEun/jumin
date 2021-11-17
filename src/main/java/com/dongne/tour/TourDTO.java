package com.dongne.tour;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TourDTO {
	private int tid;                                                              
	private String title;                   
	private String writer;                                                    
	private String rdate;                
	private String viewcnt;              
	private int score;                                                                     
	private String contents;             
	private String password;             
	private String id;                   
	private String filename;             
	
	private MultipartFile filenameMF;
}
