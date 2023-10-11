package com.Voix.Dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface NewsDao {

	ArrayList<HashMap<String, String>> selectNews_map();

}
