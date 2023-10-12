package com.Voix.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Voix.Dao.AlbumDao;
import com.Voix.Dto.Album;

@Service
public class AlbumService {
	@Autowired
	private AlbumDao adao;

	public ArrayList<HashMap<String, String>> getAlbumtList_map() {
		
		return adao.selectAlbum_map();
	}

	public ArrayList<Album> getAlbumInfoList(String alcode) {
		
		return adao.selectAlbumInfo_map(alcode);
	}
}
