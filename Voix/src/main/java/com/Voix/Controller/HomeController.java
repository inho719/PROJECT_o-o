package com.Voix.Controller;

import java.io.IOException;
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

import com.Voix.Service.CrawlingService;

import net.bytebuddy.agent.builder.AgentBuilder.InitializationStrategy.SelfInjection.Split;

@Controller

public class HomeController {
	@Autowired
	private CrawlingService csvc;
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
	@RequestMapping(value = "/Text", method = RequestMethod.GET)
	public String text() {
		System.out.println("메인페이지 이동");
		return "Text";
	}
	@RequestMapping(value="/YtbSearch")
	public ModelAndView YtbSearch() throws IOException  {
		System.out.println("CONTROLLER -/YtbSearch");
		ModelAndView mav = new ModelAndView();
		
		ArrayList<HashMap<String, String> > searchTextArr = csvc.SongSearch();
		String searchText = null;
		
	     for (HashMap<String, String> text : searchTextArr) { // sgtitle : 제목
	                String sgtTitle = text.get("SGTITLE"); //text.replace("SGTITLE=", "");
	                System.out.println("SGTITLE: " + sgtTitle);
	        }
		System.out.println("searchText: "+searchTextArr);	
		
		ArrayList<HashMap<String, String> > CrawlingYtb
		=csvc.CrawlingYtb(searchText);
		System.out.println(CrawlingYtb);
//		mav.addObject("prdList_gmarket",prdList_gmarket);

//		mav.setViewName("PrdSearchResult"); //PrdSearchResult.jsp 생성
		return mav;
	}
}
