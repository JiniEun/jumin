package com.dongne.office;

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

import com.dongne.tour.Tour;
import com.dongne.tour.TourDTO;
import com.dongne.utility.Utility;

@Controller
public class OfficeController {
	@Autowired
	@Qualifier("com.dongne.office.OfficeServiceImpl")
	private OfficeService service;
	
	@GetMapping("/office/create")
	public String create() {
				
		return "/office/create";
	}
	
	@PostMapping("/office/create")
	public String create(OfficeDTO dto) {
		
		String upDir = Office.getUploadDir();
		
		String fname = Utility.saveFileSpring(dto.getFilenameMF(), upDir);
		int size = (int) dto.getFilenameMF().getSize();

		if (size > 0) {
			dto.setFilename(fname);
		} else {
			dto.setFilename("default.png");
			};
		
		if(service.create(dto)>0) {
			return "redirect:/office/list";
		}else {
			return "error";
		}
		
	}
		
	
	
	@GetMapping("/office/update")
	public String update(int oid, Model model) {
		
		model.addAttribute("dto",service.read(oid));
		
		return "/office/update";
	}
	
	@PostMapping("/office/update")
	public String update(OfficeDTO dto, HttpSession session) {
		
		String writer=dto.getId();
		String sID=(String)session.getAttribute("id");
		int cnt=0;
		
		if(writer==sID) {
			cnt = service.update(dto);
		}else {
			return "error";
		}
		
		if(cnt==1) {
			return "redirect:/tour/list";
		}else {
			return "error";
		}
	}
	
	@GetMapping("/office/delete")
	public String delete() {
		return "redirect:./office/delete";
	}
	
	@PostMapping("/office/delete")
	public String delete(HttpServletRequest request, int oid, String writer, HttpSession session) {
		
		
		String sID=(String)session.getAttribute("id");
		int cnt=0;
		
		if(writer==sID) {
			cnt = service.delete(oid);
		}else {
			return "error";
		}
		
		if(cnt==1) {
			return "redirect:/tour/list";
		}else {
			return "error";
		}
		
	}
	
	@RequestMapping("/office/list")
	public String list(HttpServletRequest request) {
		

		List<OfficeDTO> list = service.list();

		request.setAttribute("list", list);


		return "/office/list";

	}
}
