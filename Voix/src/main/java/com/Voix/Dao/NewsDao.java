package com.Voix.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.Voix.Dto.News;

public interface NewsDao {

	ArrayList<HashMap<String, String>> selectNews_map();

	ArrayList<News> selectNewsInfo_map(String nwcode);

}
