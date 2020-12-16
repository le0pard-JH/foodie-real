package com.spring.foodie.service;

import java.util.Map;

import com.spring.foodie.model.MemberVO;

public interface InterFoodieService {
	
	
	MemberVO emailDuplicateCheck(String email); // 아이디 중복검사하기

	MemberVO getLoginMember(Map<String, String> paraMap); // 로그인 처리하기

	MemberVO getkakaoLoginMember(String userid); // 카카오로 로그인 처리하기

	void setLoginHistory(Map<String, String> paraMap); // 로그인 히스토리 저장하기
	
	
}






