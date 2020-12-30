package com.spring.foodie.service;

import java.util.*;

import com.spring.foodie.model.*;

public interface InterFoodieService {

	//검색하기
	//List<SearchVO> searchList(Map<String, String> paraMap);

	// 댓글 가져오기
		List<CommentVO> getCommentList(String parentSeq);
		
		// 댓글 쓰기
		int addComment(CommentVO commentvo);
		
		// 댓글 좋아요 수 증가시키기
		int likeAdd(Map<String, String> paraMap);
		
		// 아이디 중복검사하기
		 MemberVO emailDuplicateCheck(String email); 

		 MemberVO getLoginMember(Map<String, String> paraMap); // 로그인 처리하기

		 MemberVO getkakaoLoginMember(String userid); // 카카오로 로그인 처리하기

		 void setLoginHistory(Map<String, String> paraMap); // 로그인 히스토리 저장하기

		 LoginHistoryVO getloginHistoryGap(String email); // 
		 
		 int registerMember(Map<String, String> paraMap); // 회원가입하기

		 MemberVO getUserInfo(String email); // 유저정보 가져오기

		 int addCommentCnt(String seq);
		 
		 int likeAddCnt(String seq);

		int delLike(Map<String, String> paraMap); // like 삭제하기

		int likeDelCnt(String seq); // like 수 삭제하기

		int duplicateCheckLike(Map<String, String> paraMap); // like 중복검사하기
	
}






