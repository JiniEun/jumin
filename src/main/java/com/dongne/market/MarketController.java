package com.dongne.market;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dongne.region.RegionService;
import com.dongne.user.UserDTO;
import com.dongne.user.UserService;
import com.dongne.utility.Utility;

@Controller
public class MarketController {

	@Autowired
	@Qualifier("com.dongne.market.MarketServiceImpl")
	private MarketService service;

	@Autowired
	@Qualifier("com.dongne.user.UserServiceImpl")
	private UserService uservice;

	@Autowired
	@Qualifier("com.dongne.region.RegionServiceImpl")
	private RegionService rservice;

	@RequestMapping("/market/list")
	public String list(HttpSession session, HttpServletRequest request, String category) {
		System.out.println("cate : " + category);
		String realLocation = (String) session.getAttribute("realLocation");
		String regionID = "";

		if ((String) session.getAttribute("ID") == null) {
			session.setAttribute("region", rservice.read(Utility.getRegionCode(realLocation)).getRegionID());
			int sv = (Integer) session.getAttribute("region");

			String myRegionID = Utility.checkNull(Integer.toString(sv));

			regionID = Utility.checkNull(request.getParameter("regionID"));

			if (regionID == "") {
				regionID = myRegionID;
			}
		} else {
			int sv = (Integer) session.getAttribute("region");
			String myRegionID = Utility.checkNull(Integer.toString(sv));

			regionID = Utility.checkNull(request.getParameter("regionID"));

			if (regionID == "") {
				regionID = myRegionID;
			}

		}

		// 검색관련------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (category != null) {
			if (category.equals("total")) {
				word = "";
			} else {
				col = "category";
				word = category;
			}

		}

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
		map.put("regionID", regionID);

		int total = service.totalRegion(map);

		List<MarketDTO> list = service.list(map);

		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		request.setAttribute("regionID", regionID);

		return "/market/list";

	}

	@GetMapping("/market/read")
	public String read(int mid, Model model, HttpServletRequest request) {
		service.upCnt(mid);

		model.addAttribute("dto", service.read(mid));

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

		return "/market/read";
	}

	@GetMapping("/market/create")
	public String create(HttpSession session, Model model) {

		String ID = (String) session.getAttribute("ID");
		model.addAttribute("ID", ID);

		UserDTO user = uservice.read(ID);
		String nickname = user.getNickname();
		model.addAttribute("nickname", nickname);

		int regionID = user.getRegionID();
		model.addAttribute("regionID", regionID);

		return "/market/create";
	}

	@PostMapping("/market/create")
	public String create(MarketDTO dto, HttpSession session, Model model) {
		String filename_ = (String) session.getAttribute("filename");
		String filename = Utility.checkNulltoDefault(filename_);

		String realLocation = (String) session.getAttribute("realLocation");

		int regionID = 0;
		if ((String) session.getAttribute("ID") == null) {
			regionID = rservice.read(Utility.getRegionCode(realLocation)).getRegionID();
		} else {
			regionID = uservice.read((String) session.getAttribute("ID")).getRegionID();
		}

		dto.setRegionID(regionID);
		dto.setFilename(filename);

		if (service.create(dto) > 0) {
			session.removeAttribute("filename");
			return "redirect:/market/list";
		} else {
			return "error";
		}

	}

	@GetMapping("/market/update")
	public String update(int mid, Model model, HttpSession session) {

		MarketDTO dto = service.read(mid);

		String writer = dto.getId();
		String sID = Utility.checkNull((String) session.getAttribute("ID"));

		model.addAttribute("dto", dto);

		if (writer.compareTo(sID) != 0) {
			return "/user/login";
		} else {
			return "/market/update";
		}
	}

	@PostMapping("/market/update")
	public String update(int mid, HttpSession session) {

		MarketDTO dto = service.read(mid);

		System.out.println(dto.toString());

		int cnt = 0;

		String upDir = Market.getUploadDir();

		// 기존파일 지우고,
		String oldfile = dto.getFilename();
		String[] filenameArr = oldfile.split(",");

		for (int i = 0; i < filenameArr.length; i++) {
			Utility.deleteFile(upDir, filenameArr[i]);
		}

		String filename_ = (String) session.getAttribute("filename");
		String filename = Utility.checkNulltoDefault(filename_);

		dto.setFilename(filename);
		dto.setRegionID(uservice.read((String) session.getAttribute("ID")).getRegionID());

		session.removeAttribute("filename");

		Map map = new HashMap();
		map.put("mid", dto.getMid());

		cnt = service.update(dto);

		System.out.println(dto.toString());

		if (cnt == 1) {
			return "redirect:/market/list";
		} else {
			return "error";
		}

	}

	@GetMapping("/market/delete")
	public String delete(int mid, Model model, HttpSession session) {

		MarketDTO dto = service.read(mid);
		String writer = dto.getId();
		String sID = Utility.checkNull((String) session.getAttribute("ID"));

		model.addAttribute("dto", dto);

		if (writer.compareTo(sID) != 0) {
			return "/user/login";
		} else
			return "/market/delete";
	}

	@PostMapping("/market/delete")
	public String delete(int mid, HttpServletRequest request, HttpSession session) {

		MarketDTO dto = service.read(mid);

		String upDir = Market.getUploadDir();

		// 기존파일 지우고,
		String oldfile = dto.getFilename();
		String[] filenameArr = oldfile.split(",");
		for (int i = 0; i < filenameArr.length; i++) {
			Utility.deleteFile(upDir, filenameArr[i]);
		}

		String writer = dto.getId();
		String sID = (String) session.getAttribute("ID");

		int cnt = 0;

		if (writer.compareTo(sID) == 0) {
			cnt = service.delete(mid);

		} else {
			return "error";
		}

		if (cnt == 1) {
			return "redirect:/market/list";
		} else {
			return "error";
		}

	}

	@GetMapping("/market/uploadfile")
	public String uploadfile() {

		return "/market/uploadfile";
	}

	@ResponseBody
	@RequestMapping(value = "/market/uploadfile", method = RequestMethod.POST)
	public String uploadfile(HttpSession session, @RequestParam("article_file") List<MultipartFile> multipartFile,
			HttpServletRequest request) {

		String upDir = Market.getUploadDir();

		List<String> fileArray = new ArrayList<String>();

		String strResult = "{ \"result\":\"FAIL\" }";
		String fileRoot;
		try {
			// 파일이 있을때 탄다.
			if (multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {

				for (MultipartFile file : multipartFile) {
					fileRoot = upDir;
					System.out.println(fileRoot);

					String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
					String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
					fileArray.add(savedFileName);
					File targetFile = new File(fileRoot + savedFileName);
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장

					} catch (Exception e) {
						// 파일삭제
						FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
				strResult = "{ \"result\":\"OK\" }";
			}
			// 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을 등록하는경우)
			else
				strResult = "{ \"result\":\"OK\" }";
		} catch (Exception e) {
			e.printStackTrace();
		}
		String filename = "";
		for (String i : fileArray) {
			filename += i + ",";
		}

		session.setAttribute("filename", filename);

		return strResult;
	}

//	@RequestMapping("/market/category")
//	public String reqAjax1(String category) {
//		System.out.println(category);
//		return "redirect:/market/list";
//	}

}