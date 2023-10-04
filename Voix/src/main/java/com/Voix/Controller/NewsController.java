package com.Voix.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NewsController {

	@RequestMapping(value = "/NewsPage")
	public ModelAndView News(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Basic/NewsPage");
		return mav;
		
	}
}
