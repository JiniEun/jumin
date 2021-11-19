package com.dongne.market;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.dongne.community.CommunityDTO;
import com.dongne.tour.Tour;
import com.dongne.tour.TourDTO;
import com.dongne.utility.Utility;

@Controller
public class MarketController {
	
	@Autowired
	@Qualifier("com.dongne.market.MarketServiceImpl")
	private MarketService service;
	
	
	
	@RequestMapping("/market/list")
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
	    int recordPerPage = 8;// 한페이지당 보여줄 레코드갯수
	 
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
	    
	    
	 
	    List<MarketDTO> list = service.list(map);
	 
	    String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
	 
	    // request에 Model사용 결과 담는다
	    request.setAttribute("list", list);
	    request.setAttribute("nowPage", nowPage);
	    request.setAttribute("col", col);
	    request.setAttribute("word", word);
	    request.setAttribute("paging", paging);
	    
	    
	    return "/market/list";
	 
	  }
	
	

	@GetMapping("/market/read")
	public String read(int mid, Model model) {
		service.upCnt(mid);
		
		
		model.addAttribute("dto",service.read(mid));
		

       
		return "/market/read";
	}
		
	  @GetMapping("/market/create")
	  public String create() {
	 
	    return "/market/create";
	  }
	 
	  @PostMapping("/market/create")
		public String create(MarketDTO dto, HttpServletRequest request) {
		  	String upDir = Market.getUploadDir();

			String fname = Utility.saveFileSpring(dto.getFilenameMF(), upDir);
			
			int size = (int) dto.getFilenameMF().getSize();

			if (size > 0) {
				dto.setFilename(fname);
			} else {
				dto.setFilename("default.jpg");
			}

			if (service.create(dto) > 0) {
				return "redirect:/market/list";
			} else {
				return "error";
			}
		}
	

	  @GetMapping("/market/update")
		public String update(int mid, Model model) {
			
			MarketDTO dto = service.read(mid);
			
			model.addAttribute("dto",dto);
			
			return "/market/update";
		}
		
		@PostMapping("/market/update")
		public String update( MultipartFile filenameMF, String oldfile, int mid, HttpServletRequest request, MarketDTO dto) {
			int pcnt = service.update(dto);
			
			String basePath = Market.getUploadDir();
			
			
			if (oldfile != null && !oldfile.equals("default.jpg")) { // 원본파일 삭제
				Utility.deleteFile(basePath, oldfile);
			}

			// pstorage에 변경 파일 저장
			Map map = new HashMap();
			map.put("mid", mid);
			map.put("fname", Utility.saveFileSpring(dto.getFilenameMF(), basePath));

			// 디비에 파일명 변경
			
			
			int cnt = service.updateFile(map);
			
			if (cnt == 1 && pcnt == 1) {
				return "redirect:/market/list";
			} else {
				return "./error";
			}
			
			
			
			
		     

			
		}
	
}
