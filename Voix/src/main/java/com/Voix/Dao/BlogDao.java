package com.Voix.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.Voix.Dto.Blog;

public interface BlogDao {

	HashMap<String, String> selectMainBlog();

	ArrayList<HashMap<String, String>> selectBlog_map();

	Blog getBlogInfo(String bgcode);

	ArrayList<HashMap<String, String>> selectReviewList(String bgcode);

	String selectMaxReCode();

	int BlogRegistReview(@Param("recode")String recode, @Param("restate")String restate, @Param("recontent")String recontent, @Param("rewriter")String rewriter);

	int deleteBlogReview(String recode);

	int likeBlog(@Param("like")String like,@Param("mid")String mid);

	ArrayList<HashMap<String, String>> selectBlogHitList();

}
