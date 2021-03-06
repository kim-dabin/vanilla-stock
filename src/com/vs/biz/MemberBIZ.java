package com.vs.biz;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.vs.vo.MemberVO;

public interface MemberBIZ {
	public Map<String, Object> selectList(String searchWord, String sortType, int page);

	
  public MemberVO loginCheck(MemberVO vo);
	
	//public MemberVO viewMember(MemberVO vo);

	public void insertUser(MemberVO newMember);
  
  public void logout(HttpSession session);
  
}
