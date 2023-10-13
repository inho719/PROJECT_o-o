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

	public ArrayList<HashMap<String, String>> getNewsList_map() {
		
		return ndao.selectNews_map();
	}

	public ArrayList<News> getNewsInfoList(String nwcode) {
		
		return ndao.selectNewsInfo_map(nwcode);
	}
}