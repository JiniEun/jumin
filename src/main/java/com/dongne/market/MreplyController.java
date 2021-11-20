package com.dongne.market;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/reply")
public class MreplyController {
	
	@Autowired
	@Qualifier("com.dongne.market.MreplyServiceImpl")
	private MreplyService service;
	
	@RequestMapping("/reply/list")
	@ResponseBody
	public Map list(@RequestParam int mid, @RequestParam(value = "page", defaultValue = "1", required = false) int page,
							MreplyDTO dto){
		
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
	      
	      
	      System.out.println("Page :" + page);
	      System.out.println("startPage :" + startpage);
	      System.out.println("endPage : "+ endpage);
	      
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
	    map.put("page",  page);
	    map.put("startpage",  startpage);
	    map.put("endpage",  endpage);
	      
		return map;
	}
	
	@RequestMapping("/reply/create")
	@ResponseBody
	public int create(@RequestParam int mid,@RequestParam String content, Map map){
		
		
		map.put("mid", mid);
		map.put("content", content);
		
		
		return service.create(map);
		
	}
	
	@RequestMapping("/reply/delete/{mrid}")
	@ResponseBody
	public void delete(@PathVariable int mrid){
		
		service.delete(mrid);
		
	}
	
	@RequestMapping("/reply/update/{mrid}")
	@ResponseBody
	public void update(MreplyDTO dto,@PathVariable int mrid,@RequestParam("mid") int mid, 
						@RequestParam("content") String content){
		dto.setContent(content);
		
		dto.setMid(mid);
		
		dto.setMrid(mrid);
		
		
		service.update(dto);
		
	}
	
	 
	
	
}
