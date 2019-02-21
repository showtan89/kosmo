package com.spring.helper.method.method;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.json.XML;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.spring.helper.dao.UtilDAO;
import com.spring.helper.vo.jsonVO.weather.EarthQuakeVO;

@Component
public class GetJsonData {

	@Autowired
	UtilDAO utilDAO;
	
	private String enKey = "aqFFW%2BjkswtDEjWJIAHjx2ZzFzSYEt7ZUFbIHAU%2FCqKFF5dnRDJZe0997nu2JwgGu98B2zapQryJ1WOmzMQveQ%3D%3D";
	
	// 실시간 도착정보 얻기
	public JSONObject getRealTimeStationInfo(String localStationID) throws IOException, ParseException, URISyntaxException {
		//Calendar calendar = Calendar.getInstance();
		//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		//String date = dateFormat.format(calendar.getTime());
		String url = "http://openapi.gbis.go.kr/ws/rest/busarrivalservice/station?serviceKey=GdoR86lqZXehbYz0fIJrJjrCLQq9UHQg9pk2RA8UgEhtJI8vJ45t8O%2B8p6N3QaDDUUkB1kUa1Ra%2BwQnLK%2FcHuQ%3D%3D&stationId=" + localStationID;
		RestTemplate restTemplate = new RestTemplate();
		URI uri = new URI(url);
		System.out.println("요청주소"+uri);
		String response = restTemplate.getForObject(uri, String.class);
		org.json.JSONObject JSONObj = XML.toJSONObject(response);
		System.out.println(response);
		System.out.println(JSONObj.toString());
		return JSONObj;
	}
	
	//레이더 정보 얻기
	public JSONObject getRadarInfo() throws IOException, ParseException, URISyntaxException {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String date = dateFormat.format(calendar.getTime());
		String url = "http://newsky2.kma.go.kr/FileService/RadarVideoInfoService/RadarCompositionImage?data=CMB&time="+date+"&serviceKey="+enKey;
		RestTemplate restTemplate = new RestTemplate();
		URI uri = new URI(url);
		System.out.println("요청주소"+uri);
		String response = restTemplate.getForObject(uri, String.class);
		org.json.JSONObject JSONObj = XML.toJSONObject(response);
		return JSONObj;
	}
	
	//예보 정보 얻기
	public JSONObject getForeInfo() throws IOException, ParseException, URISyntaxException {
		String url = "http://newsky2.kma.go.kr/service/VilageFrcstDspthDocInfoService/WidGeneralWeatherCondition?stnId=108&numOfRows=1&pageNo=1&serviceKey="+enKey;
		RestTemplate restTemplate = new RestTemplate();
		URI uri = new URI(url);
		System.out.println("요청주소"+uri);
		String response = restTemplate.getForObject(uri, String.class);
		org.json.JSONObject JSONObj = XML.toJSONObject(response);
		System.out.println(response);
		System.out.println(JSONObj.toString());
		return JSONObj;
	}
	
	//지진 정보 얻기
	public JSONObject getQuakeInfo() throws IOException, ParseException, URISyntaxException, java.text.ParseException {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String date = dateFormat.format(calendar.getTime());
		//String date = "20190219";
		String url = "http://newsky2.kma.go.kr/service/ErthqkInfoService/EarthquakeReport?numOfRows=1&pageNo=1&serviceKey="+enKey+"&fromTmFc="+date+"&toTmFc="+date;
		RestTemplate restTemplate = new RestTemplate();
		URI uri = new URI(url);
		//System.out.println("요청주소"+uri);
		String response = restTemplate.getForObject(uri, String.class);
		org.json.JSONObject JSONObj = XML.toJSONObject(response);
		int totalCount = JSONObj.getJSONObject("response").getJSONObject("body").getInt("totalCount");
		//지진 경보가 있으면
		if(totalCount != 0) {
			JSONObject item = JSONObj.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONObject("item");
			int eqNum = item.getInt("tmSeq"); //일련번호로 조회함
			int eqChecked = utilDAO.earthQuakeDupCheck(eqNum);
			//등록되어 있지 않은 경보면 등록하기
			if(eqChecked == 0) {
			    int fcTp = item.getInt("fcTp"); // number, --통보종류
			    String img = item.getString("img");
			    double lat = item.getDouble("lat"); //number, --위도
			    double lon = item.getDouble("lon"); //number, --경도
			    String loc = item.getString("loc"); // varchar2(200), --위치
			    String mt = String.valueOf(item.getDouble("mt")); // varchar2(20), -- 크기
			    String rem = item.getString("rem"); //varchar2(200), --분석내용
			    String tempTmEqk = String.valueOf(item.getBigDecimal("tmEqk")); // number, --발생시간
			    String tempTmFc = String.valueOf(item.getBigDecimal("tmFc")); // number, -- 발표시간
			    SimpleDateFormat originalFormat1 = new SimpleDateFormat("yyyyMMddHHmmss"); //20190218053310
			    Date date1 = originalFormat1.parse(tempTmEqk.toString());
			    SimpleDateFormat newFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			    String tmEqk = newFormat1.format(date1);
			    SimpleDateFormat originalFormat2 = new SimpleDateFormat("yyyyMMddHHmm");//201902180536
			    Date date2 = originalFormat2.parse(tempTmFc.toString());
			    SimpleDateFormat newFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			    String tmFc = newFormat2.format(date2);
			    int tmSeq = item.getInt("tmSeq"); // number --월별순번
				EarthQuakeVO eVO = new EarthQuakeVO(0,fcTp,img,lat,lon,loc,mt,rem,tmEqk,tmFc,tmSeq);
				int insertResult = utilDAO.insertEarthQuake(eVO);
				System.out.println(eVO.toString());
				if(insertResult != 0) { //제대로 등록 되면
					System.out.println("earthQuake 신규 경보 등록 : "+item.getInt("tmSeq"));
					List<Map<String,String>> list = utilDAO.getUserList(); // 전체 유저 정보 얻기
					System.out.println(list.toString());
					System.out.println("시작");
					utilDAO.earthQuakeAlarmSend(list); //쪽지보내기
					utilDAO.msgSequenceChange(list.size()); //쪽지 시퀀스 변경
					System.out.println("종료");
				}
			}else {
				System.out.println("earthQuake 신규 등록 취소 : "+item.getInt("tmSeq"));
			}
		}
		System.out.println("earthQuake 경보 : "+totalCount);
		/*JSONObj{"response":{"header":{"resultCode":"0000","resultMsg":"OK"},
		 * "body":{"pageNo":1,"totalCount":1,"
		 * items":{"item":{"tmFc":201902130548,"loc":"북한 평양 남동쪽 17km 지역","img":"http://www.weather.go.kr/repositary/image/eqk/img/eqk_img_3_20190213051613.png","stnId":108,"mt":2.7,"cnt":1,"lon":125.86,"dep":21,"inT":"최대진도 Ⅰ","tmEqk":20190213051613,"tmSeq":134,"fcTp":3,"rem":"자연지진으로 분석됨","lat":38.9}},"numOfRows":1}}}
*/
		return JSONObj;
	}
	
	//뉴스 정보 얻기
	public JSONObject getNewsJson(String code) throws Exception{
		String url = "http://www.kocis.go.kr/json/kocc.do?langCode=lang001&&searchType=&page=1&pageSize=20&ctrcode="+code;
		RestTemplate restTemplate = new RestTemplate();
		URI uri = new URI(url);
		System.out.println("요청주소"+uri);
		String response = restTemplate.getForObject(uri, String.class);
		org.json.JSONObject JSONObj = XML.toJSONObject(response);
		System.out.println(response);
		System.out.println(JSONObj.toString());
		return JSONObj;
	}
	
	//방법1
	/*System.setProperty("http.maxRedirects", "1");
	BufferedReader br = null;
    try{            
        String urlstr = "http://www.kocis.go.kr/json/kocc.do?langCode=lang001&&searchType=&page=1&pageSize=20&ctrcode=CTR0013";
        URL url = new URL(urlstr);
        HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
        urlconnection.setRequestMethod("GET");
        br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
        String result = "";
        String line;
        while((line = br.readLine()) != null) {
            result = result + line + "\n";
        }
        System.out.println(result);
    }catch(Exception e){
    	logger.info(e.getMessage());
    }*/
	//////////////////////////////////////////////////////////////////////////////////////////////
	
	//방법2
	/*String tempUrl = "http://www.kocis.go.kr/json/kocc.do?langCode=lang001&&searchType=&page=1&pageSize=20&ctrcode=CTR0013";
	
	URI jsonUrl = new URI(tempUrl);
    ObjectMapper mapper = new ObjectMapper();
    newsJson newsJson = mapper.readValue(jsonUrl, newsJson.class);
	
	System.setProperty("http.maxRedirects", "1");
	StringBuilder urlBuilder = new StringBuilder("http://www.kocis.go.kr/json/kocc.do?langCode=lang001&&searchType=&page=1&pageSize=20&ctrcode=CTR0013");
	URL url = new URL(urlBuilder.toString());
	HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	conn.setRequestMethod("GET");
	conn.setRequestProperty("Content-type", "application/json");
	conn.setDoOutput(true); 
	conn.setReadTimeout(6000); 
	conn.setConnectTimeout(5000); 
	res.setHeader("Access-Control-Allow-Origin", req.getHeader("Origin"));
    res.setHeader("Access-Control-Allow-Credentials", "true");
    res.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
    res.setHeader("Access-Control-Max-Age", "3600");
    res.setHeader("Access-Control-Allow-Headers", "Content-Type, Accept, X-Requested-With, remember-me");
	
	System.out.println("Response code: " + conn.getResponseCode());
	BufferedReader rd;
	if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	} else {
		rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	}
	StringBuilder sb = new StringBuilder();
	String line;
	while ((line = rd.readLine()) != null) {
		sb.append(line);
	}
	rd.close();
	conn.disconnect();
	System.out.println(sb.toString());*/
	
}