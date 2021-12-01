package com.dongne.fboard;

import java.util.Calendar;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongne.club.ClubDTO;
import com.dongne.region.RegionService;
import com.dongne.user.UserDTO;
import com.dongne.user.UserService;
import com.dongne.utility.Utility;

@Controller
public class FboardController {
	
	@Autowired
	@Qualifier("com.dongne.user.UserServiceImpl")
	private UserService uservice;
	
	@Autowired
	@Qualifier("com.dongne.fboard.FboardServiceImpl")
	private FboardService service;
	
	@Autowired
	@Qualifier("com.dongne.region.RegionServiceImpl")
	private RegionService rservice;

	
	@GetMapping("/fboard/read")
	public String read(int fbID, Model model, HttpSession session) {
		service.upCnt(fbID);

		FboardDTO dto = service.read(fbID);
		
		UserDTO user = uservice.read(dto.getUserID());
		String gender = user.getGender();

		String content = dto.getContent().replaceAll("\r\n", "<br>");

		dto.setContent(content);

		model.addAttribute("dto", dto);
		model.addAttribute("gender", gender);
		
		if(session.getAttribute("ID") == null) {
			return "redirect:/user/login";
		}
		
		return "/fboard/read";
	}
	
	@GetMapping("/fboard/create")
	public String create(HttpSession session, Model model) {

		String userID = (String) session.getAttribute("ID");
		
		UserDTO user = uservice.read(userID);
		String nickname = user.getNickname();
		int regionID = user.getRegionID();
		String gender = user.getGender();
		String birth1 = user.getBirth();
	    int year = Calendar.getInstance().get(Calendar.YEAR);
	    String age = birth1.substring(0,4);
	    int birth3 = Integer.parseInt(age);
	    int birth4 = year - birth3 + 1;
	    String birth5 = Integer.toString(birth4);
	
		model.addAttribute("userID", userID);
		model.addAttribute("nickname", nickname);
		model.addAttribute("regionID", regionID);
		model.addAttribute("gender", gender);
		model.addAttribute("age", birth5);

		return "/fboard/create";
	}

	@PostMapping("/fboard/create")
	public String create(FboardDTO dto) {
		if (service.create(dto) > 0) {
			return "redirect:/fboard/list";
		} else {
			return "error";
		}
	}
	
	@GetMapping("/fboard/list")
	public String list(HttpServletRequest request, HttpSession session) {
		String realLocation = (String) session.getAttribute("realLocation");
		String regionID = "";
		
		if ((String) session.getAttribute("ID") == null) {
			session.setAttribute("region", rservice.read(Utility.getRegionCode(realLocation)).getRegionID());
			int sv = (Integer) session.getAttribute("region");
			
			String myRegionID=Utility.checkNull(Integer.toString(sv));
			
			 regionID = Utility.checkNull(request.getParameter("regionID"));

				if (regionID == "") {
					regionID = myRegionID;
				}
		} else {
		int sv=(Integer)session.getAttribute("region");
		String myRegionID=Utility.checkNull(Integer.toString(sv));

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

		int total = service.total(map);

		List<FboardDTO> list = service.list(map);
		

		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		request.setAttribute("regionID", regionID);
		
		return "/fboard/list";
	}
	
	@PostMapping("/fboard/update")
	public String update(FboardDTO dto, Model model, HttpSession session) {
		String ID= dto.getUserID();
		String sID=(String)session.getAttribute("ID");

		int cnt=0;
		
		if(ID.compareTo(sID)==0) {
			cnt = service.update(dto);
		}
		
		if(cnt==1) {
			return "redirect:/fboard/list";
		}else {
			return "error";
		}
	}

	@GetMapping("/fboard/update")
	public String update(int fbID, Model model) {

		model.addAttribute("dto",service.read(fbID));

		return "/fboard/update";
	}
	
	  @GetMapping("/fboard/delete")
	  public String delete(int fbID, Model model) {
		  model.addAttribute("dto",service.read(fbID));
	    return "/fboard/delete";
	  }
	  
	  @PostMapping("/fboard/delete")
	  public String delete(FboardDTO dto, HttpServletRequest request, HttpSession session) {
		  
		  int fbID=dto.getFbID();
			String ID= dto.getUserID();
			String sID=(String)session.getAttribute("ID");
			
			int cnt=0;
			
			if(ID.compareTo(sID)==0) {
				cnt = service.delete(fbID);
			}else {
				return "error";
			}
			
			if(cnt==1) {
				return "redirect:/fboard/list";
			}else {
				return "error";
			}
			
		}
	
}
