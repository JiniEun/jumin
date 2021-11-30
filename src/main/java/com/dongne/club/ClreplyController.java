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
import com.dongne.utility.Utility;

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

		if (session.getAttribute("ID") != null) {
			UserDTO user = uservice.read(ID);
			String nickname = user.getNickname();

			map.put("ID", ID);
			map.put("nickname", nickname);
			map.put("clID", clID);
			map.put("content", content);
			return service.create(map);
		} else {
			return 0;
		}

	}

	@RequestMapping("/delete/{clrID}")
	@ResponseBody
	public int delete(@PathVariable int clrID, @RequestParam("replyid") String replyid, HttpSession session) {

		String ID = Utility.checkNull((String) session.getAttribute("ID"));

		System.out.println(ID);
		System.out.println("여가까자ㅣ");

		if (ID.compareTo(replyid) == 0) {
			System.out.println("아이디 같음");
			return service.delete(clrID);
		} else {
			System.out.println("아이디 다름");
			return 0;
		}

	}

	@RequestMapping("/update/{clrID}")
	@ResponseBody
	public int update(ClreplyDTO dto, @PathVariable int clrID, @RequestParam("clID") int clID,
			@RequestParam("replyid") String replyid, @RequestParam("content") String content, HttpSession session) {
		String ID = Utility.checkNull((String) session.getAttribute("ID"));

		dto.setContent(content);

		dto.setClID(clID);

		dto.setClrID(clrID);

		if (ID.compareTo(replyid) == 0) {
			return service.update(dto);
		} else {
			return 0;
		}
	}
}
