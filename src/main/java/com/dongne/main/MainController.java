package com.dongne.main;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongne.utility.LocationDTO;
import com.dongne.utility.NaverGeoApi;

@Controller
public class MainController {

	@GetMapping("/")
	public String home(Model model, HttpSession session) throws Exception {

		System.out.println("HOME GETMAPPING");

		List<String> html = Crawler.crawling("www.naver.com", (String) session.getAttribute("location"));
		
		System.out.println((String) session.getAttribute("location"));
		model.addAttribute("location", (String) session.getAttribute("location"));

		model.addAttribute("html", html);

		return "/home";
	}

	@PostMapping("/")
	@ResponseBody
	public String home(String latitude, String longitude, Model model, HttpSession session) throws Exception {

		System.out.println("HOME POSTMAPPING");

		LocationDTO loc = new LocationDTO(Double.parseDouble(latitude), Double.parseDouble(longitude));

		if (loc != null)
			System.out.println("loc" + loc.toString());

		String location = NaverGeoApi.getAddress(NaverGeoApi.getlocation(loc.getLatitude(), loc.getLongitude()));
		System.out.println(location);

		session.setAttribute("location", location);
		model.addAttribute("location", location);

		return "/home";
	}

}
