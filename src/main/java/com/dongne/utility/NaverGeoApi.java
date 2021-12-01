package com.dongne.utility;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.ParseException;

public class NaverGeoApi {

	public static String getReverseGeocode(double latitude, double longitude) {
		String clientId = "92xk29w19e"; // clientId
		String clientSecret = "NyHl9o6XK1cKL3yFTgerAfneUHA8o3hIbI2OXl0S"; // clientSecret

		try {
			String addr = URLEncoder.encode("주소입력", "UTF-8"); // 주소입력
			String apiURL = "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?coords=" + longitude + ","
					+ latitude + "&orders=addr,admcode&output=json";
			// json
			// String apiURL = "https://openapi.naver.com/v1/map/geocode.xml?query=" + addr;
			// // xml
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
			con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
//            System.out.println(response.toString());
			return response.toString();
		} catch (Exception e) {
//            System.out.println(e);
			return e.toString();
		}
	}

	public static String getAddress(String jsonString) throws ParseException {
		JSONObject jObj = (JSONObject) JSONValue.parse(jsonString);
		JSONArray jArray = (JSONArray) jObj.get("results");

		JSONObject jObj2 = (JSONObject) jArray.get(1);
		JSONObject jObjRegion = (JSONObject) jObj2.get("region");
		JSONObject jObject1 = (JSONObject) jObjRegion.get("area1");
		JSONObject jObject2 = (JSONObject) jObjRegion.get("area2");
		JSONObject jObject3 = (JSONObject) jObjRegion.get("area3");

		String address1 = (String) jObject1.get("name");
		String address2 = (String) jObject2.get("name");
		String address3 = (String) jObject3.get("name");

		String address = address1 + " " + address2 + " " + address3;

		return address; //
		// region area1,2,3 name이 주소명 도, 시, 동.
	}
}