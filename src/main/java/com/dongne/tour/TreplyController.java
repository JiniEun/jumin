package com.dongne.tour;



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
public class TreplyController {
	
	@Autowired
	@Qualifier("com.dongne.tour.TreplyServiceImpl")
	private TreplyService service;
	
	@RequestMapping("/list")
	@ResponseBody
	public Map list(@RequestParam int tid, @RequestParam(value = "page", defaultValue = "1", required = false) int page,
							TreplyDTO dto){
		
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
	      System.out.println("Page :" + page);
	      System.out.println("startPage :" + startpage);
	      System.out.println("endPage : "+ endpage);
	      
	      
	      
	      Map map = new HashMap();
	      map.put("list", service.list(tid));
	      map.put("page",  page);
	      map.put("startpage",  startpage);
	      map.put("endpage",  endpage);
	      
		return map;
	}
	
	@RequestMapping("/create")
	@ResponseBody
	public int create(@RequestParam int tid,@RequestParam String content, Map map){
		
		
		map.put("tid", tid);
		map.put("content", content);
		
		
		return service.create(map);
		
	}
	
	@RequestMapping("/delete/{trid}")
	@ResponseBody
	public void delete(@PathVariable int trid){
		
		service.delete(trid);
		
	}
	
	@RequestMapping("/update/{trid}")
	@ResponseBody
	public void update(TreplyDTO dto,@PathVariable int trid,@RequestParam("tid") int tid, 
						@RequestParam("content") String content){
		dto.setContent(content);
		
		dto.setTid(tid);
		
		dto.setTrid(trid);
		
		
		service.update(dto);
		
	}
	
	 
	
	
}
