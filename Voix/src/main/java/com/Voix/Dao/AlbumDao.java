package com.Voix.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.Voix.Dto.Album;
import com.Voix.Dto.Cart;

public interface AlbumDao {

	ArrayList<HashMap<String, String>> selectAlbum_map();

	ArrayList<Album> selectAlbumInfo_map(String altitle);

	ArrayList<Cart> insertCart_map(String caalcode, String loginId);

	String selectMaxCaCode();

	int insertCart(Cart crt);

	ArrayList<HashMap<String, String>> selectCartList(String loginId);

	ArrayList<HashMap<String, String>> selectReviewList(String altitle);

	Album getNwInfo(String alcode);

	String selectMaxReCode();

	int albumRegistReview(@Param("recode")String recode, @Param("restate")String restate, @Param("recontent")String recontent, @Param("rewriter")String rewriter);

	int deleteReview(String recode);

}
