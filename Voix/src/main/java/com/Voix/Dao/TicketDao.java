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

	String getMaxTkCode();

	int getTicket_melon(Ticket tK);

	int getTicket_Interticket(Ticket tK);

	int getTicket_Yes24ticket(Ticket tK);

	int getTicket_11bungaTicket(Ticket tK);

	ArrayList<HashMap<String, String>> getTicketList_ChooseSite(String siteVal);

	//찜조회
	ArrayList<String> getLikedTicketList(@Param("mid") String mid);
	//찜삭제
	int unlikeTicket(@Param("like")String like,@Param("mid")String mid);
	ArrayList<HashMap<String, String>> selectSearch_TitleSite(@Param("sk")String searchKeyword,@Param("sv") String siteValue);

	ArrayList<HashMap<String, String>> selectSearch_ContentSite(@Param("sk")String searchKeyword,@Param("sv") String siteValue);
	public ArrayList<HashMap<String, String>> selectTitle(String searchKeyword, String siteValue) {
		System.out.println("ㅗ"+siteValue);
		System.out.println("ㅗ"+searchKeyword);
		ArrayList<HashMap<String, String>> searchList = new ArrayList<HashMap<String, String>>();
		ArrayList<HashMap<String, String>> titleList = new ArrayList<HashMap<String, String>>();
		ArrayList<HashMap<String, String>> contentList = new ArrayList<HashMap<String, String>>();
			try {
				titleList = tdao.selectSearch_TitleSite(searchKeyword,siteValue);				
			} catch (Exception e) {
			}
			System.out.println(titleList);
			try {
				contentList = tdao.selectSearch_ContentSite(searchKeyword,siteValue);				
			} catch (Exception e) {
			}
			searchList.addAll(titleList);
			searchList.addAll(contentList);
		return searchList;
	}
}
