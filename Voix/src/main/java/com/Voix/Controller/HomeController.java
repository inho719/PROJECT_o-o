package com.Voix.Controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Voix.Service.AlbumService;
import com.Voix.Service.ChartService;
import com.Voix.Service.NewsService;
import com.Voix.Service.TicketService;

@Controller
public class HomeController {

	@Autowired
	private AlbumService asvc;
	
	@Autowired
	private ChartService csvc;
	
	@Autowired
	private NewsService nsvc;
	
	@Autowired
	private TicketService tsvc;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpSession session) {
		System.out.println("메인페이지 이동");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		session.setAttribute("sideState", "M");
		return "MainPage";
	}

	@RequestMapping("/getSearch")
	public ModelAndView search(String searchKeyword, String pageType) {
		ModelAndView mav= new ModelAndView();
		
		switch(pageType) {
		case "AlbumPage":
			ArrayList<HashMap<String, String>> AlbumList = asvc.selectTitle(searchKeyword);
			mav.addObject("AlbumListMap",AlbumList);
			mav.setViewName("Basic/"+pageType);
			break;
		case "ChartPage":
			ArrayList<HashMap<String, String>> ChartList = csvc.selectTitle(searchKeyword);
			mav.addObject("ChartListMap",ChartList);
			mav.setViewName("Basic/"+pageType);
			break;
		case "NewsPage":
			ArrayList<HashMap<String, String>> NewsList = nsvc.selectTitle(searchKeyword);
			mav.addObject("NewsListMap",NewsList);
			mav.setViewName("Basic/"+pageType);
			break;
		case "TicketPage":
			ArrayList<HashMap<String, String>> TicketList = tsvc.selectTitle(searchKeyword);
			mav.addObject("TkListMap",TicketList);
			mav.setViewName("Basic/"+pageType);
			break;
		}
		
		
		return mav;
	}
	
}
