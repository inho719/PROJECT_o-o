package com.Voix.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TicketController {

	
	@RequestMapping(value ="/TicketPage")
	public ModelAndView TicketPage(HttpSession session) {
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Basic/TicketPage");
		session.setAttribute("sideState", "N");
		session.setAttribute("rankState", "TK");
		return mav;
		
		
	}
	
	
	
}
