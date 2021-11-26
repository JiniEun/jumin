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
	public String home(Model model, HttpSession session, HttpServletRequest request)
			throws Exception {

		System.out.println("--HOME GETMAPPING-- ");
		String realLocation = (String) session.getAttribute("realLocation");
		System.out.println((String) session.getAttribute("ID"));

		if (realLocation == null) {
			realLocation = NaverGeoApi
					.getAddress(NaverGeoApi.getlocation(37.541, 126.986));

		}

		if ((String) session.getAttribute("ID") == null) {
			System.out.println("Util : " + Utility.getRegionCode(realLocation));
			System.out.println("RS : " + regionService.read(Utility.getRegionCode(realLocation)).getRegionID());
			session.setAttribute("region", regionService.read(Utility.getRegionCode(realLocation)).getRegionID());
		}

//			else {
//			UserDTO dto = userService.read((String) session.getAttribute("ID"));
//			session.setAttribute("region", regionService.read(Utility.getRegionCode(dto.getAddress1())).getRegionID());
//			System.out.println("else : " + regionService.read(Utility.getRegionCode(dto.getAddress1())).getRegionID());
//		}

		// 코로나 정보 불러오기
		List<String> covid = Crawler.covidCrawling(realLocation);

//		System.out.println((String) session.getAttribute("realLocation"));

		model.addAttribute("realLocation", realLocation);
		model.addAttribute("region", session.getAttribute("region"));
		model.addAttribute("covid", covid);

		// 최근 공지사항 목록 3개
		Map map = new HashMap();
		map.put("sno", 0);
		map.put("eno", 3);

		List<NoticeDTO> list = noticeService.list(map);

		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);

		System.out.println("realLocation : " + realLocation);
		System.out.println("region : " + session.getAttribute("region"));

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

		List<String> covid = Crawler.covidCrawling(realLocation);

		model.addAttribute("covid", covid);

		session.setAttribute("realLocation", realLocation);
		model.addAttribute("realLocation", realLocation);

		return "/home";
	}
}
