package com.spring.helper.method.method;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

import org.json.JSONObject;
import org.json.XML;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class GetJsonData {

	private String enKey = "aqFFW%2BjkswtDEjWJIAHjx2ZzFzSYEt7ZUFbIHAU%2FCqKFF5dnRDJZe0997nu2JwgGu98B2zapQryJ1WOmzMQveQ%3D%3D";
	
	//레이더 정보 얻기
	public JSONObject getRadarInfo() throws IOException, ParseException, URISyntaxException {
		String date = "20190214";
		String url = "http://newsky2.kma.go.kr/FileService/RadarVideoInfoService/RadarCompositionImage?data=CMB&time="+date+"&serviceKey="+enKey;
		RestTemplate restTemplate = new RestTemplate();
		URI uri = new URI(url);
		System.out.println("요청주소"+uri);
		String response = restTemplate.getForObject(uri, String.class);
		org.json.JSONObject JSONObj = XML.toJSONObject(response);
		return JSONObj;
	}
}