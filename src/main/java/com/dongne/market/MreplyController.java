package com.dongne.market;

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
@RequestMapping("/market/reply")
public class MreplyController {

	@Autowired
	@Qualifier("com.dongne.market.MreplyServiceImpl")
	private MreplyService service;

	@Autowired
	@Qualifier("com.dongne.user.UserServiceImpl")
	private UserService uservice;

	@RequestMapping("/list")
	@ResponseBody
	public Map list(@RequestParam int mid, @RequestParam(value = "page", defaultValue = "1", required = false) int page,
			MreplyDTO dto) {

		int limit = 3;
		int listcount = service.total(mid);
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
		map.put("mid", mid);
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
	public int create(@RequestParam int mid, @RequestParam String content, Map map, HttpSession session) {

		String ID = (String) session.getAttribute("ID");

		UserDTO user = uservice.read(ID);
		String nickname = user.getNickname();

		map.put("mid", mid);
		map.put("ID", ID);
		map.put("nickname", nickname);
		map.put("content", content);

		return service.create(map);

	}

	@RequestMapping("/delete/{mrid}")
	@ResponseBody
	public int delete(@PathVariable int mrid, @RequestParam("replyid") String replyid, HttpSession session) {

		String ID = Utility.checkNull((String) session.getAttribute("ID"));
		
		if (ID.compareTo(replyid) == 0) {
			
			return service.delete(mrid);
			
		} else {
		
			return 0;
		}

	}

	@RequestMapping("/update/{mrid}")
	@ResponseBody
	public int update(MreplyDTO dto, @PathVariable int mrid, @RequestParam("mid") int mid,
			@RequestParam("replyid") String replyid, @RequestParam("content") String content, HttpSession session) {
		String ID = Utility.checkNull((String) session.getAttribute("ID"));

		dto.setContent(content);

		dto.setMid(mid);

		dto.setMrid(mrid);

		if (ID.compareTo(replyid) == 0) {
			return service.update(dto);
		} else {
			return 0;
		}

	}

}
