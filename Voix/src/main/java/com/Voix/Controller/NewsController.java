package com.Voix.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Voix.Service.NewsService;

@Controller
public class NewsController {

	@Autowired
	private NewsService nsvc;
	
	@RequestMapping(value = "/NewsPage")
	public ModelAndView News(){
		
		ModelAndView mav = new ModelAndView();
		ArrayList<HashMap<String, String>> NewsList_map = nsvc.getNewsList_map();
		System.out.println(NewsList_map);
		mav.addObject("NewsListMap",NewsList_map);
		mav.setViewName("Basic/NewsPage");
		return mav;
		
	}
	
	@RequestMapping(value ="/NewsInfoPage")
	public ModelAndView NewsInfoPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("BasicInfo/NewsInfoPage");
		return mav;
		
		
	}
}
