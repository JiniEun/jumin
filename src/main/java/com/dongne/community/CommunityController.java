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

import com.dongne.tour.TourDTO;
import com.dongne.utility.Utility;

@Controller
public class CommunityController {
	
	@Autowired
	@Qualifier("com.dongne.community.CommunityServiceImpl")
	private CommunityService service;

	@RequestMapping("/community/list")
	public String list(HttpServletRequest request) {

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
	    map.put("cnt", recordPerPage);
	 
	    int total = service.total(map);
	 
	    List<CommunityDTO> list = service.list(map);
	 
	    String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
	 
	    // request에 Model사용 결과 담는다
	    request.setAttribute("list", list);
	    request.setAttribute("nowPage", nowPage);
	    request.setAttribute("col", col);
	    request.setAttribute("word", word);
	    request.setAttribute("paging", paging);
	    
		return "/community/list";
	}
	
	@GetMapping("/community/create")
	  public String create() {
	 
	    return "/community/create";
	  }

	@PostMapping("/community/create")
	  public String create(CommunityDTO dto) {
	 
	    if (service.create(dto) > 0) {
	      return "redirect:/community/list";
	    } else {
	      return "/error";
	    }
	 
	  }
	
	@GetMapping("/community/read/{cid}")
	  public String read(@PathVariable("cid") int cid,Model model) {
	    
	    service.upCnt(cid);
	    
	    CommunityDTO dto = service.read(cid);
	    
	    String content = dto.getContent().replaceAll("\r\n", "<br>");
	    
	    dto.setContent(content);
	    
	    model.addAttribute("dto",dto);
	    
	    return "/community/read";
	  }
	
	@GetMapping("/community/update")
	public String update(int cid, Model model) {
		
		CommunityDTO dto = service.read(cid);
		
		model.addAttribute("dto",dto);
		
		return "/community/update";
	}
	
	@PostMapping("/community/update")
	public String update(CommunityDTO dto) {
		
		int cnt = service.update(dto);
		
		if (cnt == 1) {
			return "redirect:/community/list";
		} else {
			return "error";
		}
	     

		
	}
	
	
	
}
