package com.Voix.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Voix.Dao.TicketDao;


@Service
public class TicketService {
	@Autowired
	private TicketDao tdao;

	public ArrayList<HashMap<String, String>> getTicketList_map() {
		
		return tdao.selectTicket_map();
	}

}
