package com.Voix.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.Voix.Dto.Album;
import com.Voix.Dto.Cart;
import com.Voix.Dto.Like;
import com.Voix.Dto.Order;

public interface AlbumDao {

	ArrayList<HashMap<String, String>> selectAlbum_map();

	ArrayList<Album> selectAlbumInfo_map(String altitle);

	ArrayList<Cart> insertCart_map(String caalcode, String loginId);

	String selectMaxCaCode();

	int insertCart(Cart crt);

	ArrayList<HashMap<String, String>> selectCartList(String loginId);

	int likeAlbum(@Param("like")String like,@Param("mid")String mid);

	ArrayList<Like> likeSelect(@Param("like")String like,@Param("mid")String mid);
	
	Album getAlbumInfo_alcode(String alcode);

	int insertOdInfo(Order odInfo);

	String getmaxOdcode(String odcode);

	int deleteReserve(String odcode);

}
