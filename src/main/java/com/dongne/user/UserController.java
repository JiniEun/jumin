package com.dongne.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	@GetMapping("/")
	public String home() {

		return "/home";
	}
	
	@GetMapping("/user/login")
	public String login(HttpServletRequest request) {

		return "/user/login";
	}
	
	@GetMapping("/user/create")
	public String create(HttpServletRequest request) {
		return "/user/create";
	}
}
