package com.dongne.main;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongne.notice.NoticeDTO;
import com.dongne.notice.NoticeService;
import com.dongne.region.RegionService;
import com.dongne.user.UserDTO;
import com.dongne.user.UserService;
import com.dongne.utility.LocationDTO;
import com.dongne.utility.NaverGeoApi;
import com.dongne.utility.Utility;

@Controller
public class MainController {

	@Autowired
	@Qualifier("com.dongne.notice.NoticeServiceImpl")
	private NoticeService noticeService;

	@Autowired
	@Qualifier("com.dongne.user.UserServiceImpl")
	private UserService userService;

	@Autowired
	@Qualifier("com.dongne.region.RegionServiceImpl")
	private RegionService regionService;

	@GetMapping("/")
	public String home(Model model, HttpSession session, HttpServletRequest request) throws Exception {

		System.out.println("--HOME GETMAPPING-- ");
		String realLocation = (String) session.getAttribute("realLocation");

		if (realLocation == null) {
			realLocation = NaverGeoApi.getAddress(NaverGeoApi.getlocation(37.541, 126.986));

		}

		if ((String) session.getAttribute("ID") == null) {
			System.out.println("session ID == null");
			session.setAttribute("region", regionService.read(Utility.getRegionCode(realLocation)).getRegionID());
		} else {
			UserDTO dto = userService.read((String) session.getAttribute("ID"));
			System.out.println("session ID : " + dto.getID());
//			System.out.println("BUG " + Utility.getRegionCode(dto.getAddress1()) + dto.getAddress1());
//			session.setAttribute("region", regionService.read(Utility.getRegionCode(dto.getAddress1())).getRegionID());
			System.out.println(
					"dto regionID : " + regionService.read(Utility.getRegionCode(dto.getAddress1())).getRegionID());
		}

		// 코로나 정보 불러오기
		List<String> covidResult = Crawler.covidCrawling(realLocation);

//		System.out.println((String) session.getAttribute("realLocation"));

		model.addAttribute("covid", covidResult);
		model.addAttribute("realLocation", realLocation);
		model.addAttribute("region", session.getAttribute("region"));

//		System.out.println("realLocation : " + realLocation);
//		System.out.println("region : " + session.getAttribute("region"));

		// 최근 공지사항 목록 3개
		Map map = new HashMap();
		map.put("sno", 0);
		map.put("eno", 3);

		List<NoticeDTO> noticelist = noticeService.list(map);

		// request에 Model사용 결과 담는다
		request.setAttribute("noticelist", noticelist);

		return "/home";
	}

	@PostMapping("/")
	@ResponseBody
	public String home(String latitude, String longitude, Model model, HttpSession session) throws Exception {

		System.out.println("--HOME POSTMAPPING--");

		LocationDTO loc = new LocationDTO(Double.parseDouble(latitude), Double.parseDouble(longitude));

		String realLocation = NaverGeoApi.getAddress(NaverGeoApi.getlocation(loc.getLatitude(), loc.getLongitude()));
		System.out.println("realLocation : " + realLocation);
		System.out.println("region : " + session.getAttribute("region"));

		// 코로나 정보 불러오기
		List<String> covidResult = Crawler.covidCrawling(realLocation);

		model.addAttribute("covid", covidResult);

		session.setAttribute("realLocation", realLocation);
		model.addAttribute("realLocation", realLocation);

		return "/home";
	}
}