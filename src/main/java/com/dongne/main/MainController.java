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
import org.springframework.web.bind.annotation.RequestMapping;
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

		System.out.println("HOME GETMAPPING");
		String realLocation = (String) session.getAttribute("realLocation");

		if (realLocation == null) {

			if ((String) session.getAttribute("ID") == null) {
				realLocation = "서울";
				session.setAttribute("region", 1);
			} else {
				UserDTO dto = userService.read((String) session.getAttribute("ID"));
				session.setAttribute("region",
						regionService.read(Utility.getRegionCode(dto.getAddress1())).getRegionID());
			}
		}

		List<String> html = Crawler.covidCrawling(realLocation);

//		System.out.println((String) session.getAttribute("realLocation"));
		
		model.addAttribute("realLocation", (String) session.getAttribute("realLocation"));
		model.addAttribute("region", session.getAttribute("region"));
		model.addAttribute("html", html);

		Map map = new HashMap();
		map.put("sno", 0);
		map.put("eno", 3);

		List<NoticeDTO> list = noticeService.list(map);

		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);

		return "/home";
	}

	@PostMapping("/")
	@ResponseBody
	public String home(String latitude, String longitude, Model model, HttpSession session) throws Exception {

		System.out.println("HOME POSTMAPPING");

		LocationDTO loc = new LocationDTO(Double.parseDouble(latitude), Double.parseDouble(longitude));

		if (loc != null)
			System.out.println("loc" + loc.toString());

		String realLocation = NaverGeoApi.getAddress(NaverGeoApi.getlocation(loc.getLatitude(), loc.getLongitude()));
		System.out.println(realLocation);

		session.setAttribute("realLocation", realLocation);
	
		model.addAttribute("realLocation", realLocation);
		model.addAttribute("location", realLocation);

		return "/home";
	}

//	@RequestMapping("/")
//	public String home(String latitude, String longitude, Model model, HttpSession session) throws Exception {
//
//		System.out.println("HOME REQUESTMAPPING");
//
//		if (latitude == null && longitude == null) {
//			latitude = "37.566535";
//			longitude = "126.977969";
//		}
//		
//		LocationDTO loc = new LocationDTO(Double.parseDouble(latitude), Double.parseDouble(longitude));
//		System.out.println(loc.toString());
//		
//		String location = NaverGeoApi.getAddress(NaverGeoApi.getlocation(loc.getLatitude(), loc.getLongitude()));
//		session.setAttribute("location", location);
//
//		List<String> html = Crawler.covidCrawling("www.naver.com", location);
//
//		model.addAttribute("html", html);
//		model.addAttribute("location", location);
//
//		return "/home";
//	}

}
