package com.dongne.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongne.main.Crawler;
import com.dongne.utility.LocationDTO;
import com.dongne.utility.NaverGeoApi;

@Controller
public class MainController {

	@GetMapping("/")
	public String home(Model model) throws Exception {

		System.out.println("HOME GETMAPPING");

		double latitude = 37.566535; // 37.207649;
		double longitude = 126.977969; // 127.117139; latitude,longitude

		System.out.println(NaverGeoApi.getlocation(latitude, longitude));
		System.out.println(NaverGeoApi.getAddress(NaverGeoApi.getlocation(latitude, longitude)));

		String html = Crawler.crawling("www.naver.com");
		model.addAttribute("html", html);

		return "/home";
	}

	@PostMapping("/")
	@ResponseBody
	public String home(String latitude, String longitude) throws Exception {

		System.out.println("HOME POSTMAPPING");

		LocationDTO loc = new LocationDTO(Double.parseDouble(latitude), Double.parseDouble(longitude));

		if (loc != null)
			System.out.println("loc" + loc.toString());

		System.out.println(NaverGeoApi.getAddress(NaverGeoApi.getlocation(loc.getLatitude(), loc.getLongitude())));

		return "/home";
	}
}
