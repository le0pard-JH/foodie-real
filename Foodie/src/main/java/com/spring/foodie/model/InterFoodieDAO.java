package com.spring.foodie.model;

import java.util.List;
import java.util.Map;

public interface InterFoodieDAO {

	List<SearchVO> getStoreList(String place, String scrollCtrl);

	SearchVO getStoreDetail(String code);

	List<Map<String, String>> moreView(String place, String scrollCtrl);
	//검색
	List<SearchVO> searchList(Map<String, String> paraMap);
	
	// 페이징 처리한 가게 code에 맞는 댓글 List 가져오기
	List<CommentVO> getCommentList(Map<String, String> paraMap);
	
	// 게시글의 댓글 수 가져오기
	int getCommentCnt(String code);
	
	// 댓글 추가하기
	int addComment(CommentVO commentvo);
	
	// 댓글 삭제하기
	int deleteComment(CommentVO commentvo);
	
	// 원게시물에 딸린 댓글 totalPage 알아오기 (Ajax 로 처리) 
	int getCommentTotalCount(Map<String, String> paraMap);
	
	MemberVO emailDuplicateCheck(String email); // 이메일중복검사

	MemberVO getLoginMember(Map<String, String> paraMap); // 로그인 멤버가져오기

	MemberVO getkakaoLoginMember(String kakaoid); // 카카오로 로그인하기
	   
	void setLoginHistory(Map<String, String> paraMap); // 일반 로그인 기록하기

	LoginHistoryVO getloginHistoryGap(String email); // 로그인 히스토리 가져오기.
	
	int registerMember(Map<String, String> paraMap); // 회원가입하기

	MemberVO getUserInfo(String email); // 유저 정보 가져오기.

	int likeAdd(Map<String, String> paraMap); // 댓글 좋아요 증가 

	int addCommentCnt(String seq); //  원 댓글의 댓글수 증가시키기

	int likeAddCnt(String seq); // 좋아요 숫자 증가시키기

	int delLike(Map<String, String> paraMap); // like 삭제하기

	int likeDelCnt(String seq); // 좋아요 숫자 빼기

	int duplicateCheckLike(Map<String, String> paraMap); // 좋아요 중복검사하기

	List<MemberVO> getEmail(Map<String, String> paraMap); // 이메일  찾기

	int searchPwd(Map<String, String> paraMap); // 이메일과 휴대폰 번호로 사용자 찾기

	int modifyPw(Map<String, String> paraMap);  // 비밀번호 변경하기

	int duplicateCheckStoreLike(Map<String, String> paraMap); // 가게  찜하기 중복검사

	int storelike(Map<String, String> paraMap); // 가게 찜하기

	int delstorelike(Map<String, String> paraMap); // 가게 찜하기 삭제하기
	
	
	// 컬럼수 얻어오기 
	int getOnePointCnt(String code);

	int getTwoPointCnt(String code);

	int getThreePointCnt(String code);

	int getFourPointCnt(String code);

	int getFivePointCnt(String code);

	double getStoreAverage(String code);
	
	
	
}







