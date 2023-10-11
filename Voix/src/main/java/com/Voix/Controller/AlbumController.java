package com.Voix.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AlbumController {

	
	@RequestMapping(value ="/AlbumPage")
	public ModelAndView AlbumPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Basic/AlbumPage");
		session.setAttribute("sideState", "N");
		session.setAttribute("rankState", "AB");
		return mav;
	}
}
