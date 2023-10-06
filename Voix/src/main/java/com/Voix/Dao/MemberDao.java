package com.Voix.Dao;

import com.Voix.Dto.Member;

public interface MemberDao {

	Member selectMemberInfo_mapper(String inputId);

	int getinsertMemberJoin_comm(Member mem);

}
