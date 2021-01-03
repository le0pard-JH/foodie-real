package com.spring.foodie.model;

import java.util.List;
import java.util.Map;

import com.spring.foodie.model.BoardVO;
import com.spring.foodie.model.CommentVO;
import com.spring.foodie.model.MemberVO;

public interface InterFoodieDAO {

	List<SearchVO> getStoreList(String place, String scrollCtrl);

	SearchVO getStoreDetail(String code);

	List<Map<String, String>> moreView(String place, String scrollCtrl);
	//검색
	List<SearchVO> searchList(Map<String, String> paraMap);

	int test_insert();  // spring_test 테이블에 insert 하기 

	// view단의 form 태그에서 입력받은 값을 spring_test 테이블에  insert 하기
	int test_insert(Map<String, String> paraMap);

	// hr.employees 테이블의 정보를 select 해오기 
	List<Map<String, String>> test_employees();

	//////////////////////////////////////////////////////////
	
	// 시작페이지에서 메인 이미지를 보여주는 것 
	List<String> getImgfilenameList();

	int updateIdle(String userid);

	// 글쓰기(파일첨부가 없는 글쓰기)
	int add(BoardVO boardvo);

	// 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기 
	List<BoardVO> boardListNoSearch();
	
	void setAddReadCount(String seq); // 글조회수 1증가 하기  
	BoardVO getView(String seq); // 글1개 조회하기  

	// 1개글 수정하기
	int edit(BoardVO boardvo);

	// 1개글 삭제하기
	int del(Map<String, String> paraMap);

  ///////////////////////////////////////////////////
	int updateCommentCount(String parentSeq); // tbl_board 테이블에 commentCount 컬럼의 값을 1증가(update)  
	int updateMemberPoint(Map<String, String> paraMap);  // tbl_member 테이블에 point 컬럼의 값을 50증가(update) 
  ///////////////////////////////////////////////////

	// 원게시글에 딸린 댓글들을 조회해오는 것

	// BoardAOP 클래스에 사용하는 것으로 특정 회원에게 특정 점수만큼 포인트를 증가하기 위한 것
	void pointPlus(Map<String, String> paraMap);

	// 페이징 처리를 안한 검색어가 있는 전체 글목록 보여주기 
	List<BoardVO> boardListSearch(Map<String, String> paraMap);

	// 검색어 입력시 자동글 완성하기
	List<String> wordSearchShow(Map<String, String> paraMap);

	// 총 게시물 건수(totalCount) 구하기 - 검색이 있을때와 검색이 없을때로 나뉜다. 
	int getTotalCount(Map<String, String> paraMap);

	// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)
	List<BoardVO> boardListSearchWithPaging(Map<String, String> paraMap);

	// 원게시물에 딸린 댓글들을 페이징처리해서 조회해오기(Ajax 로 처리) 

	// 원게시물에 딸린 댓글 totalPage 알아오기 (Ajax 로 처리) 

	// tbl_board 테이블에서 groupno 컬럼의 최대값 구하기  
	int getGroupnoMax();

	// 글쓰기(파일첨부가 있는 글쓰기)
	int add_withFile(BoardVO boardvo);
	
	
	// 가게 code에 맞는 댓글 List 가져오기
		List<CommentVO> getCommentList(String code);
		
		// 댓글 추가하기
		int addComment(CommentVO commentvo);
		
		// 댓글 삭제하기
		int deleteComment(CommentVO commentvo);
		
		// 원게시물에 딸린 댓글들을 페이징처리해서 조회해오기(Ajax 로 처리) 
		List<CommentVO> getCommentListPaging(Map<String, String> paraMap);

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
}







