package com.Voix.Service;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Voix.Dao.NewsDao;

@Service
public class NewsService {
	@Autowired
	private NewsDao ndao;

	public ArrayList<HashMap<String, String>> getNewsList_map() {
		
		return ndao.selectNews_map();
	}

	public int likeNews(String like,String mid) {
		System.out.println("SERVICE- 뉴스 찜");
		return ndao.likeNews(like,mid);
	}

}
