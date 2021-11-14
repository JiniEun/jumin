package com.dongne.tour;

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

import com.dongne.utility.Utility;

@Controller
public class TourController {
	@Autowired
	@Qualifier("com.dongne.tour.TourServiceImpl")
	private TourService service;
	
	@GetMapping("/tour/create")
	public String create(HttpSession session, Model model) {
		
		String writer=(String)session.getAttribute("ID");

		model.addAttribute("writer", writer);
		
		return "/tour/create";
	}
	
	@PostMapping("/tour/create")
	public String create(TourDTO dto, HttpSession session) {
		
		String upDir = Tour.getUploadDir();
		
		String fname = Utility.saveFileSpring(dto.getFilenameMF(), upDir);
		int size = (int) dto.getFilenameMF().getSize();

		if (size > 0) {
			dto.setFilename(fname);
		} else {
			dto.setFilename("default.png");
			};
		
		
		if(service.create(dto)>0) {
			return "redirect:/tour/list";
		}else {
			return "error";
		}
		
	}
	
	@GetMapping("/tour/read")
	public String read(int tid, Model model, HttpServletRequest request) {
		service.upcnt(tid);
		
		TourDTO dto= service.read(tid);
		
		model.addAttribute("dto",dto);
		

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
		
		return "/tour/read";
	}
	
	
	
	@GetMapping("/tour/update")
	public String update(int tid, Model model) {
		
		System.out.println("1");
		model.addAttribute("dto",service.read(tid));
		
		return "/tour/update";
	}
	
	@PostMapping("/tour/update")
	public String update(TourDTO dto,HttpSession session) {
		
		String writer= dto.getWriter();
		String sID=(String)session.getAttribute("ID");
		int tid=dto.getTid();
		
		int cnt=0;
		
		if(writer.compareTo(sID)==0) {
			cnt = service.update(dto);
		}
		
		if(cnt==1) {
			return "redirect:/tour/list";
		}else {
			return "error";
		}
	}
	
	@GetMapping("/tour/delete")
	public String delete(int tid, Model model) {
		
		System.out.println("1");
		model.addAttribute("dto",service.read(tid));
		System.out.println("2");
		return "/tour/delete";
	}
	
	@PostMapping("/tour/delete")
	public String delete(TourDTO dto, HttpServletRequest request, HttpSession session) {
		System.out.println("3");
		
		int tid=dto.getTid();
		String writer= dto.getWriter();
		String sID=(String)session.getAttribute("ID");
		
		System.out.println("4");
		int cnt=0;
		
		if(writer.compareTo(sID)==0) {
			cnt = service.delete(tid);
		}else {
			return "error";
		}
		
		if(cnt==1) {
			return "redirect:/tour/list";
		}else {
			return "error";
		}
		
	}
	
	@RequestMapping("/tour/list")
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
		int recordPerPage = 9;// 한페이지당 보여줄 레코드갯수

		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		int total = service.total(map);

		List<TourDTO> list = service.list(map);

		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);

		return "/tour/list";

	}
	
	
}
