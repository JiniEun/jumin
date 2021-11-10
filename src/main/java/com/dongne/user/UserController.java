package com.dongne.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	

	@GetMapping(value = "/member/emailcheck", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, String> emailcheck(String email) {

//		int cnt = service.duplicatedEmail(email);

		Map<String, String> map = new HashMap<String, String>();
//		if (cnt > 0) {
//			map.put("str", email + "는 중복되어서 사용할 수 없습니다.");
//
//		} else {
//			map.put("str", email + "는 중복아님, 사용가능 합니다.");
//		}

		return map;

	}

	@GetMapping(value = "/member/idcheck", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, String> idcheck(String id) {

//		int cnt = service.duplicatedId(id);

		Map<String, String> map = new HashMap<String, String>();
//		if (cnt > 0) {
//			map.put("str", id + "는 중복되어서 사용할 수 없습니다.");
//
//		} else {
//			map.put("str", id + "는 중복아님, 사용가능 합니다.");
//		}

		return map;

	}
	
	@GetMapping("/user/create")
	public String create(HttpServletRequest request) {
		return "/user/create";
	}
	
	@PostMapping("/user/create")
	public String create(UserDTO dto, HttpServletRequest request) {
		
		
//		if (service.create(dto) > 0) {
			return "redirect:/";
//		} else {
//			return "error";
//		}
	}
	
	
	
	@GetMapping("/user/mypage")
	public String mypage(HttpServletRequest request) {
		return "/user/mypage";
	}
}
