package com.dongne.tour;

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

import com.dongne.user.UserDTO;
import com.dongne.user.UserService;
import com.dongne.utility.Utility;

@Controller
public class TourController {
	@Autowired
	@Qualifier("com.dongne.tour.TourServiceImpl")
	private TourService service;

	@Autowired
	@Qualifier("com.dongne.user.UserServiceImpl")
	private UserService uservice;

	@GetMapping("/tour/create")
	public String create(HttpSession session, Model model) {
		if (session.getAttribute("ID") == null) {
			return "/tour/nologin";
		} else {
			String writer = (String) session.getAttribute("ID");

			UserDTO user = uservice.read(writer);
			String nickname = user.getNickname();

			model.addAttribute("writer", writer);
			model.addAttribute("nickname", nickname);
		}
		return "/tour/create";
	}

	@PostMapping("/tour/create")
	public String create(TourDTO dto, HttpSession session, Model model) {

		String filename_ = (String) session.getAttribute("filename");
		String filename = Utility.checkNulltoDefault(filename_);

		dto.setFilename(filename);

		if (service.create(dto) > 0) {
			session.removeAttribute("filename");
			return "redirect:/tour/list";
		} else {
			return "error";
		}

	}

	@GetMapping("/tour/read")
	public String read(int tid, Model model, HttpServletRequest request) {
		service.upcnt(tid);

		TourDTO dto = service.read(tid);

		model.addAttribute("dto", dto);

		/* ?????? ?????? ?????? */
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

		/* ?????? ?????? ??? */

		return "/tour/read";
	}

	@GetMapping("/tour/update")
	public String update(int tid, Model model, HttpSession session) {

		TourDTO dto = service.read(tid);
		String writer = dto.getWriter();
		String sID = Utility.checkNull((String) session.getAttribute("ID"));

		model.addAttribute("dto", dto);

		if (writer.compareTo(sID) != 0) {
			return "/tour/discordID";
		} else
			return "/tour/update";
	}

	@PostMapping("/tour/update")
	public String update(TourDTO dto, int tid, HttpSession session) {

		String upDir = Tour.getUploadDir();

		// ???????????? ?????????,
		String oldfile = Utility.checkNull(dto.getFilename());
		String[] filenameArr = oldfile.split(",");

		for (int i = 0; i < filenameArr.length; i++) {
			Utility.deleteFile(upDir, filenameArr[i]);
		}

		// ????????? ????????????
		String writer = dto.getWriter();
		String sID = (String) session.getAttribute("ID");

		int cnt = 0;

		if (writer.compareTo(sID) == 0) {
			// ????????? ?????? ?????????
			String filename_ = (String) session.getAttribute("filename");
			String filename = Utility.checkNulltoDefault(filename_);

			dto.setFilename(filename);

			cnt = service.update(dto);
			session.removeAttribute("filename");
		}

		if (cnt == 1) {
			return "redirect:/tour/list";
		} else {
			return "error";
		}
	}

	@GetMapping("/tour/delete")
	public String delete(int tid, Model model, HttpSession session) {

		TourDTO dto = service.read(tid);
		String writer = dto.getWriter();
		String sID = Utility.checkNull((String) session.getAttribute("ID"));

		model.addAttribute("dto", dto);

		if (writer.compareTo(sID) != 0) {
			return "/tour/discordID";
		} else
			return "/tour/delete";
	}

	@PostMapping("/tour/delete")
	public String delete(int tid, HttpServletRequest request, HttpSession session) {

		TourDTO dto = service.read(tid);

		String upDir = Tour.getUploadDir();

		// ???????????? ?????????,
		String oldfile = dto.getFilename();
		String[] filenameArr = oldfile.split(",");
		for (int i = 0; i < filenameArr.length; i++) {
			Utility.deleteFile(upDir, filenameArr[i]);
		}

		String writer = dto.getWriter();
		String sID = (String) session.getAttribute("ID");

		int cnt = 0;

		if (writer.compareTo(sID) == 0) {
			cnt = service.delete(tid);

		} else {
			return "error";
		}

		if (cnt == 1) {
			return "redirect:/tour/list";
		} else {
			return "error";
		}

	}

	@RequestMapping("/tour/list")
	public String list(HttpServletRequest request, HttpSession session) {

		
		int sv=Utility.checkNulltoint((Integer)session.getAttribute("region"));
		String mydistrictcode=Utility.checkNull(Integer.toString(sv));

		String districtcode = Utility.checkNull(request.getParameter("districtcode"));

		if (districtcode == "") {
			districtcode = mydistrictcode;
		}

		// ????????????------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}

		// ???????????????-----------------------
		int nowPage = 1;// ?????? ???????????? ?????????
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 9;// ??????????????? ????????? ???????????????

		// DB?????? ????????? ??????-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("districtcode", districtcode);
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		int total = service.total(map);

		List<TourDTO> list = service.list(map);

		String paging3 = Utility.paging3(total, nowPage, recordPerPage, col, word, districtcode);

		// request??? Model?????? ?????? ?????????
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("districtcode", districtcode);
		request.setAttribute("mydistrictcode", mydistrictcode);
		request.setAttribute("paging3", paging3);

		return "/tour/list";
	}

	@GetMapping("/tour/uploadfile")
	public String uploadfile() {

		return "/tour/uploadfile";
	}

	@ResponseBody
	@RequestMapping(value = "/tour/fileUpload", method = RequestMethod.POST)
	public String fileUpload(HttpSession session, @RequestParam("article_file") List<MultipartFile> multipartFile,
			HttpServletRequest request) {

		String upDir = Tour.getUploadDir();

		List<String> fileArray = new ArrayList<String>();

		String strResult = "{ \"result\":\"FAIL\" }";
		String fileRoot;
		try {
			// ????????? ????????? ??????.
			if (multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {

				for (MultipartFile file : multipartFile) {
					fileRoot = upDir;

					String originalFileName = file.getOriginalFilename(); // ???????????? ?????????
					String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // ?????? ?????????
					String savedFileName = UUID.randomUUID() + extension; // ????????? ?????? ???
					fileArray.add(savedFileName);
					File targetFile = new File(fileRoot + savedFileName);
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); // ?????? ??????

					} catch (Exception e) {
						// ????????????
						FileUtils.deleteQuietly(targetFile); // ????????? ?????? ?????? ??????
						e.printStackTrace();
						break;
					}
				}
				strResult = "{ \"result\":\"OK\" }";
			}
			// ?????? ???????????? ?????? ???????????? ??????.(???????????????, ????????? ?????? ?????? ??????????????????)
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

}