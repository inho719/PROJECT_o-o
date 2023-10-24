package com.Voix.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Voix.Dto.Blog;
import com.Voix.Service.BlogService;
import com.google.gson.Gson;

@Controller
public class BlogController {
	
	@Autowired
	private BlogService bsvc;

	@RequestMapping(value = "/BlogPage")
	public ModelAndView Blog(HttpSession session){
		ModelAndView mav = new ModelAndView();
		session.setAttribute("sideState", "N");
		session.setAttribute("rankState", "BL");
		ArrayList<HashMap<String, String>> BlogList_map = bsvc.getBlogList_map();
		System.out.println(BlogList_map);
		mav.addObject("BlogListMap",BlogList_map);
		mav.setViewName("Basic/BlogPage");
		return mav;
		
	}
	
	@RequestMapping(value ="/BlogInfoPage")
	public ModelAndView NewsInfoPage(String bgcode) {
		ModelAndView mav = new ModelAndView();
		Blog bg = bsvc.getbgInfo(bgcode);
		mav.addObject("bg", bg);
		ArrayList<HashMap<String,String>> reviewList = bsvc.selectReviewList(bgcode);
		mav.addObject("reviewList",reviewList);
		System.out.println(reviewList);
		mav.setViewName("BasicInfo/BlogInfoPage");
		return mav;
	}
	
	@RequestMapping(value = "/BlogRegistReview")
	public ModelAndView registReview(String restate, String recontent, HttpSession session, RedirectAttributes ra) {
		String rewriter = (String)session.getAttribute("loginId");
		int registResult = bsvc.BlogRegistReview(restate, recontent, rewriter);
		ModelAndView mav = new ModelAndView();
		ra.addFlashAttribute("msg", "댓글이 등록 되었습니다.");
		mav.setViewName("redirect:/BlogInfoPage?bgcode="+restate);
		return mav;
	}
	
	@RequestMapping(value="/deleteBlogReview")
	public ModelAndView deleteReivew(String recode,String bgcode,RedirectAttributes ra) {
		System.out.println("리뷰 삭제 요청");
		ModelAndView mav = new ModelAndView();
		int Result = bsvc.deleteBlogReview(recode);
		ra.addFlashAttribute("msg", "관람평 삭제 완료 되었습니다.");
		mav.setViewName("redirect:/BlogInfoPage?bgcode="+bgcode);
		return mav;
	}
	
	@RequestMapping(value="/likeBlog")
	public @ResponseBody int likeNews(String like, HttpSession session) {
		System.out.println("블로그 찜 기능");
		String mid = session.getAttribute("loginId").toString();
		System.out.println("블로그- 아이디 확인:"+mid);
		System.out.println("블로그-   찜 확인:"+like);
		
	return bsvc.likeBlog(like,mid);
	}
	
	@RequestMapping(value = "/BlogHitList")
	public  @ResponseBody String BlogHitList() {
		System.out.println("사이드바 조회수 목록 출력");
		ModelAndView mav = new ModelAndView();
		ArrayList<HashMap<String,String>> BlogHitList = bsvc.selectBlogHitList();
		
		return new Gson().toJson(BlogHitList);
	}
}
