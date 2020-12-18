package com.spring.foodie.model;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

//=== #32. DAO 선언 ===
@Repository
public class FoodieDAO implements InterFoodieDAO {

	// === #33. 의존객체 주입하기(DI: Dependency Injection) ===
	// >>> 의존 객체 자동 주입(Automatic Dependency Injection)은
	// 스프링 컨테이너가 자동적으로 의존 대상 객체를 찾아서 해당 객체에 필요한 의존객체를 주입하는 것을 말한다.
	// 단, 의존객체는 스프링 컨테이너속에 bean 으로 등록되어 있어야 한다.

	// 의존 객체 자동 주입(Automatic Dependency Injection)방법 3가지
	// 1. @Autowired ==> Spring Framework에서 지원하는 어노테이션이다.
	// 스프링 컨테이너에 담겨진 의존객체를 주입할때 타입을 찾아서 연결(의존객체주입)한다.

	// 2. @Resource ==> Java 에서 지원하는 어노테이션이다.
	// 스프링 컨테이너에 담겨진 의존객체를 주입할때 필드명(이름)을 찾아서 연결(의존객체주입)한다.

	// 3. @Inject ==> Java 에서 지원하는 어노테이션이다.
	// 스프링 컨테이너에 담겨진 의존객체를 주입할때 타입을 찾아서 연결(의존객체주입)한다.

	/*
	 * @Autowired private SqlSessionTemplate abc;
	 */
	// Type 에 따라 Spring 컨테이너가 알아서 root-context.xml 에 생성된
	// org.mybatis.spring.SqlSessionTemplate 의 bean 을 abc 에 주입시켜준다.
	// 그러므로 abc 는 null 이 아니다.

	@Resource
	private SqlSessionTemplate sqlsession; // 로컬DB에 연결
	// Type 에 따라 Spring 컨테이너가 알아서 root-context.xml 에 생성된
	// org.mybatis.spring.SqlSessionTemplate 의 bean 을 abc 에 주입시켜준다.
	// 그러므로 sqlsession 는 null 이 아니다.

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


}
