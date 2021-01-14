package com.spring.foodie.model;


import java.awt.Stroke;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Repository;

//=== #32. DAO 선언 ===
@Repository 
public class FoodieDAO implements InterFoodieDAO {



	@Resource
	private SqlSessionTemplate sqlsession; // 로컬DB에 연결


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

	@Override
	public List<CommentVO> getCommentList(Map<String, String> paraMap) {
		
		List<CommentVO> commentList = sqlsession.selectList("foodie.getCommentList", paraMap);
		return commentList;
	}
	
	
	
	@Override
	public int addComment(CommentVO commentvo) {
		
		int n = sqlsession.insert("foodie.addComment", commentvo);
		return n;
	}

	@Override
	public int deleteComment(CommentVO commentvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	   public MemberVO emailDuplicateCheck(String email) {

	      MemberVO mvo = sqlsession.selectOne("foodie.emailDuplicateCheck", email);

	      return mvo;
	   }

	   // === #46. 로그인 처리하기 === //
	   @Override
	   public MemberVO getLoginMember(Map<String, String> paraMap) {

	      MemberVO loginuser = sqlsession.selectOne("foodie.getLoginMember", paraMap);
	      
	      return loginuser;
	   }
	   
	   // 카카오로 로그인 하기
	   @Override
	   public MemberVO getkakaoLoginMember(String kakaoid) {
	      MemberVO loginuser = sqlsession.selectOne("foodie.getkakaoLoginMember", kakaoid);
	      return loginuser;
	   }
	   
	   
	    // https://all-record.tistory.com/168    IPV6  ==> IPV4
	    // 로그인 히스토리 기록하기
	   @Override
	   public void setLoginHistory(Map<String, String> paraMap) {
	      
	      sqlsession.insert("foodie.setLoginHistory", paraMap);
	      
	   }
	   
	   // 
	   @Override
	   public LoginHistoryVO getloginHistoryGap(String email) {
	      LoginHistoryVO historyvo = sqlsession.selectOne("foodie.getloginHistoryGap", email);
	      return historyvo;
	   }

	   @Override
	   public int registerMember(Map<String, String> paraMap) {
	      int n = sqlsession.insert("foodie.registerMember", paraMap);
	      
	      return n;
	   }

	   @Override
	   public MemberVO getUserInfo(String email) {
	      
	      MemberVO mvo=sqlsession.selectOne("foodie.getUserInfo", email);
	      return mvo;
	      
	   }

	@Override
	public int getCommentTotalCount(Map<String, String> paraMap) {
		return 0;
	}

	@Override
	public int likeAdd(Map<String, String> paraMap) {
		
		int n = sqlsession.insert("foodie.likeAdd", paraMap);
		return n;
	}
	

	
	
	@Override
	public int addCommentCnt(String parentSeq) {
		
		int n = sqlsession.update("foodie.addCommentCnt", parentSeq);
		return n;
	}

	@Override
	public int likeAddCnt(String seq) {
		int n = sqlsession.update("foodie.likeAddCnt", seq);
		return n;
	}

	@Override
	public int delLike(Map<String, String> paraMap) {
		int n = sqlsession.delete("foodie.delLike", paraMap);
		return n;
	}

	@Override
	public int likeDelCnt(String seq) {
		int n = sqlsession.update("foodie.likeDelCnt", seq);
		return n;
	}

	@Override
	public int duplicateCheckLike(Map<String, String> paraMap) {
		int n = sqlsession.selectOne("foodie.duplicateCheckLike", paraMap);
		return n;
	}

	@Override
	public List<MemberVO> getEmail(Map<String, String> paraMap) {
		List<MemberVO> mvolist = sqlsession.selectList("foodie.getEmail", paraMap);
		return mvolist;
	}

	@Override
	public int searchPwd(Map<String, String> paraMap) {
		
		int n = sqlsession.selectOne("foodie.searchPwd", paraMap);
		return n;
	}

	@Override
	public int modifyPw(Map<String, String> paraMap) {
		
		int n = sqlsession.update("foodie.modifyPw", paraMap);
		return n;
	}

	@Override
	public int duplicateCheckStoreLike(Map<String, String> paraMap) {
		
		int n = sqlsession.selectOne("foodie.duplicateCheckStoreLike", paraMap);
		return n;
	}
	
	@Override
	public int storelike(Map<String, String> paraMap) {
		int n = sqlsession.insert("foodie.storelike", paraMap);
		return n;
	}

	@Override
	public int delstorelike(Map<String, String> paraMap) {
		int n = sqlsession.delete("foodie.delstorelike", paraMap);
		return n;
		
	}

	@Override
	public int getOnePointCnt(String code) {
		int n = sqlsession.selectOne("foodie.getOnePointCnt", code);
		return n;
	}

	@Override
	public int getTwoPointCnt(String code) {
		int n = sqlsession.selectOne("foodie.getTwoPointCnt", code);
		return n;
	}
	
	@Override
	public int getThreePointCnt(String code) {
		int n = sqlsession.selectOne("foodie.getThreePointCnt", code);
		return n;
	}
	
	
	@Override
	public int getFourPointCnt(String code) {
		int n = sqlsession.selectOne("foodie.getFourPointCnt", code);
		return n;
	}

	@Override
	public int getFivePointCnt(String code) {
		int n = sqlsession.selectOne("foodie.getFivePointCnt", code);
		return n;
	}
	
	@Override
	public int getCommentCnt(String code) {
		int n = sqlsession.selectOne("foodie.getCommentCnt", code); 
		return n;
	}

	@Override
	public double getStoreAverage(String code) {
		
		double n = sqlsession.selectOne("foodie.getStoreAverage", code);
		return n;
	}
	
	
	
	
	
}
