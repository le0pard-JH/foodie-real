package com.spring.foodie.service;

import java.util.List;
import java.util.Map;

import com.spring.foodie.model.CommentVO;
import com.spring.foodie.model.MemberVO;
import com.spring.foodie.model.BoardVO;
import com.spring.foodie.model.SearchVO;

public interface InterFoodieService {

	List<SearchVO> getStoreList(String place, String scrollCtrl);

	SearchVO getStoreDetail(String code);

	List<Map<String, String>> moreView(String place, String scrollCtrl);

	// 검색하기
	List<SearchVO> searchList(Map<String, String> paraMap);

	List<Map<String, String>> test_employees(); // model단(BoardDAO)에 존재하는 메소드( test_employees() )를 호출 한다. 
	
	/////////////////////////////////////////////////////////
	
	// 시작페이지에서 메인 이미지를 보여주는 것 
	List<String> getImgfilenameList();

	// 로그인 처리하기
	MemberVO getLoginMember(Map<String, String> paraMap);

	// 글쓰기(파일첨부가 없는 글쓰기)
	int add(BoardVO boardvo);

	// == 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기 == //
	List<BoardVO> boardListNoSearch();

	// 글1개를 보여주기 
	BoardVO getView(String seq, String login_userid);

	// 글조회수 증가는 없고 단순히 글1개 조회만을 해주는 것이다.
	BoardVO getViewWithNoAddCount(String seq);

	// 1개글 수정하기 
	int edit(BoardVO boardvo);

	// 1개글 삭제하기
	int del(Map<String, String> paraMap);

	// 댓글쓰기 (transaction 처리)
	int addComment(CommentVO commentvo) throws Throwable;

	// 원게시글에 딸린 댓글들을 조회해오는 것
	List<CommentVO> getCommentList(String parentSeq);

	// BoardAOP 클래스에 사용하는 것으로 특정 회원에게 특정 점수만큼 포인트를 증가하기 위한 것 
	void pointPlus(Map<String, String> paraMap);

	// == 페이징 처리를 안한 검색어가 있는 전체 글목록 보여주기 == //
	List<BoardVO> boardListSearch(Map<String, String> paraMap);

	// 검색어 입력시 자동글 완성하기 
	List<String> wordSearchShow(Map<String, String> paraMap);

	// 총 게시물 건수(totalCount) 구하기 - 검색이 있을때와 검색이 없을때로 나뉜다.
	int getTotalCount(Map<String, String> paraMap);
	
	// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)
	List<BoardVO> boardListSearchWithPaging(Map<String, String> paraMap);

	// 원게시물에 딸린 댓글들을 페이징처리해서 조회해오기(Ajax 로 처리) 
	List<CommentVO> getCommentListPaging(Map<String, String> paraMap);

	// 원게시물에 딸린 댓글 totalPage 알아오기 (Ajax 로 처리) 
	int getCommentTotalCount(Map<String, String> paraMap);

	// 글쓰기(파일첨부가 있는 글쓰기)
	int add_withFile(BoardVO boardvo);
	
}
