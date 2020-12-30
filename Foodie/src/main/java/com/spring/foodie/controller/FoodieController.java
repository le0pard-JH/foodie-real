package com.spring.foodie.controller;

import java.util.*;
import javax.servlet.http.*;
import org.json.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import com.spring.foodie.common.*;
import com.spring.foodie.model.*;
import com.spring.foodie.service.*;

//=== #30. 컨트롤러 선언 === 
@Component
@Controller
public class FoodieController {

	@Autowired     
	private InterFoodieService service;
	
	//@Autowired     
	//private FileManager fileManager;
	
	
	
	@RequestMapping(value="/index.food")
	public String test_insert(HttpServletRequest request) {
		
		String message = "";
		
		request.setAttribute("message", message);
		
		return "main/index.tiles1";
	
	}
	
	
	// 검색
	
	@RequestMapping(value="/list.food")
	public ModelAndView list(HttpServletRequest request, ModelAndView mav) {
		
		// 글이 여러개 나올 수 있으니 리턴은 list로 주고 초기값 null은 글이 한개도 없을 수 있기 떄문이다.
		//List<SearchVO> searchList = null; 
		
	
		//String searchType  = request.getParameter("searchType"); //폼태그에서 넘어온것
		//String searchType2 = request.getParameter("searchType2"); //폼태그에서 넘어온것
		String searchWord  = request.getParameter("searchWord"); //폼태그에서 넘어온것
		
		System.out.println("입력한 검색어 : " + searchWord);
		
		
		//if(searchWord == null) {
			//searchWord = "";
			//String message = "검색어를 입력하세요.";
			//String loc ="javascript:history.back()";
			
			//mav.addObject("message", message);
			//mav.addObject("loc", loc);
			//mav.setViewName("msg");
			
		//}
		
		//if(searchType == null) {
		//	searchType = "";
		//}
		
		//if(searchType2 == null) {
		//	searchType2 = "";
		//}
		
		Map<String,String> paraMap = new HashMap<>();
	//	paraMap.put("searchType", searchType);
		//paraMap.put("searchType2", searchType2);
		paraMap.put("searchWord", searchWord);	
		
		  // *** === 검색어가 있을때만 검색어도 같이 넘겨준다. 없을면 공백이 넘어가버리므로 === *** //
	      if(!"".equals(searchWord)) {
	      mav.addObject("paraMap", paraMap); //검색을 했을때만 맵을 뷰단으로 보내버린다.
	      }
	      
	      //searchList = service.searchList(paraMap);
	      
	     // mav.addObject("searchList", searchList);
		  mav.setViewName("main/list.tiles1");
		  
		  
		  return mav;
		
		
	}

	// === 동휘 === //
	
	
	// index.food에서 넘겨받은 지역명을 분리하여 해당 위치만 검색리스트에 추가시켜주는 메서드
		@RequestMapping(value = "/storeBoard/storeMain.food")
		public ModelAndView viewMainBoard(ModelAndView mav, HttpServletRequest request) {
			
			String hotPlace = request.getParameter("hotPlace");
			// ex> 신논현역 맛집 베스트
			
			String hotPlaceInfo = request.getParameter("hotPlaceInfo");
			// ex> 신논현의 맛집 모음
			
			// 스크롤 이벤트를 위한 스크롤 컨트롤러를 설정
			String scrollCtrl = request.getParameter("scrollCtrl");
			
			String target = " ";
			
			// 첫번째 공백을 기준으로 위치를 알아내기
			String Place = hotPlace.substring(0, hotPlace.indexOf(target));
			// 신논현역 맛집 베스트 ==> 신논현역
			
			// 입력받은 위치값과 스크롤 컨트롤러를 전송하여 20개의 가게집을 받아옴
			// List<SearchVO> storeList = service.getStoreList(Place,scrollCtrl);
			
			// 맛집리스트, 위치정보, 위치상세정보, 스크롤 컨트롤러 전송
			mav.addObject("hotPlace", hotPlace);
			mav.addObject("hotPlaceInfo", hotPlaceInfo);
			mav.addObject("Place", Place);
			mav.addObject("scrollCtrl", scrollCtrl);
			
			mav.setViewName("storeBoard/storeMain.tiles1");
			
			return mav;
		}
		
		
		/*
		// index.food에서 넘겨받은 지역명을 분리하여 해당 위치만 검색리스트에 추가시켜주는 메서드
		@ResponseBody
		@RequestMapping(value = "/storeBoard/storeMainGetImage.food") // , produces="text/plain;charset=UTF-8")
		public String storeMainGetImage(HttpServletRequest request) {
			
			String codes = request.getParameter("codes");
			
			String[] codeArr = codes.split(",");
			
			JSONArray jarr = new JSONArray();
			
			for (int i = 0; i < codeArr.length; i++) {
				String storeInfo = getJsonBoardImage(codeArr[i]);
				JSONObject jobj = new JSONObject();
				jobj.put("storeInfo", storeInfo);
				
				jarr.put(jobj);
			}		
			String json = jarr.toString();
			
			System.out.println(json);
			
			return json;
		}
		
		*/
		
		/*
		// 스크롤 이벤트가 발생하는 메서드
		@ResponseBody
		@RequestMapping(value = "/storeBoard/moreView.food", produces = "text/plain;charset=UTF-8")
		public String moreView(HttpServletRequest request) {
			
			String hotPlace = request.getParameter("hotPlace");
			String scrollCtrl = request.getParameter("nscrollCtrl");
			
			String target = " ";
			
			String Place = hotPlace.substring(0, hotPlace.indexOf(target));
			
			List<Map<String, String>> storeList = service.moreView(Place, scrollCtrl);
			
			JSONArray jsonArr = new JSONArray();
			
			for (Map<String, String> svo : storeList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("RNO", svo.get("RNO"));
				jsonObj.put("NAME", svo.get("NAME"));
				jsonObj.put("CALL", svo.get("CALL"));
				jsonObj.put("ADDRESS", svo.get("ADDRESS"));
				jsonObj.put("CODE", svo.get("CODE"));
				
				jsonArr.put(jsonObj);
			}
			
			String json = jsonArr.toString();
			
			System.out.println(json);
			
			return json;
		}
	
	*/
		
	
	
	
	
	
	// === 지훈 === //
	
	
		@RequestMapping(value = "/storeBoard/storeDetail.food", method = { RequestMethod.GET })
		public ModelAndView viewDetailBoard(ModelAndView mav, HttpServletRequest request) {
			
			String code = request.getParameter("code"); // 가게코드
			
			mav.setViewName("storeBoard/storeDetail.tiles1");
			
			return mav;
		}
	
	
	
	
	
	
	
	// 지도 - 해당 위치 보여주기
	  @RequestMapping(value = "/map/locate.food")
	  public ModelAndView map_locate(HttpServletRequest request, ModelAndView mav) {
	    mav.setViewName("main/map_locate.tiles1");
	    return mav;
	  }

	  // 지도 - 검색
	  @RequestMapping(value = "/map/search.food")
	  public ModelAndView map_search(HttpServletRequest request, ModelAndView mav) {
	    mav.setViewName("main/map_search.tiles1");
	    return mav;
	  }

	  // 지도 - 미니맵
	  @RequestMapping(value = "/map/mini.food")
	  public ModelAndView map_mini(HttpServletRequest request, ModelAndView mav) {
	    mav.setViewName("main/map_mini.tiles1");
	    return mav;
	  }
	
	// JSON Print
	  @CrossOrigin
	  @RequestMapping(value = "/map/data.food")
	  public ModelAndView map_data(HttpServletRequest request, ModelAndView mav) {
	    mav.setViewName("main/map_list.tiles1");
	    return mav;
	  }
/*
	// JSON Print
	  @CrossOrigin
	  @ResponseBody
	  @RequestMapping(value = "/get/json.food", produces = "text/plain;charset=UTF-8")
	  public String getJson(HttpServletRequest request) {

	    String kakao_store_id = request.getParameter("kakao_store_id");
	    System.out.println("kakao_store_id : " + kakao_store_id);

	    String kakao = "https://place.map.kakao.com/main/v/";
	    String id = kakao_store_id;
	    String myURL = kakao + id;

	    Object json = JsonReader.callURL(myURL);
	    System.out.println("controller json : " + json);

	    return json.toString();
	  }
	*/
	  
	// JSON Print
		@CrossOrigin
		@ResponseBody
		@RequestMapping(value = "/get/json.food", produces = "text/plain;charset=UTF-8")
		public String getJson() {
			String kakao = "https://place.map.kakao.com/main/v/";
			String myURL = kakao + "290249009";
			
			// 실제로 json 정보를 가져오는 카카오의 컨트롤러  https://place.map.kakao.com/main/v/store_id;
			// 그냥 가져와서 그 url 뿌려주고  처리를해준 값을 가져온것.
			
			Object json = JsonReader.callURL(myURL);
			System.out.println("controller json : " + json);
			
			return json.toString();
		}
	  /*
	// JSON Print
		  @CrossOrigin
		  @ResponseBody
		  @RequestMapping(value = "/get/jsonSearch.food", produces = "text/plain;charset=UTF-8")
		  public String jsonSearch(HttpServletRequest request) {

		    String kakao_store_id = request.getParameter("kakao_store_id");
		    System.out.println("kakao_store_id : " + kakao_store_id);

		    String kakao = "https://place.map.kakao.com/main/v/";
		    String id = kakao_store_id;
		    String myURL = kakao + id;

		    Object json = JsonReader.callURL(myURL);
		    System.out.println("controller json : " + json);

		    return json.toString();
		  }
		*/  
		  
		// === #84. 댓글쓰기(Ajax 로 처리) === // 
			@ResponseBody
			@RequestMapping(value="/addComment.food", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
			public String addComment(HttpServletRequest request, CommentVO commentvo) {
				
				 
				HttpSession session=request.getSession();
				
				MemberVO loginuser= (MemberVO) session.getAttribute("loginuser");
				
				
				String email=loginuser.getEmail();
				String code=request.getParameter("code");
				String name=request.getParameter("name");
				String spoint=request.getParameter("spoint");
				String content=request.getParameter("content");
				
				
				
				System.out.println(email);
				System.out.println(code);
				System.out.println(name);
				System.out.println(spoint);
				System.out.println(content);
				
				
				commentvo.setStore_id(code);
				commentvo.setContent(content);
				commentvo.setFk_email(email);
				commentvo.setName(name);
				commentvo.setSpoint(spoint);
				commentvo.setParentSeq("0");
				
				
				
				int n = 0;
				
					try {
						n = service.addComment(commentvo);
					} catch (Throwable e) {
						
					}
					
				if(n == 1) {
					
					System.out.println("댓글 성공");
					
				} else {
					System.out.println("댓글 실패");
				}
				 
						
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("n", n);
				
				return jsonObj.toString();
			}
			
			
			// === #84. 대댓글쓰기(Ajax 로 처리) === // 
			@ResponseBody
			@RequestMapping(value="/addReply.food", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
			public String addReply(HttpServletRequest request, CommentVO commentvo) {
				
				 
				HttpSession session=request.getSession();
				
				MemberVO loginuser= (MemberVO) session.getAttribute("loginuser");
				
				
				String email=loginuser.getEmail();
				String code=request.getParameter("code");
				String name=loginuser.getName();
				String content=request.getParameter("content");
				String parentSeq=request.getParameter("parentSeq");
				String depthno = request.getParameter("depthno");
				String groupno = request.getParameter("groupno");
				
				System.out.println(email);
				System.out.println(code);
				System.out.println(name);
				System.out.println(content);
				System.out.println(parentSeq);
				
				
				commentvo.setFk_email(email);
				commentvo.setStore_id(code);
				commentvo.setName(name);
				commentvo.setContent(content);
				commentvo.setParentSeq(parentSeq);
				commentvo.setDepthno(depthno);
				commentvo.setGroupno(groupno);
				
				int n = 0;
				
					try {
						n = service.addComment(commentvo);
					} catch (Throwable e) {
						
					}
					
				if(n == 1) {
					service.addCommentCnt(parentSeq);
					System.out.println("댓글 성공");
					
				} else {
					System.out.println("댓글 실패");
				}
				 
						
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("n", n);
				
				return jsonObj.toString();
			}
			

			
			// === #90. 원게시물에 딸린 댓글들을 조회해오기(Ajax 로 처리) === // 
			@ResponseBody
			@RequestMapping(value="/readComment.food", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
			public String readComment(HttpServletRequest request) {
				
				String code = request.getParameter("code");
				
				
				List<CommentVO> commentList = service.getCommentList(code); 
				System.out.println(commentList.size());
				JSONArray jsonArr = new JSONArray(); 
				
				if(commentList != null) {
					for(CommentVO cmtvo : commentList) {
						JSONObject jsonObj = new JSONObject();
						jsonObj.put("code", code);
						jsonObj.put("seq", cmtvo.getSeq());
						jsonObj.put("likecnt", cmtvo.getLikecnt());
						jsonObj.put("commentcnt", cmtvo.getCntcomments());
						jsonObj.put("content", cmtvo.getContent());
						jsonObj.put("name", cmtvo.getName());
						jsonObj.put("regDate", cmtvo.getRegDate());
						jsonObj.put("spoint", cmtvo.getSpoint());
						jsonObj.put("depthno", cmtvo.getDepthno());
						jsonObj.put("groupno", cmtvo.getGroupno());
						
						jsonArr.put(jsonObj);
					}
				}
				
				return jsonArr.toString();
			}
			
			// === #84. 좋아요 수 증가(Ajax 처리) === // 
			@ResponseBody
			@RequestMapping(value="/likeAdd.food", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
			public String likeAdd(HttpServletRequest request, CommentVO commentvo) {
				
				 
				HttpSession session=request.getSession();
				
				String seq = request.getParameter("seq");
				String email = request.getParameter("email");
				
				// 가게 id, 댓글 no 수에 넣어주어야 함.
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("seq", seq);
				paraMap.put("email", email);
				
				
				
				int n = 0;
				

					
					try {
						n=service.likeAdd(paraMap);
					} catch (Throwable e) {
						
					}
					
				if(n == 1) {
					
					service.likeAddCnt(seq);
					
					
					
				} else {
					
				}
				 
						
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("n", n);
				
				return jsonObj.toString();
			}
			
			// === #84. 좋아요 수 감소(Ajax 처리) === // 
			@ResponseBody
			@RequestMapping(value="/delLikeCnt.food", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
			public String delLikeCnt(HttpServletRequest request, CommentVO commentvo) {
				
				
				String seq = request.getParameter("seq");
				String email = request.getParameter("email");
				
				// 가게 id, 댓글 no 수에 넣어주어야 함.
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("seq", seq);
				paraMap.put("email", email);
				
				
				
				int n = 0;
				

					
					try {
						n=service.delLike(paraMap);
					} catch (Throwable e) {
						
					}
					
				if(n == 1) {
					
					service.likeDelCnt(seq);
					
					
					
				} else {
					
				}
				 
						
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("n", n);
				
				return jsonObj.toString();
			}
			
			// === 좋아요 중복검사하기 === // 
			@ResponseBody
			@RequestMapping(value="/duplicateCheckLike.food", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
			public String duplicateCheckLike(HttpServletRequest request, CommentVO commentvo) {
				
				
				String seq = request.getParameter("seq");
				String email = request.getParameter("email");
				
				// 가게 id, 댓글 no 수에 넣어주어야 함.
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("seq", seq);
				paraMap.put("email", email);
				
				
				
				int n = 0;
				

					
					try {
						n=service.duplicateCheckLike(paraMap);
					} catch (Throwable e) {
						
					}
					

						
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("n", n);
				
				return jsonObj.toString();
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
			   /*
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
			         
			         
			          //  org.json.JSONObject 이 아니라 
			          //  org.json.simple.JSONObject 이어야 한다.  
			         
			         
			         String json = jsobj.toString();
			         
			         //   System.out.println("~~~~ 확인용 json => " + json);
			         // ~~~~ 확인용 json => {"group_id":"R2GWPBT7UoW308sI","success_count":1,"error_count":0} 
			         
			         request.setAttribute("json", json);
			         mav.addObject("key", key);
			         mav.setViewName("jsonview");
			         
			         return mav;
			         
			   }
			      
*/

			   
			   
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