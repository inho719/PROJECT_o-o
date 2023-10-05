package com.Voix.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AlbumController {

	
	@RequestMapping(value ="/AlbumPage")
	public ModelAndView AlbumPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Basic/AlbumPage");
		return mav;
	}
}
