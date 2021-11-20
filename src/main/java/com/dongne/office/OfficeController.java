package com.dongne.office;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongne.utility.Utility;

@Controller
public class OfficeController {
	@Autowired
	@Qualifier("com.dongne.office.OfficeServiceImpl")
	private OfficeService service;
	
	@GetMapping("/admin/office/create")
	public String create(HttpSession session, Model model) {
		
		String writer=(String)session.getAttribute("ID");

		model.addAttribute("writer", writer);
		
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
		
	
	
	@GetMapping("/admin/office/update")
	public String update(int oid, Model model) {
		System.out.println("oid:" + oid);
		model.addAttribute("dto",service.read(oid));
		
		return "/office/update";
	}
	
	@PostMapping("/office/update")
	public String update(OfficeDTO dto,int oid) {
		
		String upDir = Office.getUploadDir();
		// 기존파일 지우고,
		String oldfile=dto.getFilename();
		Utility.deleteFile(upDir, oldfile);
		
		String fname = Utility.saveFileSpring(dto.getFilenameMF(), upDir);
		int size = (int) dto.getFilenameMF().getSize();
		if (size > 0) {
			dto.setFilename(fname);
		} else {
			dto.setFilename("default.png");
			};
			

			
		int cnt=0;
		
		cnt = service.update(dto);
		
		if(cnt==1) {
			return "redirect:/office/list";
		}else {
			System.out.println("실패");
			return "error";
		}
	}
	
	@GetMapping("/admin/office/delete")
	public String delete(int oid, Model model) {
		
		model.addAttribute("dto",service.read(oid));
		
		return "/office/delete";
	}
	
	@PostMapping("/office/delete")
	public String delete(int oid, HttpServletRequest request, HttpSession session) {
		
		OfficeDTO dto=service.read(oid);
		
		String upDir = Office.getUploadDir();
		System.out.println("경로 : " + upDir);
		// 기존파일 지우고,
		String oldfile=dto.getFilename();
		System.out.println("파일명 : " + oldfile);
		Utility.deleteFile(upDir, oldfile);
		
		int cnt=0;
		
		cnt = service.delete(oid);
		
		if(cnt==1) {
			return "redirect:/office/list";
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
	
	@GetMapping("/office/read")
	public String read(int oid,Model model) {
		System.out.println(oid);
		
		OfficeDTO dto= service.read(oid);
		
		model.addAttribute("dto",dto);
		
		return "/office/read";
	}
	
	@ResponseBody
	@RequestMapping(value = "/office/read", method = RequestMethod.POST)
	public String read(HttpServletRequest request) {
		String oid=request.getParameter("oid");
		System.out.println(oid);

		return "/office/read";
	}
	
}
