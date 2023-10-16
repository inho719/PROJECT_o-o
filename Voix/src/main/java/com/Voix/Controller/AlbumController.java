package com.Voix.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Voix.Dto.Album;
import com.Voix.Service.AlbumService;

@Controller
public class AlbumController {

	@Autowired
	private AlbumService asvc;

	@RequestMapping(value = "/AlbumPage")
	public ModelAndView AlbumPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		ArrayList<HashMap<String, String>> AlbumList_map = asvc.getAlbumtList_map();
		session.setAttribute("sideState", "N");
		session.setAttribute("rankState", "AB");

		System.out.println(AlbumList_map);
		mav.addObject("AlbumListMap", AlbumList_map);
		mav.setViewName("Basic/AlbumPage");
		return mav;
	}

	@RequestMapping(value = "/AlbumInfoPage")
	public ModelAndView NewsInfoPage(String altitle) {
		ModelAndView mav = new ModelAndView();
		ArrayList<Album> AlbumInfoList = asvc.getAlbumInfoList(altitle);
		Album ALInfo = AlbumInfoList.get(0);
		System.out.println(AlbumInfoList);
		mav.addObject("ALInfo", ALInfo);
		mav.addObject("AlbumInfoList", AlbumInfoList);

		mav.setViewName("BasicInfo/AlbumInfoPage");
		return mav;
	}

	@RequestMapping(value = "/CartPage")
	public ModelAndView CartPage(String caalcode, int caqty, HttpSession session, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		if (loginId == null) {
			System.out.println("로그인 안함");
			/*
			 * 아이디 또는 비밀번호 일치하지 않습니다 출력 로그인 페이지로 이동
			 */
			ra.addFlashAttribute("msg", "장바구니는 로그인후 이용 가능합니다.");
			mav.setViewName("redirect:/LoginPage");
		} else if (loginId != null) {
			System.out.println("로그인 함");
			int insertCart = asvc.insetCart(caalcode, caqty, loginId);
			if (insertCart > 0) {
				System.out.println("장바구니 추가 완료");
				ArrayList<HashMap<String,String>> CartList = asvc.CartList(loginId);
				System.out.println(CartList);
				mav.addObject("CartList", CartList);
			}
			// ArrayList<Cart> CartList =
			mav.setViewName("Basic/CartPage");
		}
		return mav;
	}
	@RequestMapping(value = "/PayPage")
	public ModelAndView PayPage(String alcode,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Album alInfo = asvc.getAlbumInfo_alcode(alcode);
		String mid = session.getAttribute("loginId").toString();
		mav.addObject("mid",mid);
		mav.addObject("al",alInfo);
		mav.setViewName("Basic/PayPage");
		return mav;
	}
	@RequestMapping(value="/kakaoPay_ready")
	public @ResponseBody String kakaoPay_ready(Order odInfo,HttpSession session) {
		System.out.println("카카오 결제 준비 요청 - / kakaoPay_ready");
		String odcode =asvc.odcodeseting(odInfo.getOdcode());
		odInfo.setOdcode(odcode);
		int insertOd = asvc.insertOdInfo(odInfo);
		String result = asvc.kakaoPay_ready(odInfo, session);
		return result;
	}
	
	@RequestMapping(value = "/kakaoPay_approval")
	public ModelAndView kakaoPay_approval(String pg_token, HttpSession session) {
		System.out.println("카카오 결제 승인 요청");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("pg_token : " + pg_token);
		String tid = (String)session.getAttribute("tid");
		System.out.println("tid : " + tid);
		String odcode = (String)session.getAttribute("odcode");
		String loginId = (String)session.getAttribute("loginId");
		String result = asvc.kakaoPay_approval(tid, pg_token, odcode, loginId ); 
		if( result == null) {
		System.out.println("결제 오류");
		asvc.cancelReserve(odcode);
		mav.addObject("payResult", "N");
		} else {
		System.out.println("결제 승인");
		
		mav.addObject("payResult", "Y");
		}
		session.removeAttribute("mid");
		session.removeAttribute("odcode");
		mav.setViewName("/Basic/PayResult");
		return mav;
		}

		@RequestMapping(value = "/kakaoPay_cancel")
		public ModelAndView kakaoPay_cancel(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String odcode = (String)session.getAttribute("odcode");
		asvc.cancelReserve(odcode);
		mav.addObject("payResult", "N");
		mav.setViewName("/Basic/AlbumPage");
		return mav;
		}

}
