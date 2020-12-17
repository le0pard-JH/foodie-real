package com.spring.foodie.model;

import java.util.List;
import java.util.Map;

public interface InterFoodieDAO {

	//검색
	List<SearchVO> searchList(Map<String, String> paraMap);
	
	//검색어 입력시 자동글 완성하기
	//List<String> wordSearchShow(Map<String, String> paraMap);
	
	
}







