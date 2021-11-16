package com.dongne.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongne.user.UserDTO;
import com.dongne.user.UserService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	@Qualifier("com.dongne.user.UserServiceImpl")
	private UserService uservice;
	
	@Autowired
	@Qualifier("com.dongne.notice.NoticeServiceImpl")
	private NoticeService service;
	
	@GetMapping("/create")
	public String create(HttpSession session, Model model) {

		String id = (String) session.getAttribute("ID");
		
//		UserDTO user = uservice.read(id);
		
		model.addAttribute("uname",id);
		
		return "/notice/create";
	}
	
	@GetMapping("/list")
	public String list(HttpServletRequest request) {

		return "/notice/list";
	}
	
	@GetMapping("/update")
	public String update(HttpServletRequest request) {

		return "/notice/update";
	}
	
	@GetMapping("/read")
	public String read(HttpServletRequest request) {

		return "/notice/read";
	}
	
	@GetMapping("/chatbot")
	public String qna(HttpServletRequest request) {

		return "/notice/chatbot";
	}

}
