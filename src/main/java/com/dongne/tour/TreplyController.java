package com.dongne.tour;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongne.utility.Utility;

@Controller
@RequestMapping("/reply")
public class TreplyController {
	
	@Autowired
	@Qualifier("com.dongne.tour.TreplyServiceImpl")
	private TreplyService service;
	
	@RequestMapping("/list")
	@ResponseBody
	public List<TreplyDTO> list(Map map){
		
		
		return service.list();
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
	
}
