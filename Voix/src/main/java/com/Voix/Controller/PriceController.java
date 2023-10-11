package com.Voix.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class PriceController {

	
	@RequestMapping(value = "/PricePage")
	public ModelAndView PricePage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Basic/PricePage");
		
		return mav;
	}
	
}
