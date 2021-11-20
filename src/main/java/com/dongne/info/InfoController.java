package com.dongne.info;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dongne.info.Crawler;

@Controller
public class InfoController {

	@GetMapping("/info/covid_19")
	public String home(Model model) throws Exception {
		
		try {
			String html = Crawler.crawling("www.naver.com");
			model.addAttribute("html",html);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/info/covid_19";
	}
}
