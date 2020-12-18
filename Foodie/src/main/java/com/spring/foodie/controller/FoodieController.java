package com.spring.foodie.controller;

import java.util.*;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.foodie.common.FileManager;
import com.spring.foodie.common.TempKey;
import com.spring.foodie.model.LoginHistoryVO;
import com.spring.foodie.model.MemberVO;
import com.spring.foodie.service.InterFoodieService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Component
@Controller
public class FoodieController {

	@Autowired
	private InterFoodieService service;

	@Autowired
	private FileManager fileManager;

	@RequestMapping(value = "/index.food")
	public String test_insert(HttpServletRequest request) {



		return "main/index.tiles1";

	}

	// 로그인 폼 페이지 요청 === //
	@RequestMapping(value = "/login.food", method = { RequestMethod.GET })
	public String login(ModelAndView mav) {

		return "/login/login";

	}

	// 로그인 처리하기 === //
	@RequestMapping(value = "/loginEnd.food", method = { RequestMethod.POST })
	public ModelAndView loginEnd(ModelAndView mav, HttpServletRequest request) {

		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("email", email);
		paraMap.put("pwd", pwd);
		
		MemberVO loginuser = service.getLoginMember(paraMap);
		
		
		
		if (loginuser == null) { // 로그인 실패시
			String message = "아이디 또는 암호가 틀립니다.";
			String loc = "javascript:history.back()";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
			// /WEB-INF/views/msg.jsp 파일을 생성한다.
			
			
			return mav;
			
		}
		
		
		
		LoginHistoryVO historyVO=service.getloginHistoryGap(email);
		
		if ( Integer.parseInt(historyVO.getLastlogingap()) >= 12) {
			
			loginuser.setIdle("1");
			String message = "오랫동안 접속하지 않으셔서 아이디가 휴먼처리 되었습니다.";
			String loc = "javascript:history.back()";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
		
			return mav;
			
		}
		
		String clientip = request.getLocalAddr();
		paraMap.put("clientip", clientip);
		service.setLoginHistory(paraMap);
		
		HttpSession session = request.getSession();
		// 메모리에 생성되어져 있는 session을 불러오는 것이다.

		session.setAttribute("loginuser", loginuser);
		// session(세션)에 로그인 되어진 사용자 정보인 loginuser 을 키이름을 "loginuser" 으로 저장시켜두는 것이다.

		String goBackURL = (String) session.getAttribute("goBackURL");

		if (goBackURL != null) {
			mav.setViewName("redirect:/" + goBackURL);
			session.removeAttribute("goBackURL"); // 세션에서 반드시 제거해주어야 한다.
		} else {
			mav.setViewName("redirect:/index.food");
		}

		return mav;
	}
	
	// 카카오로그인 처리하기 === //
	@RequestMapping(value = "/kakaoLogin.food", method = { RequestMethod.POST })
	public ModelAndView kakaoLogin(ModelAndView mav, HttpServletRequest request) {

		String kakaoid = request.getParameter("kakaoid");
		String email = request.getParameter("email");
		String clientip = request.getLocalAddr();
		
		MemberVO loginuser = service.getkakaoLoginMember(kakaoid);

		if (loginuser == null) { // 로그인 실패시
			String message = "해당유저는 카카오 유저가 아니라 일반 회원입니다. 일반로그인으로 접속해주세요.";
			String loc = "javascript:history.back()";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
			
			
			
			return mav;
			
		} 
		
		Map<String, String> paraMap = new HashMap<>();
		
		LoginHistoryVO historyVO=service.getloginHistoryGap(email);
		
		if ( Integer.parseInt(historyVO.getLastlogingap()) >= 12) {
			
			loginuser.setIdle("1");
			String message = "오랫동안 접속하지 않으셔서 아이디가 휴먼처리 되었습니다.";
			String loc = "javascript:history.back()";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
		
			return mav;
			
		}
		
		paraMap.put("clientip", clientip);
		paraMap.put("email", email);
		
		service.setLoginHistory(paraMap);
		
		HttpSession session = request.getSession();
		// 메모리에 생성되어져 있는 session을 불러오는 것이다.

		session.setAttribute("loginuser", loginuser);
		// session(세션)에 로그인 되어진 사용자 정보인 loginuser 을 키이름을 "loginuser" 으로 저장시켜두는 것이다.

		String goBackURL = (String) session.getAttribute("goBackURL");

		if (goBackURL != null) {
			mav.setViewName("redirect:/" + goBackURL);
			session.removeAttribute("goBackURL"); // 세션에서 반드시 제거해주어야 한다.
		} else {
			mav.setViewName("redirect:/index.food");
		}

		return mav;
	}

	// === #50. 로그아웃 처리하기 === //
	@RequestMapping(value = "/logout.food")
	public ModelAndView logout(ModelAndView mav, HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.invalidate();

		String message = "로그아웃 되었습니다.";
		String loc = request.getContextPath() + "/index.food";

		mav.addObject("message", message);
		mav.addObject("loc", loc);
		mav.setViewName("msg");

		return mav;
	}
	
	// === sns 문자보내기  === //
	@RequestMapping(value = "/sendSns.food")
	public ModelAndView sendSns(ModelAndView mav, HttpServletRequest request) throws CoolsmsException {

		
			String api_key = "NCSAB7YSHDFCVJEG"; 
			String api_secret = "UZJM0KAZVB7MKVPXR9SXJS7PGTMCJKEU";  
			Message coolsms = new Message(api_key, api_secret);
			
			String email = request.getParameter("email");
			
			MemberVO member=service.getUserInfo(email);
			
			TempKey temkey = new TempKey();
			String key=temkey.getKey(6, true);
			
			String smsContent = member.getName() + "님의 인증번호 는 "+key+" 입니다.";
			
			
			
			// == 4개 파라미터(to, from, type, text)는 필수사항이다. == 
			HashMap<String, String> paraMap = new HashMap<String, String>();
			paraMap.put("to", member.getMobile()); // 수신번호
			paraMap.put("from", "01095451492"); // 발신번호
			paraMap.put("type", "SMS"); // Message type ( SMS(단문), LMS(장문), MMS, ATA )
			paraMap.put("text", smsContent); // 문자내용    
			paraMap.put("app_version", "JAVA SDK v2.2"); // application name and version
					
			
			
			
			
			// 문자 내용에 임의난수 처리해서 집어넣고 AJAX 처리해서 view 단에서 사용자가 입력한 값과 원래 난수와 비교해서 같으면 
			// 비밀번호 재설정하는 방식으로 처리해야함.
			
			org.json.simple.JSONObject jsobj = (org.json.simple.JSONObject) coolsms.send(paraMap);
			
			/*
			   org.json.JSONObject 이 아니라 
			   org.json.simple.JSONObject 이어야 한다.  
			*/
			
			String json = jsobj.toString();
			
			//	System.out.println("~~~~ 확인용 json => " + json);
			// ~~~~ 확인용 json => {"group_id":"R2GWPBT7UoW308sI","success_count":1,"error_count":0} 
			
			request.setAttribute("json", json);
			mav.addObject("key", key);
			mav.setViewName("jsonview");
			
			return mav;
			
	}
		
	@RequestMapping(value = "/signup.food")
	public ModelAndView signup(HttpServletRequest request, ModelAndView mav) {
		
		
		if(request.getMethod().equals("GET")) {
			
			mav.setViewName("signup/signup");
			
			return mav;
		}
		
		
		else {
			

			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd"); 
			String hp1 = request.getParameter("hp1"); 
			String hp2 = request.getParameter("hp2"); 
			String hp3 = request.getParameter("hp3");
			String mobile = hp1+hp2+hp3;
			
			String kakaoid = request.getParameter("kakaoid");
			
			if(kakaoid.isEmpty() || kakaoid == null) {
				kakaoid = "0";
			}
			
			Map<String, String> paraMap = new HashMap<>();
			
			paraMap.put("email", email);
			paraMap.put("name", name);
			paraMap.put("pwd", pwd);
			paraMap.put("mobile", mobile);
			paraMap.put("kakaoid", kakaoid);
			int n = service.registerMember(paraMap);
			
			String message = "";
			String loc = "";
			
			if(n == 1) {
				message = "회원가입 성공";
				loc = request.getContextPath()+"/index.food"; // 시작페이지로 이동한다. 
	
				
			}
			else {
				message = "회원가입 실패";
				loc = "javascript:history.back()" ; // 자바스크립트를 이용한 이전페이지로 이동하는것.
				
				
			}
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			mav.setViewName("msg");
			return mav;
			
		}
	}
		
		// 카카오로 가입하기
		@RequestMapping(value = "/signupKaKao.food")
		public ModelAndView signupKaKao(HttpServletRequest request, ModelAndView mav) {
			
			String kakaoid=request.getParameter("kakaoid");
			String email=request.getParameter("email");
			String name=request.getParameter("name");
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("kakaoid", kakaoid);
			paraMap.put("email", email);
			paraMap.put("name", name);
			
			mav.addObject("paraMap", paraMap);
			mav.setViewName("signup/signup");
			
			return mav;
			
			
		}
	

	@ResponseBody
	@RequestMapping(value = "/emailDuplicateCheck.food", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String emailDuplicateCheck(HttpServletRequest request, ModelAndView mav) {

		
		String email = request.getParameter("email");
		boolean isExists = false;
		MemberVO mvo = service.emailDuplicateCheck(email);

		if (mvo == null) {

		} else {
			isExists = true;
		}

		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("isExists", isExists);

		return jsonObj.toString();

	}
	
}
