package com.Voix.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Voix.Service.ChartService;

@Controller
public class ChartController {

	@Autowired
	private ChartService csvc;
	
	@RequestMapping(value = "/ChartPage")
	public ModelAndView ChartPage() {
		ModelAndView mav = new ModelAndView();
		ArrayList<HashMap<String, String>> ChartList_map = csvc.getChartList_map();
		System.out.println(ChartList_map);
		mav.addObject("ChartListMap",ChartList_map);
		mav.setViewName("Basic/ChartPage");
		
		return mav;
	}
	
	@RequestMapping(value ="/ChartInfoPage")
	public ModelAndView ChartInfoPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("BasicInfo/ChartInfoPage");
		return mav;
		
		
	}
	
}
