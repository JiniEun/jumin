package com.dongne.notice;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	
	@GetMapping("/notice/create")
	public String create(HttpServletRequest request) {

		return "/notice/create";
	}
	
	@GetMapping("/notice/list")
	public String list(HttpServletRequest request) {

		return "/notice/list";
	}
	
	@GetMapping("/notice/update")
	public String update(HttpServletRequest request) {

		return "/notice/update";
	}
	
	@GetMapping("/notice/read")
	public String read(HttpServletRequest request) {

		return "/notice/read";
	}
	
	@GetMapping("/notice/chatbot")
	public String qna(HttpServletRequest request) {

		return "/notice/chatbot";
	}

}
