package com.spring.foodie.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hpsf.Array;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.foodie.model.*;
import com.spring.foodie.model.BoardVO;
import com.spring.foodie.model.CommentVO;
import com.spring.foodie.model.MemberVO;
import com.spring.foodie.common.MyUtil;
import com.spring.foodie.common.*;
import com.spring.foodie.service.*;

// === #30. 컨트롤러 선언 ===
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
		
		Place = Place + "맛집";
		
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
	
	// index.food에서 넘겨받은 지역명을 분리하여 해당 위치만 검색리스트에 추가시켜주는 메서드
	@ResponseBody
	@RequestMapping(value = "/storeBoard/storeMainGetImage.food") 
	public String storeMainGetImage(HttpServletRequest request) {
		
		// 검색된 리스트의 가게코드를 받아옴 (배열)
		String codes = request.getParameter("codes");
		
		// 배열나누기
		String[] codeArr = codes.split(",");
		
		List<String> storeArr = new ArrayList<String>();
		
		for (int i = 0; i < codeArr.length; i++) {
			String storeInfo = getJsonBoardImage(codeArr[i]);
			
			storeArr.add(storeInfo);
		}		
		
		String json = storeArr.toString();
		
		return json;
	}
	
	// 스크롤 이벤트가 발생하는 메서드
	@ResponseBody
	@RequestMapping(value = "/storeBoard/moreView.food", produces = "text/plain;charset=UTF-8")
	public String moreView(HttpServletRequest request) {
		
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
		
		Place = Place + "맛집";
		// 입력받은 위치값과 스크롤 컨트롤러를 전송하여 20개의 가게집을 받아옴
		// List<SearchVO> storeList = service.getStoreList(Place,scrollCtrl);
		
		JSONObject jobj = new JSONObject();
		
		jobj.put("Place", Place);
		jobj.put("scrollCtrl", scrollCtrl);
		
		String json = jobj.toString();
		
		return json;
	}
	
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
	
	// JSON Print
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/get/json.food", produces = "text/plain;charset=UTF-8")
	public String getJson(HttpServletRequest request) {
		String kakao = "https://place.map.kakao.com/main/v/";
		String id = request.getParameter("code");
		String myURL = kakao + id;
		
		Object json = JsonReader.callURL(myURL);
		
		return json.toString();
	}
	
	@CrossOrigin
	public String getJsonBoardImage(String code) {
		String kakao = "https://place.map.kakao.com/main/v/";
		String id = code;
		String myURL = kakao + id;
		
		Object json = JsonReader.callURL(myURL);
		
		return json.toString();
	}
	
	// === #108. 검색어 입력시 자동글 완성하기 3 === // 
	@ResponseBody
	@RequestMapping(value="/wordSearchShow.food", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8") 
	public String wordSearchShow(HttpServletRequest request) {
		
		String searchTypes = request.getParameter("searchTypes");
		String searchWords = request.getParameter("searchWords");
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchTypes);
		paraMap.put("searchWord", searchWords);
		
		List<String> wordList = service.wordSearchShow(paraMap);
		
		JSONArray jsonArr = new JSONArray();  // []
		
		if(wordList != null) {
			for(String word : wordList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("word", word);
				
				jsonArr.put(jsonObj);
			}
		}
		
		return jsonArr.toString();
	}
	
	@RequestMapping(value="/storeBoard/userBoardMain.food")
	public ModelAndView userBoardMain(HttpServletRequest request, ModelAndView mav) {
		
		List<BoardVO> boardList = null;
		String searchType = request.getParameter("searchTypes");
		String searchWord = request.getParameter("searchWords");
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(searchType == null ) {
			searchType = "";
		}
		
		if(searchWord == null || searchWord.trim().isEmpty() ) {
			searchWord = "";
		}
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		
		int totalCount = 0;         
		int sizePerPage = 10;        
		int currentShowPageNo = 0;  
		int totalPage = 0;  
		int startRno = 0;
		int endRno = 0;
		
		totalCount = service.getTotalCount(paraMap);
		totalPage = (int) Math.ceil((double)totalCount/sizePerPage);  
		
		if(str_currentShowPageNo == null) {
			currentShowPageNo = 1;
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
			} catch(NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = ((currentShowPageNo - 1 ) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1; 
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		boardList = service.boardListSearchWithPaging(paraMap);
		// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)
		
		if(!"".equals(searchWord)) {
			mav.addObject("paraMap", paraMap);
		}
		
		String pageBar = "<ul style='list-style: none;'>";
		
		int blockSize = 10;
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
		
		String url = request.getContextPath()+"/storeBoard/userBoardMain.food";
		
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo=1'>[맨처음]</a></li>";
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
		}
		
		while( !(loop > blockSize || pageNo > totalPage) ) {
			
			if(pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color:red; padding:2px 4px;'>"+pageNo+"</li>";
			}
			else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
			}
			
			loop++;
			pageNo++;
			
		}// end of while------------------------------
		
		if( !(pageNo > totalPage) ) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+totalPage+"'>[마지막]</a></li>";
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);
		
		String gobackURL = MyUtil.getCurrentURL(request);
		
		mav.addObject("gobackURL", gobackURL);
		
		HttpSession session = request.getSession();
		session.setAttribute("readCountPermission", "yes");
		mav.addObject("boardList",boardList);
		mav.setViewName("storeBoard/userBoardMain.tiles1");
		
		return mav;
	}
	
	@RequestMapping(value="/view.food")
	public ModelAndView view(HttpServletRequest request, ModelAndView mav) {
		
		String seq = request.getParameter("seq");
		String gobackURL = request.getParameter("gobackURL"); 
		
		if(gobackURL != null) {
			gobackURL = gobackURL.replaceAll(" ", "&"); 
			mav.addObject("gobackURL", gobackURL);
		}
		
		try {
			Integer.parseInt(seq);
			
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			String login_userid = null;
			
			if(loginuser != null) {
				login_userid = loginuser.getEmail();
			}
			BoardVO boardvo = null;
			
			if( "yes".equals(session.getAttribute("readCountPermission")) ) {
				boardvo = service.getView(seq, login_userid);
				
				session.removeAttribute("readCountPermission");
			}
			else {
				boardvo = service.getViewWithNoAddCount(seq);
			}
			
			mav.addObject("boardvo", boardvo);
			
		} catch(NumberFormatException e) {
			
		}
		
		mav.setViewName("storeBoard/view.tiles1");
		return mav;
	}
	
	
	// === #71. 글수정 페이지 요청 === // 
	@RequestMapping(value="/edit.food")
	public ModelAndView requiredLogin_edit(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		// 글 수정해야 할 글번호 가져오기
		String seq = request.getParameter("seq");
		
		// 글 수정해야할 글1개 내용 가져오기
		BoardVO boardvo = service.getViewWithNoAddCount(seq);
		// 글조회수(readCount) 증가 없이 단순히 글1개만 조회 해주는 것이다.
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if( loginuser == null ) {
			String message = "로그인 후 이용가능한 기능입니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			mav.setViewName("msg");
		}
		
		if( !loginuser.getEmail().equals(boardvo.getFk_userid()) ) {
			String message = "다른 사용자의 글은 수정이 불가합니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			mav.setViewName("msg");
		}
		else {
			// 자신의 글을 수정할 경우
			// 가져온 1개글을 글수정할 폼이 있는 view 단으로 보내준다.
			mav.addObject("boardvo", boardvo);
			mav.setViewName("storeBoard/edit.tiles1");
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="/editEnd.food", method= {RequestMethod.POST})
	public ModelAndView editEnd(BoardVO boardvo, HttpServletRequest request, ModelAndView mav) {
		
		int n = service.edit(boardvo); 
		
		if(n == 0) {
			mav.addObject("message", "암호가 일치하지 않아 글 수정이 불가합니다.");
		}
		else {
			mav.addObject("message", "글수정 성공!!");
		}
		
		mav.addObject("loc", request.getContextPath()+"/view.food?seq="+boardvo.getSeq());    
		mav.setViewName("msg");
		
		return mav;
	}
	
	
	@RequestMapping(value="/del.food")
	public ModelAndView requiredLogin_del(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		String seq = request.getParameter("seq");
		
		BoardVO boardvo = service.getViewWithNoAddCount(seq);
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if( !loginuser.getEmail().equals(boardvo.getFk_userid()) ) {
			String message = "다른 사용자의 글은 삭제가 불가합니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			mav.setViewName("msg");
		}
		else {
			mav.addObject("seq", seq);
			mav.setViewName("storeBoard/del.tiles1");
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="/delEnd.food", method= {RequestMethod.POST})
	public ModelAndView delEnd(HttpServletRequest request, ModelAndView mav) {
		
		String seq = request.getParameter("seq");
		String pw = request.getParameter("pw");
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("seq", seq);
		paraMap.put("pw", pw);
		
		BoardVO boardvo = service.getViewWithNoAddCount(seq);
		String fileName = boardvo.getFileName();
		
		if( fileName != null || !"".equals(fileName) ) {
			paraMap.put("fileName", fileName); // 삭제해야할 파일명
			
			HttpSession session = request.getSession();
			String root = session.getServletContext().getRealPath("/");
			String path = root+"resources"+ File.separator +"files"; 
			
			paraMap.put("path", path); // 삭제해야할 파일이 저장된 경로
		}
		//////////////////////////////////////////////////////////////////////
		
		int n = service.del(paraMap); 
		
		if(n == 0) {
			mav.addObject("message", "암호가 일치하지 않아 글 삭제가 불가합니다.");
			mav.addObject("loc", request.getContextPath()+"/view.food?seq="+seq+"&gobackURL=userBoardMain.food");
		}
		else {
			mav.addObject("message", "글삭제 성공!!");
			mav.addObject("loc", request.getContextPath()+"/userBoardMain.food");
		}
		
		mav.setViewName("msg");
		
		return mav;
	}	
	
	@RequestMapping(value="/add.food")
	public ModelAndView requiredLogin_add(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		String fk_seq = request.getParameter("fk_seq");
		String groupno = request.getParameter("groupno");
		String depthno = request.getParameter("depthno");
		
		mav.addObject("fk_seq", fk_seq);
		mav.addObject("groupno", groupno);
		mav.addObject("depthno", depthno);
		
		mav.setViewName("storeBoard/add.tiles1");
		return mav;
	}
	
	// === #84. 댓글쓰기(Ajax 로 처리) === // 
	@ResponseBody
	@RequestMapping(value="/addComment.food", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String addComment(CommentVO commentvo) {
		
		int n = 0;
		
		try {
			n = service.addComment(commentvo);
		} catch (Throwable e) {
			
		} 
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("n", n);
		jsonObj.put("name", commentvo.getName());
		
		return jsonObj.toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/commentList.food", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
	public String commentList(HttpServletRequest request) {
		
		String parentSeq = request.getParameter("parentSeq");
		String currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(currentShowPageNo == null) {
			currentShowPageNo = "1";
		}
		
		int sizePerPage = 5; // 한 페이지당 5개의 댓글을 보여줄 것임.
		int startRno = (( Integer.parseInt(currentShowPageNo) - 1 ) * sizePerPage) + 1;
		int endRno = startRno + sizePerPage - 1; 
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("parentSeq", parentSeq);
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		List<CommentVO> commentList = service.getCommentListPaging(paraMap); 
		
		JSONArray jsonArr = new JSONArray();  // []
		
		if(commentList != null) {
			for(CommentVO cmtvo : commentList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("content", cmtvo.getContent());
				jsonObj.put("name", cmtvo.getName());
				jsonObj.put("regDate", cmtvo.getRegDate());
				
				jsonArr.put(jsonObj);
			}
		}
		
		return jsonArr.toString();
	}
	
	// === #132. 원게시물에 딸린 댓글 totalPage 알아오기 (Ajax 로 처리) === //
	@ResponseBody
	@RequestMapping(value="/getCommentTotalPage.food", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8") 
	public String getCommentTotalPage(HttpServletRequest request) {
		
		String parentSeq = request.getParameter("parentSeq");
		String sizePerPage = request.getParameter("sizePerPage");
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("parentSeq", parentSeq);
		
		// 원글 글번호(parentSeq)에 해당하는 댓글의 총개수를 알아오기 
		int totalCount = service.getCommentTotalCount(paraMap);
		
		// === 총페이지수(totalPage)구하기 === 
		// 만약에 총 게시물 건수(totalCount)가 14개 이라면 
		// 총 페이지수(totalPage)는 3개가 되어야 한다.
		int totalPage = (int) Math.ceil((double)totalCount/Integer.parseInt(sizePerPage)); 
		// (double)14/5 ==> 2.8 ==> Math.ceil(2.8) ==> 3.0 ==> (int)3.0 ==> 3  
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("totalPage", totalPage);  // {"totalPage":3}
		
		return jsonObj.toString();
	}
	
	
	// === #163. 첨부파일 다운로드 받기 === //
	@RequestMapping(value="/download.food") 
	public void requiredLogin_download(HttpServletRequest request, HttpServletResponse response) {
		
		String seq = request.getParameter("seq");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = null;
		
		try {
			Integer.parseInt(seq);
			
			BoardVO boardvo = service.getViewWithNoAddCount(seq);
			String fileName = boardvo.getFileName();  
			String orgFilename = boardvo.getOrgFilename(); 
			
			HttpSession session = request.getSession();
			String root = session.getServletContext().getRealPath("/");
			
			System.out.println("~~~~ webapp 의 절대경로 => " + root);
			
			String path = root+"resources"+ File.separator +"files";
			
			boolean flag = false; // file 다운로드의 성공,실패를 알려주는 용도 
			flag = fileManager.doFileDownload(fileName, orgFilename, path, response);
			
			if(!flag) {
				try {
					writer = response.getWriter();
					
					writer.println("<script type='text/javascript'>alert('파일 다운로드가 불가합니다!!'); history.back();</script>"); 
				} catch (IOException e) { }
			}
			
		} catch(NumberFormatException e) {
			try {
				writer = response.getWriter();
				writer.println("<script type='text/javascript'>alert('파일 다운로드가 불가합니다!!'); history.back();</script>");     
			} catch (IOException e1) {
				
			}
		}
		
	}
	
	
	// ==== #168. 스마트에디터. 드래그앤드롭을 사용한 다중사진 파일업로드 ====
	@RequestMapping(value="/image/multiplePhotoUpload.food", method={RequestMethod.POST})
	public void multiplePhotoUpload(HttpServletRequest req, HttpServletResponse res) {
		
		HttpSession session = req.getSession();
		String root = session.getServletContext().getRealPath("/"); 
		String path = root + "resources"+File.separator+"photo_upload";
		File dir = new File(path);
		if(!dir.exists())
			dir.mkdirs();
		
		String strURL = "";
		
		try {
			if(!"OPTIONS".equals(req.getMethod().toUpperCase())) {
				String filename = req.getHeader("file-name"); //파일명을 받는다 - 일반 원본파일명
				InputStream is = req.getInputStream();
				String newFilename = fileManager.doFileUpload(is, filename, path);
				
				int width = fileManager.getImageWidth(path+File.separator+newFilename);
				
				if(width > 600)
					width = 600;
				String CP = req.getContextPath(); // board
				
				strURL += "&bNewLine=true&sFileName="; 
				strURL += newFilename;
				strURL += "&sWidth="+width;
				strURL += "&sFileURL="+CP+"/resources/photo_upload/"+newFilename;
			}
			
			/// 웹브라우저상에 사진 이미지를 쓰기 ///
			PrintWriter out = res.getWriter();
			out.print(strURL);
			
		} catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	// === #90. 원게시물에 딸린 댓글들을 조회해오기(Ajax 로 처리) === // 
	@ResponseBody
	@RequestMapping(value="/readComment.food", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
	public String readComment(HttpServletRequest request) {
		
		String parentSeq = request.getParameter("parentSeq");
		
		List<CommentVO> commentList = service.getCommentList(parentSeq); 
		
		JSONArray jsonArr = new JSONArray();  // []
		
		if(commentList != null) {
			for(CommentVO cmtvo : commentList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("content", cmtvo.getContent());
				jsonObj.put("name", cmtvo.getName());
				jsonObj.put("regDate", cmtvo.getRegDate());
				
				jsonArr.put(jsonObj);
			}
		}
		
		return jsonArr.toString();
	}
	
}



