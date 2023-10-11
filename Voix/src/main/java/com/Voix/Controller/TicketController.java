package com.Voix.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Voix.Service.TicketService;

@Controller
public class TicketController {

	@Autowired
	private TicketService tsvc;
	
	@RequestMapping(value ="/TicketPage")
	public ModelAndView TicketPage() {
		ModelAndView mav = new ModelAndView();
		ArrayList<HashMap<String, String>> TkList_map = tsvc.getTicketList_map();
		System.out.println(TkList_map);
		mav.addObject("TkListMap",TkList_map);
		mav.setViewName("Basic/TicketPage");
		return mav;
		
		
	}
	@RequestMapping(value ="/TicketInfoPage")
	public ModelAndView TicketInfoPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("BasicInfo/TicketInfoPage");
		return mav;
		
		
	}
	
}
