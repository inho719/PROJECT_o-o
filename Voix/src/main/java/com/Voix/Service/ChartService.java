package com.Voix.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Voix.Dao.ChartDao;
import com.Voix.Dto.Chart;

@Service
public class ChartService {

	@Autowired
	private ChartDao cdao;

	public ArrayList<HashMap<String, String>> getChartList_map() {
		
		return cdao.selectChart_map();
	}

	public ArrayList<Chart> getChartInfoList(String sgcode) {
		
		return cdao.selectChartInfo_map(sgcode);
	}
	public ArrayList<HashMap<String, String>> selectTitle(String searchKeyword) {
		ArrayList<HashMap<String, String>> searchList = new ArrayList<HashMap<String, String>>();
		ArrayList<HashMap<String, String>> titleList = new ArrayList<HashMap<String, String>>();
		ArrayList<HashMap<String, String>> contentList = new ArrayList<HashMap<String, String>>();
			try {
				titleList = cdao.selectSearch_Title(searchKeyword);				
			} catch (Exception e) {
			}
			System.out.println(titleList);
			try {
				contentList = cdao.selectSearch_Content(searchKeyword);				
			} catch (Exception e) {
			}
			searchList.addAll(titleList);
			searchList.addAll(contentList);
		return searchList;
	}

		public HashMap<String, String> selectMainChart(String themaStr) {
		
		return cdao.selectMainChart();
	}
	
}
