package com.Voix.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.Voix.Dto.Album;
import com.Voix.Dto.Cart;
import com.Voix.Dto.Order;

public interface AlbumDao {

	ArrayList<HashMap<String, String>> selectAlbum_map();

	ArrayList<Album> selectAlbumInfo_map(String altitle);

	ArrayList<Cart> insertCart_map(String caalcode, String loginId);

	Album getAlbumInfo_alcode(String alcode);

	int insertOdInfo(Order odInfo);

	String getmaxOdcode(String odcode);

	int deleteReserve(String odcode);

}