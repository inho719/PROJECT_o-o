package com.Voix.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;

import com.Voix.Dao.TicketDao;
import com.Voix.Dto.Ticket;

@Service
public class TicketService {
	@Autowired
	private TicketDao tdao;

	public ArrayList<HashMap<String, String>> getTicketList_map() {

		return tdao.selectTicket_map();
	}

	public Ticket getTkInfo(String tkcode) {
		System.out.println("SERVICE - 티켓정보 출력");
		return tdao.getTkInfo(tkcode);
	}

	public String getMapXY(String tkplace) throws IOException {
		System.out.println("SERVICE - getMapXY 호출");

		StringBuilder urlBuilder = new StringBuilder("https://dapi.kakao.com/v2/local/search/keyword.json"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("query", "UTF-8") + "=" + "고려대학교 화정체육관"); /* 가맹점 코드 */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Authorization", "KakaoAK de39587ee41403602625b2b26329f02c");
		HttpHeaders headers = new HttpHeaders();
		headers.add(HttpHeaders.CONTENT_TYPE, "application/json;charset=UTF-8");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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

//    JsonObject sttnJson = JsonParser.parseString(sb.toString()).getAsJsonObject();
//    JsonElement sttnList = sttnJson.get("response").getAsJsonObject().get("body").getAsJsonObject().get("items").getAsJsonObject().get("item");
//    Gson gson = new Gson();
//    String result = gson.toJson(sttnList);

		return "";
	}

}
