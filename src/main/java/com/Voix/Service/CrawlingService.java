package com.Voix.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.Voix.Dao.SongDao;

@Controller
public class CrawlingService {

	@Autowired
	SongDao sdao;

	// 지마켓
	public ArrayList<HashMap<String, String>> CrawlingYtb(String searchText) throws IOException {
		System.out.println("SERVICE- CrawlingYtb");
		String searchQuery = searchText; // 검색할 음악 제목
		String searchUrl = "https://www.youtube.com/results?search_query=" + searchQuery;
		try {

			Document doc = Jsoup.connect(searchUrl).get();

			// 검색 결과에서 비디오 제목과 링크를 추출
			Elements videoLinks = doc.select("a.yt-uix-tile-link");
			for (Element link : videoLinks) {
				String title = link.attr("title");
				String videoId = link.attr("href").replace("/watch?v=", "");

				System.out.println("Video Title: " + title);
				System.out.println("Video ID: " + videoId);
				System.out.println("--------");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<HashMap<String, String>> SongSearch() {
		System.out.println("노래검색정보 받아오기 호출");
		ArrayList<HashMap<String, String>> selectResult = sdao.selectSongTitle();

		return selectResult;
	}
}
