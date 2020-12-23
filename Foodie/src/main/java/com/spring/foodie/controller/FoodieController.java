package com.spring.foodie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.spring.foodie.common.*;
import com.spring.foodie.model.SearchVO;
import com.spring.foodie.service.*;

// === #30. 컨트롤러 선언 ===
@Component
@Controller
public class FoodieController {
	
	@Autowired
	private InterFoodieService service;
	
	// @Autowired
	// private FileManager fileManager;
	
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
	@RequestMapping(value = "/storeBoard/storeMainGetImage.food") // , produces="text/plain;charset=UTF-8")
	public String storeMainGetImage(HttpServletRequest request) {
		
		String codes = request.getParameter("codes");
		
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
		
		return json;
	}
	
	@RequestMapping(value = "/storeBoard/storeDetail.food", method = { RequestMethod.GET })
	public ModelAndView viewDetailBoard(ModelAndView mav, HttpServletRequest request) {
		
		String code = request.getParameter("code"); // 가게코드
		
		mav.setViewName("storeBoard/storeDetail.tiles1");
		
		return mav;
	}
	
	// 검색
	@RequestMapping(value = "/list.food")
	public ModelAndView list(HttpServletRequest request, ModelAndView mav) {
		
		// 글이 여러개 나올 수 있으니 리턴은 list로 주고 초기값 null은 글이 한개도 없을 수 있기 떄문이다.
		List<SearchVO> searchList = null;
		
		String searchType = request.getParameter("searchType"); // 폼태그에서 넘어온것
		String searchType2 = request.getParameter("searchType2"); // 폼태그에서 넘어온것
		String searchWord = request.getParameter("searchWord"); // 폼태그에서 넘어온것
		
		System.out.println("입력한 검색어 : " + searchWord);
		
		if (searchWord == null) { // 검색어가 없든지 텅빈것 아무것도안누르고 엔터누른경우
			searchWord = "";
			// String message = "검색어를 입력하세요.";
			// String loc ="javascript:history.back()";
			
			// mav.addObject("message", message);
			// mav.addObject("loc", loc);
			// mav.setViewName("msg");
		}
		/*
		 * if(searchType == null) { searchType = ""; }
		 * 
		 * if(searchType2 == null) { searchType2 = ""; }
		 */
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchType2", searchType2);
		paraMap.put("searchWord", searchWord);
		
		// *** === 검색어가 있을때만 검색어도 같이 넘겨준다. 없을면 공백이 넘어가버리므로 === *** //
		if (!"".equals(searchWord)) {
			mav.addObject("paraMap", paraMap); // 검색을 했을때만 맵을 뷰단으로 보내버린다.
		}
		
		searchList = service.searchList(paraMap);
		
		mav.addObject("searchList", searchList);
		mav.setViewName("main/list.tiles1");
		
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
	public String getJson() {
		String kakao = "https://place.map.kakao.com/main/v/";
		String id = "290249009";
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
	
}
