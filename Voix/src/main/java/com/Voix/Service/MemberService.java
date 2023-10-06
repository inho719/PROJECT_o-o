package com.Voix.Service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Voix.Dao.MemberDao;
import com.Voix.Dto.Member;

@Service
public class MemberService {

	@Autowired
	private MemberDao mdao;

	public String idCheck(String inputId) {
		System.out.println("SERVICE - idCheck() 호출");
		Member member_mapper = mdao.selectMemberInfo_mapper(inputId);
		String Result = "N";
		if (member_mapper == null) {
			Result = "Y";
		}

		return Result;
	}

	public int getinsertMemberJoin_comm(Member mem, HttpSession session) {
		System.out.println("SERVICE - getinsertMemberJoin_comm");
		int Result = mdao.getinsertMemberJoin_comm(mem);
		return Result;
	}

}
