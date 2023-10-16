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
import com.Voix.Dto.News;
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
	public ModelAndView AlbumInfoPage(String altitle) {
		ModelAndView mav = new ModelAndView();
		ArrayList<Album> AlbumInfoList = asvc.getAlbumInfoList(altitle);
		Album ALInfo = AlbumInfoList.get(0);
		System.out.println(AlbumInfoList);
		mav.addObject("ALInfo", ALInfo);
		mav.addObject("AlbumInfoList", AlbumInfoList);
		ArrayList<HashMap<String,String>> reviewList = asvc.selectReviewList(altitle);
		mav.addObject("reviewList",reviewList);

		mav.setViewName("BasicInfo/AlbumInfoPage");
		return mav;
	}
	
	@RequestMapping(value = "/albumRegistReview")
	public ModelAndView registReview(String restate, String recontent, HttpSession session, RedirectAttributes ra) {
		String rewriter = (String)session.getAttribute("loginId");
		int registResult = asvc.albumRegistReview(restate, recontent, rewriter);
		ModelAndView mav = new ModelAndView();
		ra.addFlashAttribute("msg", "댓글이 등록 되었습니다.");
		mav.setViewName("redirect:/AlbumInfoPage?altitle="+restate);
		return mav;
		
	}
	
	@RequestMapping(value="/albumDeleteReview")
	public ModelAndView deleteReivew(String recode,String altitle,RedirectAttributes ra) {
		System.out.println("리뷰 삭제 요청");
		ModelAndView mav = new ModelAndView();
		int Result = asvc.deleteReview(recode);
		ra.addFlashAttribute("msg", "댓글 삭제 완료 되었습니다.");
		mav.setViewName("redirect:/AlbumInfoPage?altitle="+altitle);

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

}
