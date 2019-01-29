package com.spring.helper.dao;

import java.util.List;
import java.util.Map;

import com.spring.helper.vo.BoardVO.UserVO;

public interface MemberDAO {
	
	// 대호 메소드 시작 ============================================================

	public int memberConfirmidForm(String email);

	public int memberInputPro(Map<String, Object> map);

	public void sendEmailKey(Map<String, Object> map);

	public int memberEmailConfirmed(String emailKey);

	public int memberModifyPro(Map<String, Object> map);

	public int memberDeleteForm(Map<String, Object> map);

	public int memberDeletePro(Map<String, Object> map);
	
	public List<UserVO> hostMemberList();
	
	public int getCnt();
	// 대호 메소드 종료 ============================================================

}
