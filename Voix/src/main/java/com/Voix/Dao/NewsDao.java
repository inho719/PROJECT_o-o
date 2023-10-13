package com.Voix.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface NewsDao {

	ArrayList<HashMap<String, String>> selectNews_map();

	int likeNews(@Param("like")String like,@Param("mid")String mid);


	

	
	

}
