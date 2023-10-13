package com.Voix.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Voix.Service.NewsService;

@Controller
public class NewsController {

	@Autowired
	private NewsService nsvc;
	
	@RequestMapping(value = "/NewsPage")
	public ModelAndView News(HttpSession session){
		ModelAndView mav = new ModelAndView();
		session.setAttribute("sideState", "N");
		session.setAttribute("rankState", "NW");
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
	@RequestMapping(value="/likeNews")
	public @ResponseBody int likeNews(String like, HttpSession session) {
		System.out.println("뉴스 찜 기능");
		String mid = session.getAttribute("loginId").toString();
		System.out.println("뉴스- 아이디 확인:"+mid);
		System.out.println("뉴스-   찜 확인:"+like);
		
	return nsvc.likeNews(like,mid);
	}
}	
	
