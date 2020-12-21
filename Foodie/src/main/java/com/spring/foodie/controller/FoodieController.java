package com.spring.foodie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
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

    String message = "";

    request.setAttribute("message", message);

    return "main/index.tiles1";

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
    String id = "7981207";
    String myURL = kakao + id;

    Object json = JsonReader.callURL(myURL);
    System.out.println("controller json : " + json);
    
    return json.toString();
  }
  
  // menuList, s2gra



}
