package com.spring.foodie.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.foodie.common.*;
import com.spring.foodie.model.*;

// === #31. Service 선언 ===
// 트랜잭션 처리를 담당하는곳 , 업무를 처리하는 곳, 비지니스(Business)단
@Service
public class FoodieService implements InterFoodieService {

  /*
   * 주문 ==> 주문테이블 insert (DAO 에 있는 주문테이블에 insert 관련 method 호출) ==> 제품테이블에 주문받은 제품의 개수는 주문량 만큼 감소해야
   * 한다 (DAO 에 있는 제품테이블에 update 관련 method 호출) ==> 장바구니에서 주문을 한 경우이라면 장바구니 비우기를 해야 한다 (DAO 에 있는
   * 장바구니테이블에 delete 관련 method 호출) ==> 회원테이블에 포인트(마일리지)를 증가시켜주어야 한다 (DAO 에 있는 회원테이블에 update 관련
   * method 호출)
   * 
   * 위에서 호출된 4가지의 메소드가 모두 성공되었다면 commit 해주고 1개라도 실패하면 rollback 해준다. 이러한 트랜잭션처리를 해주는 곳이 Service 단이다.
   */

	@Override
	public List<SearchVO> getStoreList(String place, String scrollCtrl) {
		List<SearchVO> storeList = dao.getStoreList(place, scrollCtrl);
		return storeList;
	}

	@Override
	public SearchVO getStoreDetail(String code) {
		
		SearchVO svo = dao.getStoreDetail(code);
		
		return svo;
	}

	@Override
	public List<Map<String, String>> moreView(String place, String scrollCtrl) {
		
		List<Map<String,String>> storeList = dao.moreView(place,scrollCtrl);
		
		return storeList;
	}

	
	// === #45. 양방향 암호화 알고리즘인 AES256 를 사용하여 복호화 하기 위한 클래스 의존객체 주입하기(DI: Dependency Injection) ===
	//@Autowired
	// private AES256 aes;
	// Type 에 따라 Spring 컨테이너가 알아서 bean 으로 등록된 com.spring.board.common.AES256 의 bean 을  aes 에 주입시켜준다. 
    // 그러므로 aes 는 null 이 아니다.
	// com.spring.board.common.AES256 의 bean 은 /webapp/WEB-INF/spring/appServlet/servlet-context.xml 파일에서 bean 으로 등록시켜주었음.  
	
	//@Autowired     // Type에 따라 알아서 Bean 을 주입해준다.
	//private FileManager fileManager;
	
	
	
	
  // === #34. 의존객체 주입하기(DI: Dependency Injection) ===
  @Autowired
  private InterFoodieDAO dao;
  // Type 에 따라 Spring 컨테이너가 알아서 bean 으로 등록된 com.spring.model.BoardDAO 의 bean 을 dao 에 주입시켜준다.
  // 그러므로 dao 는 null 이 아니다.


  // === #45. 양방향 암호화 알고리즘인 AES256 를 사용하여 복호화 하기 위한 클래스 의존객체 주입하기(DI: Dependency Injection) ===
  // @Autowired
  // private AES256 aes;
  // Type 에 따라 Spring 컨테이너가 알아서 bean 으로 등록된 com.spring.board.common.AES256 의 bean 을 aes 에 주입시켜준다.
  // 그러므로 aes 는 null 이 아니다.
  // com.spring.board.common.AES256 의 bean 은 /webapp/WEB-INF/spring/appServlet/servlet-context.xml
  // 파일에서 bean 으로 등록시켜주었음.

  // @Autowired // Type에 따라 알아서 Bean 을 주입해준다.
  // private FileManager fileManager;


  // 검색하기
  @Override
  public List<SearchVO> searchList(Map<String, String> paraMap) {

    List<SearchVO> searchList = dao.searchList(paraMap);
    return searchList;
  }

	@Override
	public List<CommentVO> getCommentList(Map<String,String> paraMap) {

		List<CommentVO> commentList = dao.getCommentList(paraMap);
		return commentList;
	}

	@Override
	public int addComment(CommentVO commentvo) {
		int n = dao.addComment(commentvo);
		
		return n;
	}
	
	// === #42. 로그인 처리하기 === // 
    @Override
    public MemberVO getLoginMember(Map<String, String> paraMap) {
       
       MemberVO loginuser = dao.getLoginMember(paraMap);
       
       /*
        * if(loginuser != null && loginuser.getPwdchangegap() >= 3) { // 마지막으로 암호를 변경한
        * 날짜가 현재시각으로 부터 3개월이 지났으면 loginuser.setRequirePwdChange(true); // 로그인시 암호를
        * 변경해라는 alert 를 띄우도록 한다. }
        * 
        * if(loginuser != null && loginuser.getLastlogingap() >= 12 ) { // 마지막으로 로그인 한
        * 날짜시간이 현재시각으로 부터 1년이 지났으면 휴면으로 지정 loginuser.setIdle(1);
        * 
        * // === tbl_member 테이블의 idle 컬럼의 값을 1 로 변경 하기 === // int n =
        * dao.updateIdle(paraMap.get("userid")); }
        */
       
       /*
        * if(loginuser != null) { String email = ""; try { email =
        * aes.decrypt(loginuser.getEmail()); } catch (UnsupportedEncodingException |
        * GeneralSecurityException e) { e.printStackTrace(); }
        * loginuser.setEmail(email); }
        */
       
       return loginuser;
    }
    
    // 카카오로 로그인하기
    @Override
    public MemberVO getkakaoLoginMember(String kakaoid) {
       
       MemberVO loginuser = dao.getkakaoLoginMember(kakaoid);
       return loginuser;
    }
    
    // 로그인 히스토리 저장하기
    @Override
    public void setLoginHistory(Map<String, String> paraMap) {
       
       dao.setLoginHistory(paraMap);
    }

    @Override
    public LoginHistoryVO getloginHistoryGap(String email) {
       
       LoginHistoryVO historyvo = dao.getloginHistoryGap(email);
       return historyvo;
    }

    @Override
    public int registerMember(Map<String, String> paraMap)  {
       
       int n = dao.registerMember(paraMap);
       return n;
    }
    
    
    @Override
    public MemberVO getUserInfo(String email) {
       MemberVO mvo = dao.getUserInfo(email);
       return mvo;
    }

	@Override
	public MemberVO emailDuplicateCheck(String email) {
		
	    MemberVO mvo = dao.emailDuplicateCheck(email);
		
		return mvo;
	}
	
	@Override
	public int likeAdd(Map<String, String> paraMap) {
		
		int n = dao.likeAdd(paraMap);
		return n;
		
	}

	@Override
	public int addCommentCnt(String parentSeq) {
		int n = dao.addCommentCnt(parentSeq);
		return n;
	}

	@Override
	public int likeAddCnt(String seq) {
		int n = dao.likeAddCnt(seq);
		
		return n;
	}

	@Override
	public int delLike(Map<String, String> paraMap) {
		
		int n = dao.delLike(paraMap);
		return n;
	}

	@Override
	public int likeDelCnt(String seq) {
		int n = dao.likeDelCnt(seq);
		return n;
	}

	@Override
	public int duplicateCheckLike(Map<String, String> paraMap) {
		int n = dao.duplicateCheckLike(paraMap);
		return n;
	}

	@Override
	public List<MemberVO> getEmail(Map<String, String> paraMap) {
		
		List<MemberVO> mvolist = dao.getEmail(paraMap);
		return mvolist;
	}

	@Override
	public int searchPwd(Map<String, String> paraMap) {
		int n = dao.searchPwd(paraMap);
		return n;
	}

	@Override
	public int modifyPw(Map<String, String> paraMap) {
		
		int n = dao.modifyPw(paraMap);
		return n;
	}

	@Override
	public int duplicateCheckStoreLike(Map<String, String> paraMap) {
		int n = dao.duplicateCheckStoreLike(paraMap);		
		return n;
	}

	@Override
	public int storelike(Map<String, String> paraMap) {
		int n = dao.storelike(paraMap);
		
		return n;
	}

	@Override
	public int delstorelike(Map<String, String> paraMap) {
		int n = dao.delstorelike(paraMap);
		return n;
	}
	
	
	@Override
	public int getCommentCnt(String code) {

		int n  = dao.getCommentCnt(code);
		return n;
	}

	@Override
	public int getPointCnt(Map<String, String> paraMap) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getOnePointCnt(String code) {
		
		int n = dao.getOnePointCnt(code);
		return n;
	}

	@Override
	public int getTwoPointCnt(String code) {
		int n = dao.getTwoPointCnt(code);
		return n;
	}

	@Override
	public int getThreePointCnt(String code) {
		int n = dao.getThreePointCnt(code);
		return n;
	}

	@Override
	public int getFourPointCnt(String code) {
		int n = dao.getFourPointCnt(code);
		return n;
	}
	
	@Override
	public int getFivePointCnt(String code) {
		int n = dao.getFivePointCnt(code);
		return n;
	}

	@Override
	public double getStoreAverage(String code) {
		
		double n = dao.getStoreAverage(code);
		return n;
	}



	

}
