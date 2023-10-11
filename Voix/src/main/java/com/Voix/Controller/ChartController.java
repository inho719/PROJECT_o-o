package com.Voix.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Voix.Dto.playL;

@Controller
public class ChartController {

	@RequestMapping(value = "/ChartPage")
	public ModelAndView ChartPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Basic/ChartPage");
		session.setAttribute("sideState", "M");
		return mav;
	}

	@RequestMapping(value="/PlayListAdd")
	public @ResponseBody String PlayListAdd(HttpSession session,String sgcode){
	    List<playL> playlist = new ArrayList<playL>();
	    playL song = new playL();
	    song.setSgcode(sgcode); // sgcode는 곡 코드를 나타내는 것으로 가정
	    playlist.add(song);
	    
	    session.setAttribute("playlist", playlist);
	    
	    return "Song added to playlist successfully";
	}

	
}
