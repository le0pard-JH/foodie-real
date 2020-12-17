package com.spring.foodie.controller;

import java.util.HashMap;
import java.util.Map;

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
import com.spring.foodie.model.LoginHistoryVO;
import com.spring.foodie.model.MemberVO;
import com.spring.foodie.service.InterFoodieService;


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

	@RequestMapping(value = "/signup.food")
	public String signup(HttpServletRequest request, ModelAndView mav) {


		return "/signup/signup";

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
