package com.Voix.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Voix.Dao.BlogDao;
import com.Voix.Dto.Blog;

@Service
public class BlogService {

	@Autowired
	private BlogDao bdao;
	
	@Autowired
	private TicketService tsvc;
	
	public HashMap<String, String> selectMainBlog(String themaStr) {
		return bdao.selectMainBlog();
	}


	public ArrayList<HashMap<String, String>> getBlogList_map() {

		return bdao.selectBlog_map();
	}


	public Blog getbgInfo(String bgcode) {
		System.out.println("SERVICE - 블로그정보 출력");
		return bdao.getBlogInfo(bgcode);
	}


	public ArrayList<HashMap<String, String>> selectReviewList(String bgcode) {
		System.out.println("selectReivewList  호출");
		ArrayList<HashMap<String, String>> Resultre = bdao.selectReviewList(bgcode);
		return Resultre;
	}


	public int BlogRegistReview(String restate, String recontent, String rewriter) {
		System.out.println("service - registReview()");
		String maxRvCode = bdao.selectMaxReCode();
		String recode = tsvc.genCode(maxRvCode);
		int registReview = bdao.BlogRegistReview(recode, restate, recontent, rewriter);
		System.out.println(registReview);
		return registReview;
	}


	public int deleteBlogReview(String recode) {
		System.out.println("SERVEICE - deleteReview 호출");
		return bdao.deleteBlogReview(recode);
	}


	public int likeBlog(String like, String mid) {
		System.out.println("SERVICE- 블로그 찜");
		return bdao.likeBlog(like,mid);
	}


	public ArrayList<HashMap<String, String>> selectBlogHitList() {
		System.out.println("조회수 목록 조회");
		return bdao.selectBlogHitList();
	}


	public int UpdateBlogBigHit(String bgcode) {
		return bdao.UpdateBlogBigHit(bgcode);
	}

	
	public ArrayList<String> getLikedBlogList(String mid) {
		System.out.println("SERVEICE - 찜 조회");
		 return bdao.getLikedBlogList(mid);
	}
	
	public int unlikeBlog(String like, String mid) {
		 System.out.println("SERVEICE - 찜 삭제");
		 return bdao.unlikeBlog(like, mid);
	}

	
}
