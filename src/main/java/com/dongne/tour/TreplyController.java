package com.dongne.tour;

import java.util.HashMap;
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
@RequestMapping("/reply")
public class TreplyController {

	@Autowired
	@Qualifier("com.dongne.tour.TreplyServiceImpl")
	private TreplyService service;

	@Autowired
	@Qualifier("com.dongne.user.UserServiceImpl")
	private UserService uservice;

	@RequestMapping("/list")
	@ResponseBody
	public Map list(@RequestParam int tid, @RequestParam(value = "page", defaultValue = "1", required = false) int page,
			TreplyDTO dto) {

		int limit = 3;
		int listcount = service.total(tid);
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

		int nowPage = page;// 현재 보고있는 페이지

		int recordPerPage = 3;// 한페이지당 보여줄 레코드갯수

		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("tid", tid);
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
	public int create(@RequestParam int tid, @RequestParam String content, Map map, HttpSession session) {

		String sid = (String) session.getAttribute("ID");

		if (session.getAttribute("ID") != null) {
			UserDTO user = uservice.read(sid);
			String nickname = user.getNickname();

			map.put("id", sid);
			map.put("nickname", nickname);
			map.put("tid", tid);
			map.put("content", content);
			return service.create(map);
		} else {
			return 0;
		}

	}

	@RequestMapping("/delete/{trid}")
	@ResponseBody
	public int delete(@PathVariable int trid, @RequestParam("replyid") String replyid, HttpSession session) {
		String sid = Utility.checkNull((String) session.getAttribute("ID"));

		if (sid.compareTo(replyid) == 0) {
			return service.delete(trid);
		} else {
			return 0;
		}

	}

	@RequestMapping("/update/{trid}")
	@ResponseBody
	public int update(TreplyDTO dto, @PathVariable int trid, @RequestParam("tid") int tid,
			@RequestParam("replyid") String replyid, @RequestParam("content") String content, HttpSession session) {

		String sid = Utility.checkNull((String) session.getAttribute("ID"));

		dto.setContent(content);
		dto.setTid(tid);
		dto.setTrid(trid);

		if (sid.compareTo(replyid) == 0) {
			return service.update(dto);
		} else {
			return 0;
		}
	}
}