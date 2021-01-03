package com.spring.foodie.model;


import java.awt.Stroke;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.foodie.model.CommentVO;
import com.spring.foodie.model.MemberVO;
import com.spring.foodie.model.BoardVO;

//=== #32. DAO 선언 ===
@Repository 
public class FoodieDAO implements InterFoodieDAO {

	// === #33. 의존객체 주입하기(DI: Dependency Injection) ===
	// >>> 의존 객체 자동 주입(Automatic Dependency Injection)은
	//     스프링 컨테이너가 자동적으로 의존 대상 객체를 찾아서 해당 객체에 필요한 의존객체를 주입하는 것을 말한다. 
	//     단, 의존객체는 스프링 컨테이너속에 bean 으로 등록되어 있어야 한다. 

	//     의존 객체 자동 주입(Automatic Dependency Injection)방법 3가지 
	//     1. @Autowired ==> Spring Framework에서 지원하는 어노테이션이다. 
	//                       스프링 컨테이너에 담겨진 의존객체를 주입할때 타입을 찾아서 연결(의존객체주입)한다.
	
	//     2. @Resource  ==> Java 에서 지원하는 어노테이션이다.
	//                       스프링 컨테이너에 담겨진 의존객체를 주입할때 필드명(이름)을 찾아서 연결(의존객체주입)한다.
	
	//     3. @Inject    ==> Java 에서 지원하는 어노테이션이다.
    //                       스프링 컨테이너에 담겨진 의존객체를 주입할때 타입을 찾아서 연결(의존객체주입)한다.	
	
    /*	
	@Autowired
	private SqlSessionTemplate abc; */
	// Type 에 따라 Spring 컨테이너가 알아서 root-context.xml 에 생성된 org.mybatis.spring.SqlSessionTemplate 의 bean 을  abc 에 주입시켜준다. 
    // 그러므로 abc 는 null 이 아니다.

	@Resource
	private SqlSessionTemplate sqlsession; // 로컬DB에 연결
	// Type 에 따라 Spring 컨테이너가 알아서 root-context.xml 에 생성된 org.mybatis.spring.SqlSessionTemplate 의 bean 을  abc 에 주입시켜준다. 
    // 그러므로 sqlsession 는 null 이 아니다.

	@Override
	public List<SearchVO> getStoreList(String place, String scrollCtrl) {
		
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("place", place);
		paraMap.put("scrollCtrl", scrollCtrl);
		
		List<SearchVO> storeList = sqlsession.selectList("foodie.storeList", paraMap);
		return storeList;
	}

	@Override
	public SearchVO getStoreDetail(String code) {
		
		SearchVO svo = sqlsession.selectOne("foodie.getStoreDetail", code);
		
		return svo;
	}
	
	// === #56. 글쓰기(파일첨부가 없는 글쓰기) === // 
		@Override
		public int add(BoardVO boardvo) {
			int n = sqlsession.insert("foodie.add", boardvo);
			return n;
		}

	@Override
	public List<Map<String,String>> moreView(String place, String scrollCtrl) {
		
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("place", place);
		paraMap.put("scrollCtrl", scrollCtrl);

		List<Map<String, String>> storeList = sqlsession.selectList("foodie.moreView",paraMap);
	
		return storeList;
	}
	
	@Override
	public List<SearchVO> searchList(Map<String, String> paraMap) {
		List<SearchVO> searchList = sqlsession.selectList("foodie.searchList", paraMap);
		return searchList;
	
	}

		// === #38. 메인 페이지용 이미지 파일을 가져오기 === //
		@Override
		public List<String> getImgfilenameList() {
			List<String> imgfilenameList = sqlsession.selectList("foodie.getImgfilenameList");
			return imgfilenameList;
		}

		// == #60. 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기 == //
		@Override
		public List<BoardVO> boardListNoSearch() {
			List<BoardVO> boardList = sqlsession.selectList("foodie.boardListNoSearch");
			return boardList;
		}


		// == #64. 글조회수 1증가 하기  == 
		@Override
		public void setAddReadCount(String seq) {
			sqlsession.update("foodie.setAddReadCount", seq);		
		}

		// == #65. 글1개 조회하기  == 
		@Override
		public BoardVO getView(String seq) {
			BoardVO boardvo = sqlsession.selectOne("foodie.getView", seq);
			return boardvo;
		}


		// == #74. 1개글 수정하기 == 
		@Override
		public int edit(BoardVO boardvo) {
			int n = sqlsession.update("foodie.edit", boardvo);
			return n;
		}


		// == #79. 1개글 수정하기 == 
		@Override
		public int del(Map<String, String> paraMap) {
			int n = sqlsession.delete("foodie.del", paraMap);
			return n;
		}


		// == #86. 댓글쓰기(tbl_comment 테이블에 insert) == 
		@Override
		public int addComment(CommentVO commentvo) {
			int n = sqlsession.insert("foodie.addComment", commentvo);
			return n;
		}

	    // == #87. tbl_board 테이블에 commentCount 컬럼의 값을 1증가(update) == 
		@Override
		public int updateCommentCount(String parentSeq) {
			int n = sqlsession.update("foodie.updateCommentCount", parentSeq);
			return n;
		}

		// == #87.-2  tbl_member 테이블에 point 컬럼의 값을 50증가(update) == 
		@Override
		public int updateMemberPoint(Map<String, String> paraMap) {
			int n = sqlsession.update("foodie.updateMemberPoint", paraMap);
			return n;
		}


		// == #92. 원게시글에 딸린 댓글들을 조회해오는 것 == // 
		@Override
		public List<CommentVO> getCommentList(String parentSeq) {
			List<CommentVO> commentList = sqlsession.selectList("foodie.getCommentList", parentSeq);
			return commentList;
		}


		// == #99. BoardAOP 클래스에 사용하는 것으로 특정 회원에게 특정 점수만큼 포인트를 증가하기 위한 것 
		@Override
		public void pointPlus(Map<String, String> paraMap) {
			sqlsession.update("foodie.pointPlus", paraMap);
		}


		// == #104. 페이징 처리를 안한 검색어가 있는 전체 글목록 보여주기 == //
		@Override
		public List<BoardVO> boardListSearch(Map<String, String> paraMap) {
			List<BoardVO> boardList = sqlsession.selectList("foodie.boardListSearch", paraMap);
			return boardList;
		}


		// === #110. 검색어 입력시 자동글 완성하기 5 === //
		@Override
		public List<String> wordSearchShow(Map<String, String> paraMap) {
			List<String> wordList = sqlsession.selectList("foodie.wordSearchShow", paraMap);
			return wordList;
		}


		// === #116. 총 게시물 건수(totalCount) 구하기 - 검색이 있을때와 검색이 없을때로 나뉜다. === //
		@Override
		public int getTotalCount(Map<String, String> paraMap) {
			int n = sqlsession.selectOne("foodie.getTotalCount", paraMap);
			return n;
		}


		// === #119. 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것) === //
		@Override
		public List<BoardVO> boardListSearchWithPaging(Map<String, String> paraMap) {
			List<BoardVO> boardList = sqlsession.selectList("foodie.boardListSearchWithPaging", paraMap);
			return boardList;
		}


		// === #130. 원게시물에 딸린 댓글들을 페이징처리해서 조회해오기(Ajax 로 처리) === //
		@Override
		public List<CommentVO> getCommentListPaging(Map<String, String> paraMap) {
			List<CommentVO> commentList = sqlsession.selectList("foodie.getCommentListPaging", paraMap);
			return commentList;
		}


		// === #134. 원게시물에 딸린 댓글 totalPage 알아오기 (Ajax 로 처리) === //
		@Override
		public int getCommentTotalCount(Map<String, String> paraMap) {
			int totalCount = sqlsession.selectOne("foodie.getCommentTotalCount", paraMap);
			return totalCount;
		}


		// === #145. tbl_board 테이블에서 groupno 컬럼의 최대값 구하기 === //
		@Override
		public int getGroupnoMax() {
			int max = sqlsession.selectOne("foodie.getGroupnoMax");
			return max;
		}


		// === #158. 글쓰기(파일첨부가 있는 글쓰기) === // 
		@Override
		public int add_withFile(BoardVO boardvo) {
			int n = sqlsession.insert("foodie.add_withFile", boardvo);
			return n;
		}

		@Override
		public List<Map<String, String>> test_employees() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public MemberVO getLoginMember(Map<String, String> paraMap) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public int updateIdle(String userid) {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public int test_insert() {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public int test_insert(Map<String, String> paraMap) {
			// TODO Auto-generated method stub
			return 0;
		}
	
	
	
}
