package com.Voix.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Voix.Dao.AlbumDao;
import com.Voix.Dto.Album;
import com.Voix.Dto.Order;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class AlbumService {
	@Autowired
	private AlbumDao adao;

	public ArrayList<HashMap<String, String>> getAlbumtList_map() {

		return adao.selectAlbum_map();
	}

	public ArrayList<Album> getAlbumInfoList(String altitle) {

		return adao.selectAlbumInfo_map(altitle);
	}

	public Album getAlbumInfo_alcode(String alcode) {
		System.out.println("SERVICE getAlbumInfo_alcode");
		return adao.getAlbumInfo_alcode(alcode);
	}

	public int insertOdInfo(Order odInfo) {
		System.out.println("SERVICE insertOdinfo");
		int insertOd = adao.insertOdInfo(odInfo);
		return insertOd;
	}

	public String genCode(String currentCode) {
		System.out.println("genCode() 호출 : " + currentCode);
		// currentCode = TH00000 :: 앞2자리 영문, 뒤 5자리 숫자
		String strCode = currentCode.substring(0, 1); // "TH"
		int numCode = Integer.parseInt(currentCode.substring(1)); // 0
		String newCode = strCode + String.format("%04d", numCode + 1);
		// TH + 00001
		return newCode;
	}

	public String kakaoPay_ready(Order odInfo, HttpSession session) {
		System.out.println("service kakaoPay_ready()");
		System.out.println(odInfo);
		String requestUrl = "https://kapi.kakao.com/v1/payment/ready";
		HashMap<String, String> requestParams = new HashMap<String, String>();
		requestParams.put("partner_order_id", odInfo.getOdcode());
		requestParams.put("partner_user_id", odInfo.getOdmid());
		requestParams.put("item_name", "앨범결제");
		requestParams.put("quantity", odInfo.getOdqty());
		requestParams.put("total_amount", odInfo.getOdprice());
		requestParams.put("tax_free_amount", "0");
		requestParams.put("approval_url", "http://localhost:8080/kakaoPay_approval");
		requestParams.put("cancel_url", "http://localhost:8080/kakaoPay_cancel");
		requestParams.put("fail_url", "http://localhost:8080/kakaoPay_fail");

		String result = null;
		try {
			String response = kakaoResponse_json(requestUrl, requestParams);
			/* tid, next_redirect_pc_url */
			JsonObject re = (JsonObject)JsonParser.parseString(response);
			String tid = re.get("tid").getAsString();
			String nextUrl = re.get("next_redirect_pc_url").getAsString();
			System.out.println("tid : " + tid);
			session.setAttribute("tid", tid);
			session.setAttribute("odcode", odInfo.getOdcode());
			System.out.println("nextUrl : " + nextUrl);
			result = nextUrl;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result; // 결제 QR 페이지 URL
	}

	private String kakaoResponse_json(String requestUrl, HashMap<String, String> requestParams) throws IOException {
		System.out.println("SERVICE kakaoResponse_json() 호출");
		StringBuilder urlBuilder = new StringBuilder(requestUrl); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("cid", "UTF-8") + "=TC0ONETIME"); /* 가맹점 코드 */
		for (String key : requestParams.keySet()) {
			urlBuilder.append("&" + URLEncoder.encode(key, "UTF-8") + "=" + URLEncoder.encode(requestParams.get(key), "UTF-8")); /* 요청 파라메터 */
		}

		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "KakaoAK 2a9875678cefa0641477312f89b71e56");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		System.out.println("Response code: " + conn.getResponseCode());

		if (conn.getResponseCode() != 200) {
			return null;
		}

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

		return sb.toString();
	}

	public String kakaoPay_approval(String tid, String pg_token, String odcode, String loginId) {
		System.out.println("service kakaoPay_approval()");
		String requestUrl = "https://kapi.kakao.com/v1/payment/approve";
		HashMap<String, String> requestParams = new HashMap<String, String>();
		requestParams.put("tid", tid);
		requestParams.put("partner_order_id", odcode);  /* recode */
		requestParams.put("partner_user_id", loginId);    /* loginId */
		requestParams.put("pg_token", pg_token);
		
		String result = null;
		try {
			String response = kakaoResponse_json(requestUrl, requestParams);
			result = response;
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(result == null) {
			
		}
		
		return result;
	}

	public int cancelReserve(String odcode) {
		return adao.deleteReserve(odcode);
		
	}

	public String odcodeseting(String odcode) {
		String MaxOdcode = adao.getmaxOdcode(odcode);
		String addodcode = genCode(MaxOdcode);
		return addodcode;
	}
}
