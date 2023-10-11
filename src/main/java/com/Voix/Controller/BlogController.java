package com.Voix.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BlogController {

	@RequestMapping(value = "/BlogPage")
	public ModelAndView Blog(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Basic/BlogPage");
		return mav;
		
	}
}
