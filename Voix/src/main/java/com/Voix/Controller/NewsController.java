package com.Voix.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NewsController {

	@RequestMapping(value = "/NewsPage")
	public ModelAndView News(HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Basic/NewsPage");
		session.setAttribute("sideState", "N");
		session.setAttribute("rankState", "NW");
		return mav;
		
	}
}
