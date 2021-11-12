package com.dongne.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

	@Autowired
	@Qualifier("com.dongne.user.UserServiceImpl")
	private UserService service;

	@GetMapping("/")
	public String home() {

		return "/home";
	}

	@GetMapping("/user/login")
	public String login(HttpServletRequest request) {
		/*----쿠키설정 내용시작----------------------------*/
		String c_id = ""; // ID 저장 여부를 저장하는 변수, Y
		String c_id_val = ""; // ID 값

		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];

				if (cookie.getName().equals("c_id")) {
					c_id = cookie.getValue(); // Y
				} else if (cookie.getName().equals("c_id_val")) {
					c_id_val = cookie.getValue(); // user1...
				}
			}
		}
		/*----쿠키설정 내용 끝----------------------------*/
		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);

		return "/user/login";
	}

	@PostMapping("user/login")
	public String login(@RequestParam Map<String, String> map, HttpSession session, HttpServletResponse response,
			Model model) {

		int cnt = service.loginCheck(map);
		
		System.out.println(map);
		System.out.println(cnt);

		if (cnt > 0) {
			System.out.println(cnt);
			String grade = service.getGrade(map.get("ID"));
			session.setAttribute("ID", map.get("ID"));
			session.setAttribute("grade", grade);

			// Cookie 저장, id 저장 여부 및 id
			Cookie cookie = null;
			String c_id = map.get("c_id");
			if (c_id != null) {
				cookie = new Cookie("c_id", c_id);
				cookie.setMaxAge(60 * 60 * 24 * 365);// 1년
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", map.get("ID"));
				cookie.setMaxAge(60 * 60 * 24 * 365);// 1년
				response.addCookie(cookie);
			} else {
				cookie = new Cookie("c_id", ""); // 쿠키 삭제
				cookie.setMaxAge(0);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", "");// 쿠키 삭제
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}

		if (cnt > 0) {
			return "redirect:/";
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호를 잘못 입력 했거나 <br>회원이 아닙니다. 회원가입 하세요");
			return "/user/errorMsg";
		}
	}

	@GetMapping("/user/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";

	}

	@GetMapping(value = "/user/emailcheck", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, String> emailcheck(String email) {

		int cnt = service.duplicatedEmail(email);

		Map<String, String> map = new HashMap<String, String>();
		if (cnt > 0) {
			map.put("str", email + "는 중복되어서 사용할 수 없습니다.");

		} else {
			map.put("str", email + "는 중복아님, 사용가능 합니다.");
		}

		return map;

	}

	@GetMapping(value = "/user/idcheck", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, String> idcheck(String ID) {

		int cnt = service.duplicatedId(ID);

		Map<String, String> map = new HashMap<String, String>();
		if (cnt > 0) {
			map.put("str", ID + "는 중복되어서 사용할 수 없습니다.");

		} else {
			map.put("str", ID + "는 중복 아님, 사용가능 합니다.");
		}

		return map;

	}

	@GetMapping("/user/create")
	public String create(HttpServletRequest request) {
		return "/user/create";
	}

	@PostMapping("/user/create")
	public String create(UserDTO dto, HttpServletRequest request) {

		System.out.println(dto.toString());
		
		if (service.create(dto) > 0) {
			return "redirect:/";
		} else {
			return "error";
		}
	}

	@GetMapping("/user/mypage")
	public String mypage(HttpSession session, Model model) {

		String id = (String) session.getAttribute("ID");

		if (id == null) {
			return "redirect:/user/login/";
		} else {

			UserDTO dto = service.read(id);

			model.addAttribute("dto", dto);

			return "/user/mypage";
		}
	}
	

}
