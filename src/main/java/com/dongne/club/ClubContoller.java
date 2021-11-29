package com.dongne.club;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dongne.region.RegionService;
import com.dongne.user.UserDTO;
import com.dongne.user.UserService;
import com.dongne.utility.Utility;

@Controller
public class ClubContoller {

	@Autowired
	@Qualifier("com.dongne.club.ClubServiceImpl")
	private ClubService service;
	@Autowired
	@Qualifier("com.dongne.user.UserServiceImpl")
	private UserService uservice;
	@Autowired
	@Qualifier("com.dongne.region.RegionServiceImpl")
	private RegionService rservice;

	@GetMapping("/club/read/{clID}")
	public String read(@PathVariable("clID") int clID, Model model, HttpServletRequest request) {
		service.upViewcnt(clID);

		model.addAttribute("dto", service.read(clID));

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

		return "/club/read";
	}

	@RequestMapping("/club/list")
	public String list(HttpServletRequest request, HttpSession session) {
		String realLocation = (String) session.getAttribute("realLocation");
		String regionID = "";
		
		if ((String) session.getAttribute("ID") == null) {
			session.setAttribute("region", rservice.read(Utility.getRegionCode(realLocation)).getRegionID());
			int sv = (Integer) session.getAttribute("region");
			
			String myRegionID=Utility.checkNull(Integer.toString(sv));
			
			 regionID = Utility.checkNull(request.getParameter("regionID"));

				if (regionID == "") {
					regionID = myRegionID;
				}
		} else {
		int sv=(Integer)session.getAttribute("region");
		String myRegionID=Utility.checkNull(Integer.toString(sv));

		    regionID = Utility.checkNull(request.getParameter("regionID"));

		if (regionID == "") {
			regionID = myRegionID;
		}

		}
		
		// 검색관련------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		System.out.println("col:" +col);
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
		map.put("regionID", regionID);
		
		int total = service.total(map);

		List<ClubDTO> list = service.list(map);
		
		String paging4 = Utility.paging4(total, nowPage, recordPerPage, col, word, regionID);

		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging4", paging4);
		request.setAttribute("regionID", regionID);
		
	
		return "/club/list";
	}

	@PostMapping("/club/updateFile")
	public String updateFile(MultipartFile fileNameMF, String oldfile, int clID, HttpServletRequest request)
			throws IOException {
		// String basePath = new
		// ClassPathResource("/static/pstorage").getFile().getAbsolutePath();
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
	public String updateFileForm(@PathVariable("clID") int clID, @PathVariable("oldfile") String oldfile, Model model) {
		model.addAttribute("clID", clID);
		model.addAttribute("oldfile", oldfile);

		return "/club/updateFile";
	}

	@PostMapping("/club/update")
	public String update(ClubDTO dto, Model model, HttpSession session) {
		String ID = dto.getID();
		String sID = (String) session.getAttribute("ID");

		int cnt = 0;

		if (ID.compareTo(sID) == 0) {
			cnt = service.update(dto);
		}

		if (cnt == 1) {
			return "redirect:/club/list";
		} else {
			return "error";
		}
	}

	@GetMapping("/club/update")
	public String update(int clID, Model model) {

		model.addAttribute("dto", service.read(clID));

		return "/club/update";
	}

	@GetMapping("/club/create")
	public String create(HttpSession session, Model model) {

		String ID = (String) session.getAttribute("ID");
		
		UserDTO user = uservice.read(ID);
		String nickname = user.getNickname();
		int regionID = user.getRegionID();

		model.addAttribute("ID", ID);
		model.addAttribute("nickname", nickname);
		model.addAttribute("regionID", regionID);
		
		System.out.println(ID);

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
	public String delete(int clID, Model model) {
		model.addAttribute("dto", service.read(clID));
		return "/club/delete";
	}

	@PostMapping("/club/delete")
	public String delete(ClubDTO dto, HttpServletRequest request, HttpSession session) {

		int clID = dto.getClID();
		String ID = dto.getID();
		String sID = (String) session.getAttribute("ID");

		int cnt = 0;

		if (ID.compareTo(sID) == 0) {
			cnt = service.delete(clID);
		} else {
			return "error";
		}

		if (cnt == 1) {
			return "redirect:/club/list";
		} else {
			return "error";
		}

	}

}