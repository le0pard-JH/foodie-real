package com.spring.foodie.service;

import java.util.List;
import java.util.Map;

import com.spring.foodie.model.CommentVO;
import com.spring.foodie.model.LoginHistoryVO;
import com.spring.foodie.model.MemberVO;
import com.spring.foodie.model.SearchVO;

public interface InterFoodieService {

	List<SearchVO> getStoreList(String place, String scrollCtrl);

	SearchVO getStoreDetail(String code);

	List<Map<String, String>> moreView(String place, String scrollCtrl);

	// 검색하기
	List<SearchVO> searchList(Map<String, String> paraMap);
	
	// 댓글 가져오기 페이징 처리한
	List<CommentVO> getCommentList(Map<String,String> paraMap);
	
	
	int getCommentCnt(String code); // 댓글 총개수 가져오기
	
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

	List<MemberVO> getEmail(Map<String, String> paraMap); // 이름과 등록된 휴대전화 번호로 이메일 있는지 없는지 여부 확인

	int searchPwd(Map<String, String> paraMap); // 이메일과 휴대폰번호로 사용자가 있는 사용자인지 확인

	int modifyPw(Map<String, String> paraMap); // 비밀번호 변경하기

	int duplicateCheckStoreLike(Map<String, String> paraMap); // 찜하기 중복검사

	int storelike(Map<String, String> paraMap); // 찜하기 추가
	
	int delstorelike(Map<String, String> paraMap); // 찜하기 삭제
	
	// 가게별 점수 수 가져오기
	int getPointCnt(Map<String, String> paraMap);

	// 컬럼 수 가져오기
	int getOnePointCnt(String code);
	int getTwoPointCnt(String code);
	int getThreePointCnt(String code);
	int getFourPointCnt(String code);
	int getFivePointCnt(String code);
	
	
	double getStoreAverage(String code);

	
	
	
	

	
	


}
