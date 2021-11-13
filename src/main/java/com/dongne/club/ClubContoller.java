package com.dongne.club;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dongne.utility.Utility;

@Controller
public class ClubContoller {
	
	@Autowired
	@Qualifier("com.dongne.club.ClubServiceImpl")
	private ClubService service;
	
	@GetMapping("/club/read/{clID}")
	public String read(@PathVariable("clID") int clID, Model model) {
	    
	   model.addAttribute("dto",service.read(clID));
	  
	    return "/club/read";
	}
	
	@GetMapping("/club/list")
	  public String list(HttpServletRequest request, Model model) {
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

	    int total = service.total(map);
	 
	    List<ClubDTO> list = service.list(map);
	 
	    String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
	 
	    // request에 Model사용 결과 담는다
	    request.setAttribute("list", list);
	    request.setAttribute("nowPage", nowPage);
	    request.setAttribute("col", col);
	    request.setAttribute("word", word);
	    request.setAttribute("paging", paging);

	    return "/club/list";
	  }
	@PostMapping("/club/updateFile")
	public String updateFile(MultipartFile fileNameMF, String oldfile, int clID, HttpServletRequest request)
			throws IOException {
		//String basePath = new ClassPathResource("/static/pstorage").getFile().getAbsolutePath();
		String basePath = Club.getUploadDir();

		if (oldfile != null) { // 원본파일 삭제
			Utility.deleteFile(basePath, oldfile);
		}

		// pstorage에 변경 파일 저장
		Map map = new HashMap();
		map.put("clID", clID);
		map.put("fileName", Utility.saveFileSpring(fileNameMF, basePath));

		// 디비에 파일명 변경
		int cnt = service.updateFile(map);

		if (cnt == 1) {
			return "redirect:./list";
		} else {
			return "./error";
		}
	}

	@GetMapping("/club/updateFile/{clID}/{oldfile}")
	public String updateFileForm(@PathVariable("clID") int clID, @PathVariable("oldfile") String oldfile,
			Model model) {
		model.addAttribute("clID", clID);
		model.addAttribute("oldfile", oldfile);

		return "/club/updateFile";
	}
	
	@PostMapping("/club/update")
	public String update(ClubDTO dto) {
		int cnt = service.update(dto);

		if (cnt == 1) {
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@GetMapping("/club/update/{clID}")
	public String update(@PathVariable("clID") int clID, Model model) {

		ClubDTO dto = service.read(clID);

		model.addAttribute("dto", dto);

		return "/club/update";

	}
	
	 @GetMapping("/club/create")
	  public String create() {
	 
	    return "/club/create";
	  }
	 
	  @PostMapping("/club/create")
	  public String create(ClubDTO dto, HttpServletRequest request) throws IOException {
	    String upDir = Club.getUploadDir();
	    
	    String fileName = Utility.saveFileSpring(dto.getFileNameMF(), upDir);
		int size = (int) dto.getFileNameMF().getSize();

		if (size > 0) {
			dto.setFileName(fileName);
		} else {
			dto.setFileName("default.jpg");
		}

		if (service.create(dto) > 0) {
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	  
	  @GetMapping("/club/delete")
	  public String delete() {
	 
	 
	    return "/club/delete";
	  }
	  
	  @PostMapping("/club/delete")
	  public String delete(HttpServletRequest request, int clID, String password, String oldfile, RedirectAttributes redirect) throws IOException {
		  String upDir = Club.getUploadDir();
		  Map map = new HashMap();
		  map.put("clID", clID);
		  map.put("password", password);
		  int cnt = service.passwd(map);
		  
		  String url = "./passwdError";
		  
		  if(cnt>0) {
			  try {
				  service.delete(clID);
				  redirect.addAttribute("col", request.getParameter("col"));
				  redirect.addAttribute("word", request.getParameter("word"));
				  redirect.addAttribute("nowPage", request.getParameter("nowPage"));
				  url = "redirect:./list";
				  if(oldfile != null)
					  Utility.deleteFile(upDir, oldfile);
			  } catch (Exception e) {
				  e.printStackTrace();
				  url = "/error";
			  }
		  }
		  return url;
	  }
}
