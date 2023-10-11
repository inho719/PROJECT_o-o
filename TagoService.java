package com.springmemberBoard.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class TagoService {
	private final String appkey = "=x4GPTH5PXkTZU0kYDLMrlWhnW89aejnspNBSENuG5QMRgdHD7XYBEkuzeGgrRc7ov6cSMoP8nmzt2SQcEb5C9Q%3D%3D";
	public String tagosttnList(String lati, String longi) throws IOException {
	  StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/BusSttnInfoInqireService/getCrdntPrxmtSttnList"); /*URL*/
    urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + appkey); /*Service Key*/
    urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
    urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*데이터 타입(xml, json)*/
    urlBuilder.append("&" + URLEncoder.encode("gpsLati","UTF-8") + "=" + URLEncoder.encode(lati, "UTF-8")); /*WGS84 위도 좌표*/
    urlBuilder.append("&" + URLEncoder.encode("gpsLong","UTF-8") + "=" + URLEncoder.encode(longi, "UTF-8")); /*WGS84 경도 좌표*/
    URL url = new URL(urlBuilder.toString());
    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    conn.setRequestMethod("GET");
    conn.setRequestProperty("Content-type", "application/json");
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
    System.out.println(sb.toString());
    
    JsonObject sttnJson = JsonParser.parseString(sb.toString()).getAsJsonObject();
    JsonElement sttnList = sttnJson.get("response").getAsJsonObject().get("body").getAsJsonObject().get("items").getAsJsonObject().get("item");
    Gson gson = new Gson();
    String result = gson.toJson(sttnList);
		return result; // new Gson().toJson(sttnList); 과 동일
	}
	public String tagoBusArrList(String citycode, String nodeid) throws IOException {
		 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/ArvlInfoInqireService/getSttnAcctoArvlPrearngeInfoList"); /*URL*/
     urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + appkey); /*Service Key*/
     urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
     urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
     urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*데이터 타입(xml, json)*/
     urlBuilder.append("&" + URLEncoder.encode("cityCode","UTF-8") + "=" + URLEncoder.encode(citycode, "UTF-8")); /*도시코드 [상세기능3 도시코드 목록 조회]에서 조회 가능*/
     urlBuilder.append("&" + URLEncoder.encode("nodeId","UTF-8") + "=" + URLEncoder.encode(nodeid, "UTF-8")); /*정류소ID [국토교통부(TAGO)_버스정류소정보]에서 조회가능*/
     URL url = new URL(urlBuilder.toString());
     HttpURLConnection conn = (HttpURLConnection) url.openConnection();
     conn.setRequestMethod("GET");
     conn.setRequestProperty("Content-type", "application/json");
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
     System.out.println(sb.toString());
     JsonObject sttnJson = JsonParser.parseString(sb.toString()).getAsJsonObject();
     JsonElement sttnList = sttnJson.get("response").getAsJsonObject().get("body").getAsJsonObject().get("items").getAsJsonObject().get("item");
     Gson gson = new Gson();
     String result = gson.toJson(sttnList);
 		return result; // new Gson().toJson(sttnList); 과 동일
	}
	public String getBusRouteList(String ccode, String routeid) throws IOException {
	  StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/BusRouteInfoInqireService/getRouteAcctoThrghSttnList"); /*URL*/
    urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + appkey); /*Service Key*/
    urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("200", "UTF-8")); /*한 페이지 결과 수*/
    urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*데이터 타입(xml, json)*/
    urlBuilder.append("&" + URLEncoder.encode("cityCode","UTF-8") + "=" + URLEncoder.encode(ccode, "UTF-8")); /*도시코드 [상세기능4. 도시코드 목록 조회]에서 조회 가능*/
    urlBuilder.append("&" + URLEncoder.encode("routeId","UTF-8") + "=" + URLEncoder.encode(routeid, "UTF-8")); /*노선ID [상세기능1. 노선번호목록 조회]에서 조회 가능*/
    URL url = new URL(urlBuilder.toString());
    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    conn.setRequestMethod("GET");
    conn.setRequestProperty("Content-type", "application/json");
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
    System.out.println(sb.toString());
    JsonObject routeJson = JsonParser.parseString(sb.toString()).getAsJsonObject();
    JsonElement roList = routeJson.get("response").getAsJsonObject().get("body").getAsJsonObject().get("items").getAsJsonObject().get("item");
    Gson gson = new Gson();
    String result = gson.toJson(roList);
		return result; // new Gson().toJson(sttnList); 과 동일
	}
	public String getBusLocList(String ccode, String routeid) throws IOException {
		 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/BusLcInfoInqireService/getRouteAcctoBusLcList"); /*URL*/
     urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + appkey); /*Service Key*/
     urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
     urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
     urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*데이터 타입(xml, json)*/
     urlBuilder.append("&" + URLEncoder.encode("cityCode","UTF-8") + "=" + URLEncoder.encode(ccode, "UTF-8")); /*도시코드 [상세기능3 도시코드 목록 조회]에서 조회 가능*/
     urlBuilder.append("&" + URLEncoder.encode("routeId","UTF-8") + "=" + URLEncoder.encode(routeid, "UTF-8")); /*노선ID [국토교통부(TAGO)_버스노선정보]에서 조회가능*/
     URL url = new URL(urlBuilder.toString());
     HttpURLConnection conn = (HttpURLConnection) url.openConnection();
     conn.setRequestMethod("GET");
     conn.setRequestProperty("Content-type", "application/json");
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
     System.out.println(sb.toString());
     JsonObject LocJson = JsonParser.parseString(sb.toString()).getAsJsonObject();
     JsonElement LocList = LocJson.get("response").getAsJsonObject().get("body").getAsJsonObject().get("items").getAsJsonObject().get("item");
     Gson gson = new Gson();
     String result = gson.toJson(LocList);
 		return result; // new Gson().toJson(sttnList); 과 동일
	}

}
