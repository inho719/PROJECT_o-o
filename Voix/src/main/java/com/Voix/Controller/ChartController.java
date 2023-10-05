package com.Voix.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChartController {

	@RequestMapping(value = "/ChartPage")
	public ModelAndView ChartPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Basic/ChartPage");
		
		return mav;
	}
	
}
