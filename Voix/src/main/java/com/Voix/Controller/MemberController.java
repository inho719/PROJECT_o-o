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
	
	@RequestMapping("/mailCheck")
	public @ResponseBody String mailCheck(String email){
		System.out.println("이메일 인증 요청");
		System.out.println(email);
		return msvc.mailCheck(email);
	}
	@RequestMapping("/FindId")
	public @ResponseBody String FindId(String email) {
		System.out.println("id 찾기");
		System.out.println(email);
		return msvc.FindId(email);
	}

	@RequestMapping(value = "/MyInfoPage")
	public ModelAndView MyInfoPage(HttpSession session, RedirectAttributes ra) {
		System.out.println("/MyInfoPage 요청");
		ModelAndView mav = new ModelAndView();
		String loginId = (String)session.getAttribute("loginId");
		
		Member memberInfo = msvc.memberInfo(loginId);
		mav.addObject("mInfo", memberInfo);
		
		ArrayList<HashMap<String, String>> newsLike = msvc.newsLike(loginId);
		mav.addObject("newsLikeList",newsLike);
		
		ArrayList<HashMap<String, String>> albumsLike = msvc.albumsLike(loginId);
		mav.addObject("albumsLikeList",albumsLike);
		
		ArrayList<HashMap<String, String>> ticketsLike = msvc.ticketsLike(loginId);
		mav.addObject("ticketsLikeList",ticketsLike);
		
		ArrayList<HashMap<String, String>> songsLike = msvc.songsLike(loginId);
		mav.addObject("songsLikeList",songsLike);
		
		mav.setViewName("/Member/MyInfoPage");
		return mav;

	@RequestMapping(value="/memberLogin_kakao")
	//ajax = ReponseBody
	public @ResponseBody String memberLogin_kakao(String id, HttpSession session) {
		System.out.println("카카오 로그인 요청");
		System.out.println("카카오 id: " + id);
		//Member, MemberService, MemberDao
		Member loginMember = msvc.getLoginMemberInfo_kakao(id);
		if(loginMember == null) {
			System.out.println("카카오 계정 정보 없음");
			return "N";
		}else {
			System.out.println("카카오 계정 정보 있음");
			System.out.println("로그인 처리");
			session.setAttribute("loginId", loginMember.getMid());
			session.setAttribute("loginName", loginMember.getMname());
			session.setAttribute("loginProfile", loginMember.getMimg());
			session.setAttribute("loginState", loginMember.getMstate());
			return "Y";
		}
		
	}
	
	@RequestMapping(value="/memberJoin_kakao")
	public @ResponseBody String memberJoin_kakao(Member member){
		System.out.println("카카오 계정 - 회원가입요청 - memberJoin_kakao");
		System.out.println(member);
		int result = msvc.registMember_kakao(member);
		return result+"";
		
	}
	
	@RequestMapping(value="/memberLogout")
	public String memberLogout(HttpSession session, RedirectAttributes ra) {
	session.invalidate();
	ra.addFlashAttribute("msg","로그아웃 되었습니다.");
	return "redirect:/";
	}
}
