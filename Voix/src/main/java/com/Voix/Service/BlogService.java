package com.Voix.Service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Voix.Dao.BlogDao;

@Service
public class BlogService {

	@Autowired
	private BlogDao bdao;
	
	
	public HashMap<String, String> selectMainBlog(String themaStr) {
		return bdao.selectMainBlog();
	}

}
