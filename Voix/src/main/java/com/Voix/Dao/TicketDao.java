package com.Voix.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.Voix.Dto.Ticket;

public interface TicketDao {

	ArrayList<HashMap<String, String>> selectTicket_map();

	Ticket getTkInfo(String tkcode);



}
