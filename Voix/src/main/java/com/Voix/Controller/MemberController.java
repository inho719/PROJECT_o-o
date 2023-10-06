package com.Voix.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Voix.Dto.Member;
import com.Voix.Service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService msvc;
	
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

	@RequestMapping(value = "/memberIdCheck")
	public @ResponseBody String memberIdcheck(String inputId) {
		System.out.println("아이디 중복 확인 요청");
		System.out.println("중복 확인 아이디" + inputId);
		String checkResult = msvc.idCheck(inputId);

		return checkResult;
	}
	
	@RequestMapping(value ="/Join")
	public ModelAndView Login(String Id, String RePw,String Name,String Address, String DetailAddress
			,String memailId, String memailDomain, HttpSession session) {
		System.out.println("회원가입처리");
		ModelAndView mav = new ModelAndView();
		Member mem = new Member();
		mem.setMid(Id);
		mem.setMpw(RePw);
		mem.setMname(Name);
		mem.setMaddr(Address+" "+DetailAddress);
		mem.setMemail(memailId+"@"+memailDomain);
		System.out.println(mem);
		int Join = 0;
		try {
			Join = msvc.getinsertMemberJoin_comm(mem, session);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(Join > 0 ) {
			System.out.println("성공");
			mav.setViewName("/Member/LoginPage");
		}else {
			System.out.println("실패");
			mav.setViewName("/Member/JoinPage");
		}
		
		return mav;
	}

}
