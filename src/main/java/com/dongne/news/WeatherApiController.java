package com.dongne.news;


import java.util.HashMap;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class WeatherApiController<JSONObject> {
	
	/*@GetMapping("/weather")
	public String restApiGetweather() {
		
		// api getUltraSrtFost초단기 예보조회
		String url ="http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0"
			+"?serviceKey=Cv3aSoYx5eQY%2BbsPD%2FJ17atkgGKuJhQB3so9THodQbT3un59gdVyTad3EXilt5Yq%2FzNChWtwfBWDMUE9grL%2B3g%3D%3D"
			+"&dataType=JSON" // 받아오는 데이터 타입
			+"&numOfRow=10"	// 페이지 rows
			+"&pageNo=1" // 페이지 번호
			+"&base_date=20211930" //발표 일
			+"&base_time=2130" //발표 시간
			+"&nx=62" // x 좌표
			+"&ny=126"; // y 좌표
		
		HashMap<String, Object>resultMap= getDataFromJson(url, "utf-8", "get", "");
		
		System.out.println("# RESULT : " + resultMap);
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("resultMap", resultMap);
		
		return jsonObj.toString();
	}*/

	private HashMap<String, Object> getDataFromJson(String url, String string, String string2, String string3) {
		// TODO Auto-generated method stub
		return null;
	}
}
