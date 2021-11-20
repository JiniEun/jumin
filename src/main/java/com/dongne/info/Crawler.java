package com.dongne.info;

import java.io.IOException;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawler {
	public static String crawling(String url) {
		try {
			// 1. 수집 대상 URL
			String URL = "http://ncov.mohw.go.kr/bdBoardList_Real.do?brdId=1&brdGubun=13&ncvContSeq=&contSeq=&board_id=&gubun=";

			// 2. Connection 생성
			Connection conn = Jsoup.connect(URL);

			// 3. HTML 파싱.
			Document html = conn.get(); // conn.post();

			System.out.println("[Attribute 탐색]");
			Elements fileblocks = html.getElementsByClass("rpsa_map");
			for (Element fileblock : fileblocks) {

				Elements files = fileblock.getElementsByTag("span");
				for (Element elm : files) {
					String text = elm.text();
//                String href = elm.attr("href");

					System.out.println(text + " > ");
				}
			}

			// 4. HTML 출력
//			System.out.println(html.toString());
			return html.toString();
		} catch (IOException e) {
			e.printStackTrace();
			return e.toString();
		}

	}
}
