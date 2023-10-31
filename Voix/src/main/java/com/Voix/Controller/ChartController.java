package com.Voix.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Voix.Dto.Chart;
import com.Voix.Dto.Criteria;
import com.Voix.Dto.PageMaker;
import com.Voix.Dto.playL;
import com.Voix.Service.ChartService;

@Controller
public class ChartController {

	@Autowired
	private ChartService csvc;
	
	@RequestMapping(value = "/ChartPage")
	public ModelAndView ChartPage(HttpSession session, Criteria cri) throws Exception {
		ModelAndView mav = new ModelAndView();
		ArrayList<HashMap<String, String>> ChartList_map = csvc.getChartList_map();
		session.setAttribute("sideState", "M");
		session.setAttribute("rankState", "CH");
		session.setAttribute("SerchState", "Y");
		int perPageNum = cri.getPerPageNum();
		int page = cri.getPage();
		String startSGCODE = String.format("S%04d", (page - 1) * perPageNum + 1);
	    String endSGCODE = String.format("S%04d", page * perPageNum);
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(csvc.countBoardListTotal());
	    List<Map<String, Object>> list = csvc.selectBoardList(startSGCODE, endSGCODE);
	    mav.addObject("ChartList", list);
	    mav.addObject("pageMaker", pageMaker);
	    System.out.println(list);
	    System.out.println(pageMaker);
		//mav.addObject("ChartListMap",ChartList_map);
		mav.setViewName("Basic/ChartPage");
		return mav;
	}
	
	@RequestMapping(value ="/ChartInfoPage")
	public ModelAndView ChartInfoPage(String sgcode) {
		ModelAndView mav = new ModelAndView();
		ArrayList<Chart> ChartInfoList = csvc.getChartInfoList(sgcode);
		mav.addObject("ChartInfoList", ChartInfoList);
		mav.setViewName("BasicInfo/ChartInfoPage");
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

	@RequestMapping(value="/melonCrawling")
	public ModelAndView getMelonInfo() throws IOException {
		System.out.println("멜론차트 수집요청 - /getMelonInfo");
		//추가된 영화 개수
		int addCount = csvc.melonCrawling();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}

	@RequestMapping(value = "/ChartRegistReview")
	public ModelAndView registReview(String restate, String recontent, HttpSession session, RedirectAttributes ra) {
		String rewriter = (String)session.getAttribute("loginId");
		int registResult = csvc.ChartRegistReview(restate, recontent, rewriter);
		ModelAndView mav = new ModelAndView();
		ra.addFlashAttribute("msg", "댓글이 등록 되었습니다.");
		mav.setViewName("redirect:/ChartInfoPage?sgcode="+restate);
		return mav;
	}
	
	@RequestMapping(value = "/deleteChartReview")
	public ModelAndView deleteReivew(String recode, String sgcode, RedirectAttributes ra) {
		System.out.println("리뷰 삭제 요청");
		ModelAndView mav = new ModelAndView();
		int Result = csvc.deleteReview(recode);
		ra.addFlashAttribute("msg", "댓글 삭제 완료 되었습니다.");
		mav.setViewName("redirect:/ChartInfoPage?sgcode=" + sgcode);

		return mav;
	}
	
}
