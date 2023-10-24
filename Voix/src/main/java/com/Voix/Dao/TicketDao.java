package com.Voix.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.Voix.Dto.Ticket;

public interface TicketDao {

	ArrayList<HashMap<String, String>> selectTicket_map();

	Ticket getTkInfo(String tkcode);

	String selectMaxReCode();

	int registReview(@Param("recode")String recode, @Param("restate")String restate, @Param("recontent")String recontent, @Param("rewriter")String rewriter);

	ArrayList<HashMap<String, String>> selectReviewList(String tkcode);

	int deleteReview(String recode);
	
	ArrayList<Ticket> getTkTitle(String tkplace);

	ArrayList<HashMap<String, String>> selectSearch_Title(String searchKeyword);

	ArrayList<HashMap<String, String>> selectSearch_Content(String searchKeyword);

	HashMap<String, String> selectMainTicket();

	int likeTicket(@Param("like")String like,@Param("mid")String mid);
}
