package com.spring.foodie.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.foodie.common.*;
import com.spring.foodie.model.*;

//=== #31. Service 선언 === 
//트랜잭션 처리를 담당하는곳 , 업무를 처리하는 곳, 비지니스(Business)단

@Service
public class FoodieService implements InterFoodieService {


	
	// === #34. 의존객체 주입하기(DI: Dependency Injection) ===
	@Autowired
	private InterFoodieDAO dao;
	// Type 에 따라 Spring 컨테이너가 알아서 bean 으로 등록된 com.spring.model.BoardDAO 의 bean 을  dao 에 주입시켜준다. 
    // 그러므로 dao 는 null 이 아니다.

	@Override
	public MemberVO emailDuplicateCheck(String email) {
		
		MemberVO mvo=dao.emailDuplicateCheck(email);
		 
		return mvo;
		
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

		@Override
		public MemberVO getkakaoLoginMember(String kakaoid) {
			
			MemberVO loginuser = dao.getkakaoLoginMember(kakaoid);
			return loginuser;
		}
	
	
	
	
}
