package com.dongne.office;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class OfficeDTO {
   private int oid                    ;
   private String oname                  ;
   private String address                ;
   private String webaddress             ;
   private String phone                  ;
   private String filename               ;
   private String contents               ;
   private String id                	;
   private MultipartFile 		filenameMF;
}
