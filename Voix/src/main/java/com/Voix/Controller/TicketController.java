package com.Voix.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Voix.Dto.Ticket;
import com.Voix.Service.TicketService;

@Controller
public class TicketController {

	@Autowired
	private TicketService tsvc;
	
	@RequestMapping(value ="/TicketPage")
	public ModelAndView TicketPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		ArrayList<HashMap<String, String>> TkList_map = tsvc.getTicketList_map();
		session.setAttribute("sideState", "N");
		session.setAttribute("rankState", "TK");
		System.out.println(TkList_map);
		mav.addObject("TkListMap",TkList_map);
		mav.setViewName("Basic/TicketPage");
		return mav;
		
		
	}
	@RequestMapping(value ="/TicketInfoPage")
	public ModelAndView TicketInfoPage(String tkcode) {
		ModelAndView mav = new ModelAndView();
		Ticket tk = tsvc.getTkInfo(tkcode);
		mav.addObject("tk", tk);
		mav.setViewName("BasicInfo/TicketInfoPage");
		return mav;
	}
	@RequestMapping(value="/getMapXY")
	public @ResponseBody String getMapXY(String tkplace) throws IOException {
		System.out.println("지도 좌표불러오기");
		return tsvc.getMapXY(tkplace);
	}
		@RequestMapping(value="/getTkTitle")
	public @ResponseBody ArrayList<Ticket> getTkTitle(String tkplace) {
		System.out.println("장소를 이용하여 공연제목들 불러오기");
		return tsvc.getTkTitle(tkplace);
	}
	
	
}
