package com.Voix.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Voix.Service.AlbumService;

@Controller
public class AlbumController {

	@Autowired
	private AlbumService asvc;
	
	@RequestMapping(value ="/AlbumPage")
	public ModelAndView AlbumPage() {
		ModelAndView mav = new ModelAndView();
		ArrayList<HashMap<String, String>> AlbumList_map = asvc.getAlbumtList_map();
		System.out.println(AlbumList_map);
		mav.addObject("AlbumListMap",AlbumList_map);
		mav.setViewName("Basic/AlbumPage");
		return mav;
	}
}
