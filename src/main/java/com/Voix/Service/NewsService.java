package com.Voix.Service;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Voix.Dao.NewsDao;
import com.Voix.Dto.News;

@Service
public class NewsService {
	@Autowired
	private NewsDao ndao;
	
	@Autowired
	private TicketService tsvc;
	
	public ArrayList<HashMap<String, String>> getNewsList_map() {
		
		return ndao.selectNews_map();
	}

	public News getNwInfo(String nwcode) {
		System.out.println("SERVICE - 티켓정보 출력");
		return ndao.getNwInfo(nwcode);
	}
	
	public int newsRegistReview(String restate, String recontent, String rewriter) {
		System.out.println("service - registReview()");
		String maxRvCode = ndao.selectMaxReCode();
		String recode = tsvc.genCode(maxRvCode);
		int registReview = ndao.newsRegistReview(recode, restate, recontent, rewriter);
		System.out.println(registReview);
		return registReview;
	}

	public ArrayList<HashMap<String, String>> selectReviewList(String nwcode) {
		System.out.println("selectReivewList  호출");
		ArrayList<HashMap<String, String>> Resultre = ndao.selectReviewList(nwcode);
		return Resultre;
	}

	public int deleteNewsReview(String recode) {
		System.out.println("SERVEICE - deleteReview 호출");
		return ndao.deleteNewsReview(recode);
	}
	
	public int likeNews(String like,String mid) {
		System.out.println("SERVICE- 뉴스 찜");
		return ndao.likeNews(like,mid);
	}
	public ArrayList<HashMap<String, String>> selectTitle(String searchKeyword) {
		ArrayList<HashMap<String, String>> searchList = new ArrayList<HashMap<String, String>>();
		ArrayList<HashMap<String, String>> titleList = new ArrayList<HashMap<String, String>>();
		ArrayList<HashMap<String, String>> contentList = new ArrayList<HashMap<String, String>>();
			try {
				titleList = ndao.selectSearch_Title(searchKeyword);				
			} catch (Exception e) {
			}
			System.out.println(titleList);
			try {
				contentList = ndao.selectSearch_Content(searchKeyword);				
			} catch (Exception e) {
			}
			searchList.addAll(titleList);
			searchList.addAll(contentList);
		return searchList;
	}
	public ArrayList<HashMap<String, String>> selectNewsHitList() {
		System.out.println("조회수 목록 조회");
		return ndao.selectNewsHitList();
	}
}
