package com.dongne.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongne.region.RegionService;
import com.dongne.user.UserDTO;
import com.dongne.user.UserService;
import com.dongne.utility.Utility;

@Controller
public class CommunityController {

	@Autowired
	@Qualifier("com.dongne.community.CommunityServiceImpl")
	private CommunityService service;

	@Autowired
	@Qualifier("com.dongne.user.UserServiceImpl")
	private UserService uservice;

	@Autowired
	@Qualifier("com.dongne.region.RegionServiceImpl")
	private RegionService rservice;

	@RequestMapping("/community/list")
	public String list(HttpSession session, HttpServletRequest request) {
		String realLocation = (String) session.getAttribute("realLocation");
		String regionID = "";

		if ((String) session.getAttribute("ID") == null) {
			session.setAttribute("region", rservice.read(Utility.getRegionCode(realLocation)).getRegionID());
			int sv = (Integer) session.getAttribute("region");

			String myRegionID = Utility.checkNull(Integer.toString(sv));

			regionID = Utility.checkNull(request.getParameter("regionID"));

			if (regionID == "") {
				regionID = myRegionID;
			}
		} else {
			int sv = (Integer) session.getAttribute("region");
			String myRegionID = Utility.checkNull(Integer.toString(sv));

			regionID = Utility.checkNull(request.getParameter("regionID"));

			if (regionID == "") {
				regionID = myRegionID;
			}

		}

		// 검색관련------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}

		// 페이지관련-----------------------
		int nowPage = 1;// 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;// 한페이지당 보여줄 레코드갯수

		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("regionID", regionID);
		map.put("cnt", recordPerPage);

		int total = service.totalRegion(map);

		List<CommunityDTO> list = service.list(map);

		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("regionID", regionID);
		request.setAttribute("paging", paging);

		System.out.println(regionID);

		return "/community/list";
	}

	@GetMapping("/community/create")
	public String create(HttpSession session, Model model) {

		String ID = (String) session.getAttribute("ID");
		model.addAttribute("ID", ID);

		UserDTO user = uservice.read(ID);
		String nickname = user.getNickname();
		model.addAttribute("nickname", nickname);

		int regionID = user.getRegionID();
		model.addAttribute("regionID", regionID);

		return "/community/create";
	}

	@PostMapping("/community/create")
	public String create(CommunityDTO dto, HttpSession session, Model model) {

		if (service.create(dto) > 0) {
			return "redirect:/community/list";
		} else {
			return "/error";
		}

	}

	@GetMapping("/community/read/{cid}")
	public String read(@PathVariable("cid") int cid, Model model, HttpServletRequest request) {

		service.upCnt(cid);

		CommunityDTO dto = service.read(cid);

		model.addAttribute("dto", dto);

		/* 댓글 관련 시작 */
		int nPage = 1;
		if (request.getParameter("nPage") != null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		int recordPerPage = 3;

		int sno = ((nPage - 1) * recordPerPage) + 1;
		int eno = nPage * recordPerPage;

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("nPage", nPage);

		model.addAllAttributes(map);

		/* 댓글 처리 끝 */

		return "/community/read";
	}

	@GetMapping("/community/update")
	public String update(int cid, Model model, HttpSession session) {

		CommunityDTO dto = service.read(cid);
		System.out.println(dto.toString());

		String writer = dto.getId();
		System.out.println(writer);

		String sID = Utility.checkNull((String) session.getAttribute("ID"));

		model.addAttribute("dto", dto);

		if (writer.compareTo(sID) != 0) {
			return "/user/login";
		} else {
			return "/community/update";
		}
	}

	@PostMapping("/community/update")
	public String update(CommunityDTO dto, HttpSession session) {

		Map map = new HashMap();
		map.put("cid", dto.getCid());

		int cnt = 0;

		cnt = service.update(dto);

		System.out.println(dto.toString());

		if (cnt == 1) {
			return "redirect:/community/list";
		} else {
			return "error";
		}
	}

	@GetMapping("/community/delete")
	public String delete(int cid, Model model, HttpSession session) {

		CommunityDTO dto = service.read(cid);

		String ID = dto.getId();
		String sID = Utility.checkNull((String) session.getAttribute("ID"));

		model.addAttribute("dto", dto);

		if (ID.compareTo(sID) != 0) {
			return "/user/login";
		} else
			return "/community/delete";

	}

	@PostMapping("/community/delete")
	public String delete(int cid, HttpServletRequest request, HttpSession session) {

		int cnt = service.delete(cid);

		if (cnt == 1) {
			return "redirect:/community/list";
		} else {
			return "error";
		}

	}

}