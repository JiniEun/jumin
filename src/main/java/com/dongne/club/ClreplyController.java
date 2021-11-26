package com.dongne.club;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongne.user.UserDTO;
import com.dongne.user.UserService;

@Controller
@RequestMapping("/club/reply")
public class ClreplyController {

	@Autowired
	@Qualifier("com.dongne.club.ClreplyServiceImpl")
	private ClreplyService service;
	@Autowired
	@Qualifier("com.dongne.user.UserServiceImpl")
	private UserService uservice;

	@RequestMapping("/list")
	@ResponseBody
	public Map list(@RequestParam int clID, @RequestParam(value = "page", defaultValue = "1", required = false) int page, ClreplyDTO dto) {

		int limit = 3;
		int listcount = service.total(clID);
		// 총 페이지수
		int maxpage = (listcount + limit - 1) / limit; // (13 + 9) / 10

		// 시작 페이지수
		int startpage = ((page - 1) / 10) * 10 + 1;

		// 마지막 페이지수
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		dto.setLimit(limit);
		dto.setPage(page);
		dto.setStartpage(startpage);
		dto.setEndpage(endpage);
		dto.setMaxpage(maxpage);
		System.out.println("Page :" + page);
		System.out.println("startPage :" + startpage);
		System.out.println("endPage : " + endpage);

		int nowPage = page;// 현재 보고있는 페이지

		int recordPerPage = 3;// 한페이지당 보여줄 레코드갯수

		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("clID", clID);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("list", service.list(map));
		map.put("page", page);
		map.put("startpage", startpage);
		map.put("endpage", endpage);

		return map;
	}

	@RequestMapping("/create")
	@ResponseBody
	public int create(@RequestParam int clID, @RequestParam String content, Map map, HttpSession session) {

		String ID = (String) session.getAttribute("ID");

		UserDTO user = uservice.read(ID);
		String nickname = user.getNickname();

		map.put("clID", clID);
		map.put("ID", ID);
		map.put("nickname", nickname);
		map.put("content", content);

		return service.create(map);

	}

	@RequestMapping("/delete/{clrID}")
	@ResponseBody
	public void delete(@PathVariable int clrID) {

		service.delete(clrID);

	}

	@RequestMapping("/update/{clrID}")
	@ResponseBody
	public int update(ClreplyDTO dto, @PathVariable int clrID, @RequestParam("clID") int clID,
			@RequestParam("content") String content, HttpSession session) {
		String id = (String) session.getAttribute("ID");

		dto.setContent(content);

		dto.setClID(clID);

		dto.setClrID(clrID);

		if (session.getAttribute("ID") != null) {
			return service.update(dto);
		} else {
			return 0;
		}
	}
}
