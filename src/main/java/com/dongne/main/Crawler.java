package com.dongne.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawler {
	public static List<String> covidCrawling(String loc) throws IOException {

		// 1. 수집 대상 URL
		String URL = "http://ncov.mohw.go.kr/bdBoardList_Real.do?brdId=1&brdGubun=13&ncvContSeq=&contSeq=&board_id=&gubun=";

		// 2. Connection 생성
		Connection conn = Jsoup.connect(URL);

		// 3. HTML 파싱.
		Document html = conn.get(); // conn.post();

//		System.out.println("[Attribute 탐색]");

		String result = "";
		Elements fileblocks = html.getElementsByClass("rpsa_map");
		for (Element fileblock : fileblocks) {

			Elements files = fileblock.getElementsByTag("span");
			for (Element elm : files) {
				String text = elm.text();
//                String href = elm.attr("href");

//				System.out.println(text + " > ");
				result += text + "\n";
			}
		}

		// 4. HTML 출력
//			System.out.println(html.toString());

		return stringToList(result, loc); // result;//html.toString();

	}

	public static List<String> stringToList(String s, String loc) {

		String[] resultArray = s.split("\n");

		List<String> tempList = new ArrayList<>();
		for (int i = 0; i < resultArray.length; i++) {
			tempList.add(resultArray[i]);
		}

		List<String> resultList = getInfoOfAddress(tempList, loc);

		return resultList;
	}

	public static List<String> getInfoOfAddress(List<String> list, String loc) {
		String[] city = { "서울", "부산", "대구", "인천", "광주", "대전", "울산", "세종", "경기", "강원", "충북", "충남", "전북", "전남", "경북",
				"경남", "제주" };

		int idx = 0;
		for (int i = 0; i < city.length; i++) {
			if (loc.contains(city[i])) {
				idx = list.indexOf(city[i]);
				break;
			} else {
				idx = -1;
			}
		}

		if (idx == -1) {
			return list.subList(0, 1);
		} else {
			list = list.subList(idx, idx + 3);
//			System.out.println(list.size());
//			System.out.println(list);
			return list;
		}

	}
}
