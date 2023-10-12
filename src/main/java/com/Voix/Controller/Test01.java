package com.Voix.Controller;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test01 {

	public static void main(String[] args) {
		System.out.println("SERVICE- CrawlingYtb");
		String searchQuery = "밤편지"; // 검색할 음악 제목
		String searchUrl = "https://www.youtube.com/results?search_query=" + searchQuery;
		try {

			Document doc = Jsoup.connect(searchUrl).get();
			//System.out.println(doc);
			Elements aTag = doc.select("#thumbnail");
			System.out.println(aTag);
			// #video-title
			// 검색 결과에서 비디오 제목과 링크를 추출
			/*
			Elements videoLinks = doc.select("a.yt-uix-tile-link");
			for (Element link : videoLinks) {
				String title = link.attr("title");
				String videoId = link.attr("href").replace("/watch?v=", "");

				System.out.println("Video Title: " + title);
				System.out.println("Video ID: " + videoId);
				System.out.println("--------");
			}
			*/
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
