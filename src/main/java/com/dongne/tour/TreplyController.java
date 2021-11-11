package com.dongne.tour;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dongne.utility.Utility;

public class TreplyController {
	@RestController
	public static class ReplyController {
	  private static final Logger log = LoggerFactory.getLogger(ReplyController.class);
	 
	  @Autowired
	  private TreplyMapper mapper;
	 
	  @GetMapping("/tour/treply/list/{tid}/{sno}/{eno}")
	  public ResponseEntity<List<TreplyDTO>> getList(@PathVariable("tid") int tid, 
	      @PathVariable("sno") int sno,
	      @PathVariable("eno") int eno) {
	 
	    Map map = new HashMap();
	    map.put("sno", sno);
	    map.put("eno", eno);
	    map.put("tid", tid);
	 
	    return new ResponseEntity<List<TreplyDTO>>(mapper.list(map), HttpStatus.OK);
	  }
	 
	  @GetMapping("/tour/reply/page")
	  public ResponseEntity<String> getPage(@RequestParam("nPage") int nPage, 
	      @RequestParam("nowPage") int nowPage,
	      @RequestParam("tid") int tid, 
	      @RequestParam("col") String col, 
	      @RequestParam("word") String word) {
	 
	    int total = mapper.total(tid);
	    String url = "read";
	 
	    int recordPerPage = 5; // 한페이지당 출력할 레코드 갯수
	 
	    String paging = Utility.rpaging(total, nowPage, recordPerPage, col, word, url, nPage, tid);
	 
	    return new ResponseEntity<>(paging, HttpStatus.OK);
	 
	  }
	}
	 
}
