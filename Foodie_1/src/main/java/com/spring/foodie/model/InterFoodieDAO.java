package com.spring.foodie.model;

import java.util.Map;

public interface InterFoodieDAO {

	MemberVO emailDuplicateCheck(String email); // 이메일중복검사

	MemberVO getLoginMember(Map<String, String> paraMap); // 로그인 멤버가져오기

	MemberVO getkakaoLoginMember(String kakaoid); // 카카오로 로그인하기
	
	void setLoginHistory(Map<String, String> paraMap); // 일반 로그인 기록하기

	LoginHistoryVO getloginHistoryGap(String email); // 로그인 히스토리 가져오기.

	int registerMember(Map<String, String> paraMap); // 회원가입하기
	
	
}







