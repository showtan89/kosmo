package com.spring.helper.dao;

import java.util.List;
import java.util.Map;

import com.spring.helper.vo.BoardVO.UserVO;

public interface MemberDAO {
	
	// 대호 메소드 시작 ============================================================

	public int memberConfirmidForm(String email);

	public int memberInputPro(Map<String, Object> map);

	public int memberIdConfirm(String memberId);
	
	public void sendEmailKey(Map<String, Object> map);

	public int memberEmailConfirmed(String emailKey);

	public int memberModifyPro(Map<String, Object> map);

	public int memberDeleteForm(Map<String, Object> map);

	public int memberDeletePro(Map<String, Object> map);
	
	public List<UserVO> hostMemberList(Map<String, Object> map);
	
	public int getCnt();

	public int getApplyCnt();
	
	public List<UserVO> addAuthority(Map<String, Object> map);
	
	public int applyAuthority(String memberEmail);
	
	public int getSearchCnt(String text);
	
	public List<UserVO> memberSearch(Map<String, Object> map);
	// 대호 메소드 종료 ============================================================

}
