package com.dongne.utility;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import lombok.Data;

@Data
public class GpsToAddress {
	private double latitude;
	private double longitude;
	private String regionAddress;
	
	public GpsToAddress() {
		
	}

	public GpsToAddress(double latitude, double longitude) throws Exception {
		this.latitude = latitude;
		this.longitude = longitude;
		this.regionAddress = getRegionAddress(getJSONData(getApiAddress()));
	}

	public String getApiAddress() {
		String apiURL = "http://maps.googleapis.com/maps/api/geocode/json?latlng=" + latitude + "," + longitude
				+ "&language=ko&key="+"AIzaSyBQ92wtSZ7Na247IMKGavoIVkPLiZfPKPM";
		return apiURL;
	}

	public String getJSONData(String apiURL) throws Exception {
		String jsonString = new String();
		String buf;
		URL url = new URL(apiURL);
		URLConnection conn = url.openConnection();
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		while ((buf = br.readLine()) != null) {
			jsonString += buf;
		}
		return jsonString;
	}

	public String getRegionAddress(String jsonString) {
		JSONObject jObj = (JSONObject) JSONValue.parse(jsonString);
		JSONArray jArray = (JSONArray) jObj.get("results");
		jObj = (JSONObject) jArray.get(0);
		return (String) jObj.get("formatted_address");
	}

	public String getAddress() {
		return regionAddress;
	}
}
//public class Geocoding {
//	public static void main(String[] args) throws Exception {
//		double latitude = 37.566535;
//		double longitude = 126.977969;
//
//		GpsToAddress gps = new GpsToAddress(latitude, longitude);
//		System.out.println(gps.getAddress());
//	}
//}