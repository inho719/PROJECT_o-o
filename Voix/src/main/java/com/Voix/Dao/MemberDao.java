package com.Voix.Dao;

import com.Voix.Dto.Member;

public interface MemberDao {

	Member selectMemberInfo_mapper(String inputId);

	int getinsertMemberJoin_comm(Member mem);

	String FindId(String email);

	ArrayList<HashMap<String, String>> newsLikeList(String loginId);

	ArrayList<HashMap<String, String>> albumsLikeList(String loginId);

	ArrayList<HashMap<String, String>> ticketsLikeList(String loginId);

	ArrayList<HashMap<String, String>> songsLikeList(String loginId);

}
