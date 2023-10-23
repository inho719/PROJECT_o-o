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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Voix.Service.AlbumService;
import com.Voix.Service.BlogService;
import com.Voix.Service.ChartService;
import com.Voix.Service.NewsService;
import com.Voix.Service.TicketService;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

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

	@Autowired
	private BlogService bsvc;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		System.out.println("메인페이지 이동");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		session.setAttribute("sideState", "M");
		return "MainPage";
	}
	//@RequestParam(value = "selThemas", defaultValue = "N") String selThemas,
	@RequestMapping(value = "/getSelContents")
	public @ResponseBody String getSelContents(String selThemas) {
		System.out.println(selThemas);
		ArrayList<HashMap<String, String>> contentList = new ArrayList<HashMap<String, String>>();
		
		//ArrayList<String> themas = new ArrayList<String>();
		
		JsonArray themasArr = JsonParser.parseString(selThemas).getAsJsonArray();
		for( JsonElement themaEl : themasArr ) {
			//themas.add(   themaEl.getAsJsonObject().get("thema").getAsString() );
			String themaStr = themaEl.getAsJsonObject().get("thema").getAsString();
			HashMap<String, String> content = null;
			switch(themaStr) {
			case "news":
				content = nsvc.selectMainNews(themaStr); //SELECT NEWSTITLE AS TITLE
				break;
			case "ticket":
				content = tsvc.selectMainTicket(themaStr); // SELECT TKTITLE AS TITLE
				break;
			case "album":
				content = asvc.selectMainAlbum(themaStr);
				break;
			case "chart":
				content = csvc.selectMainChart(themaStr);
				break;
			case "blog":
				content = bsvc.selectMainBlog(themaStr);
				break;
			case "price":

				break;
			}
			contentList.add(content);
		}
		System.out.println(contentList);
		return new Gson().toJson(contentList);
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
