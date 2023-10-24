package com.Voix.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.Voix.Dto.Chart;

public interface ChartDao {

	ArrayList<HashMap<String, String>> selectChart_map();

	ArrayList<Chart> selectChartInfo_map(String sgcode);

	ArrayList<HashMap<String, String>> selectSearch_Title(String searchKeyword);

	ArrayList<HashMap<String, String>> selectSearch_Content(String searchKeyword);

	HashMap<String, String> selectMainChart();

	String selectMaxSgCode();

	int insertSong(Song song);
}
