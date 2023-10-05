package com.Voix.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@RequestMapping(value = "/LoginPage")
	public ModelAndView LoginPage() {
		System.out.println("/LoginPage 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Member/LoginPage");
		return mav;
	}
	
	@RequestMapping(value = "/IdFindPage")
	public ModelAndView IdFindPage() {
		System.out.println("/IdFindPage 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Member/IdFindPage");
		return mav;
	}
	
	@RequestMapping(value = "/PwFindPage")
	public ModelAndView PwFindPage() {
		System.out.println("/PwFindPage 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Member/PwFindPage");
		return mav;
	}
	
	@RequestMapping(value = "/JoinPage")
	public ModelAndView JoinPage() {
		System.out.println("/JoinPage 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Member/JoinPage");
		return mav;
	}
	
	@RequestMapping(value = "/MyInfoUpdate")
	public ModelAndView MyInfoUpdate() {
		System.out.println("/MyInfoUpdate 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Member/MyInfoUpdate");
		return mav;
	}
	
	@RequestMapping(value = "/MyInfoPage")
	public ModelAndView MyInfoPage() {
		System.out.println("/MyInfoPage 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Member/MyInfoPage");
		return mav;
	}
}
