package com.Voix.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.Voix.Dto.Chart;
import com.Voix.Dto.Song;

public interface ChartDao {

	ArrayList<HashMap<String, String>> selectChart_map();

	ArrayList<Chart> selectChartInfo_map(String sgcode);

	ArrayList<HashMap<String, String>> selectSearch_Title(String searchKeyword);

	ArrayList<HashMap<String, String>> selectSearch_Content(String searchKeyword);

	HashMap<String, String> selectMainChart();

	String selectMaxSgCode();

	int insertSong(Song song);

	int countBoard();
	
	List<Map<String, Object>> selectBoardList(@Param("pageStart") String startSGCODE, @Param("perPageNum")String endSGCODE);
}
