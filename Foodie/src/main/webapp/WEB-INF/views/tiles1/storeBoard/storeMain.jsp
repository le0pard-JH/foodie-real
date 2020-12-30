<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>

<style>
	.store {
		display:inline-block;
		width: 50%;
		padding-top: 50px;
		border-bottom: 1px solid gray;
	}
	
	.store_item_img {
		width: 238px;
		height: 238px;
	}
</style>

<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=8a283a84534cab3af87f95bcee93c9a4&libraries=services"></script>

<script type="text/javascript">

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();
	
	$(document).ready(function() {
		// 키워드로 장소를 검색합니다
		searchPlaces();
		
		// 대분류
		var basicInfo = null;
		var blogReview = null;
		var kakaoStory = null;
		var comment = null;
		var findway = null;
		var menuInfo = null;
		var photo = null;
		var s2graph = null;

		var Arr_Store_Photo = null;
		
	});

	function proc(foodie) {
		
		var json = foodie.split(",");
		
		$.each(Arr_Store_Photo, function(index, photo) {

            $('div.storeImg').append('<br>');
            $('div.storeImg').append('<img src=' + photo.list.orgurl + ' alt=메뉴 />');

        });
		
		// 대분류
		var basicInfo = null;
		var blogReview = null;
		var kakaoStory = null;
		var comment = null;
		var findway = null;
		var menuInfo = null;
		var photo = null;
		var s2graph = null;
		
		// 사진
		Arr_Store_Photo = photo.photoList;

		printImg(Arr_Store_Photo);
	}

	// 스크롤 이벤트 (최하단 이동시 더보기 기능)
	$(window).scroll(function() {
				var scrolltop = $(document).scrollTop();
				var height = $(document).height();
				var height_win = $(window).height();
				if (Math.round($(window).scrollTop()) == $(document).height()
						- $(window).height()) {
					// moreList();
				}
			});

	// 리스트의 가게를 클릭했을경우 해당 가게 상세페이지로 이동하는 함수
	function storeClick() {
		$("div.store_item").click(function() {
			var index = $("div.store_item").index(this);

			var code = $("input.code").eq(index).val();

			var frm = document.storeListForm;
			frm.method = "GET";
			frm.action = "<%=ctxPath%>/storeBoard/storeDetail.food?code="+code;
			frm.submit();
		});
		
	 }
	   
	// 스크롤 최하단으로 이동시 가게정보를 추가로 가져오는 메서드
	 function moreList() {
		var scrollCtrl = $("#scrollCtrl").val();
		var hotPlace = "${hotPlace}";
		var hotPlaceInfo = "${hotPlaceInfo}";
		
		var nscrollCtrl = Number(scrollCtrl) + 1;
		
		var html = "";
		
		$("#scrollCtrl").val(nscrollCtrl);
		
		var urlContent = {"hotPlace":hotPlace, "hotPlaceInfo":hotPlaceInfo, "nscrollCtrl":nscrollCtrl};
		
		$.ajax({
				url:"<%=ctxPath%>/storeBoard/moreView.food",
				data: urlContent,
				dataType:"JSON",
				success:function(json){
					for(var i=0; i<json.length; i++) {
						html += "<div class='store nice-scroll' align='center'>" +
					        	 	"<div class='store__list'>" +
					            		"<div class='store_item' style='cursor: pointer;' onclick='storeClick()'>" +
						               	 	"<div class='store_item_img' style='display: inline-block;'>" +
						                    "<img src='<%=ctxPath%>/resources/images/레노보.png'>" +
						                	"</div>" +
						                	"<div class='store__item__text' style='display: inline-block;'>" +
						                    "<div><h4>" + json[i].RNO +". "+ json[i].NAME + "</h4></div>" +
						                    "<div><h5>" + json[i].ADDRESS + "</h5></div>" +
						                    "<div><h5>" + json[i].CALL +"</h5></div>" +
						                    "<input type='text' value=" + json[i].CODE +" name='code' class='code' />" +
						                    "<div align='right'>" + json[i].NAME  + " 더보기 </div>" +
								            "</div>" +
							            "</div>" +
						        	"</div>" +
					    		"</div></br>";
					}
					$("div#storeList").append(html);
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			 	}
			});
		}
	
	// 키워드 검색을 요청하는 함수입니다
     function searchPlaces() {

         var keyword = "${Place}";

         // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
         ps.keywordSearch(keyword, placesSearchCB);
     }

     // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
     function placesSearchCB(data, status, pagination) {
         if (status === kakao.maps.services.Status.OK) {
             displayPlaces(data);
         } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

             alert('검색 결과가 존재하지 않습니다.');
             return;

         } else if (status === kakao.maps.services.Status.ERROR) {

             alert('검색 결과 중 오류가 발생했습니다.');
             return;

         }
     }

     // 검색 결과 목록과 마커를 표출하는 함수입니다
     function displayPlaces(places) {
         var listEl = document.getElementById('placesList'),
             menuEl = document.getElementById('menu_wrap'),
             fragment = document.createDocumentFragment(),
             listStr = '';
	
         for (var i = 0; i < places.length; i++) {

             itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
             
             fragment.appendChild(itemEl);
         }
         
         // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
         listEl.appendChild(fragment);
         
         getImage();
     }

     // 검색결과 항목을 Element로 반환하는 함수입니다
     function getListItem(index, places) {

         var el = document.createElement('li'),
             itemStr = '<span class="markerbg marker_' + (index + 1) + '"></span>' +
             '<div class="storeImg"></div>' +
             '<div class="info">' +
             '   <h5>'+ places.place_name +'</h5>' +
             '   <input type="hidden" value='+places.id+' class="code">';

         if (places.road_address_name) {
             itemStr += '    <span>' + places.road_address_name + '</span>' +
                 '   <span class="jibun gray">' + places.address_name + '</span>';
         } else {
             itemStr += '    <span>' + places.address_name + '</span>';
         }

         itemStr += '  <span class="tel">' + places.phone + '</span>' +
             '</div>';

         el.innerHTML = itemStr;
         el.className = 'item';

         return el;
     }
     
     function getImage() {
    	var length = $("li.item").length;
 		var codeArr = new Array;
 		var code = "";
 		for(var i=0; i<length; i++) {
 			// console.log("test["+i+"]==> " + $("input.code").eq(i).val());
 			code = $("input.code").eq(i).val();
 			codeArr.push(code);
 		}
 		
 		var codes = codeArr.join();
 		
 		$.ajax({
 			url:"<%=request.getContextPath()%>/storeBoard/storeMainGetImage.food",
 			data:{"codes":codes},
 			dataType:"JSON",
 			success:function(foodie){
 				proc(foodie);
 			},
 			error: function(request, status, error){
 				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
 		 	}
 		});
	}
     
     function printImg(Arr_Store_Photo) {
    	 var html = "";
    	 
    	 var store_Photo = Arr_Store_Photo.split(",");
    	 
    	 for(var i=0; i<store_Photo.length; i++) {
	    	 html += $('div.storeImg').eq(i).append('<img src=' + store_Photo[i] + '/>');
    	 }
    	 
    	 
     }
		
</script>

<form name="storeListForm">
	<div class="ov-hid">
		<!-- Page Preloder -->
		<div id="preloder">
			<div class="loader"></div>
		</div>

		<div class="store_text_top">
			<div id="hotPlace">${hotPlace}</div>
			<div id="hotPlaceInfo">${hotPlaceInfo}</div>
		</div>

		<div id="menu_wrap" class="bg_white">
			<input type="hidden" value="${Place}" id="keyword">
			<hr>
			<ul id="placesList"></ul>
		</div>
	</div>
	
	
	<input type="hidden" value="${scrollCtrl}" id="scrollCtrl" />
 <!-- Js Plugins -->
</form> 
    <script src="<%=ctxPath %>/resources/js/jquery-3.3.1.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/bootstrap.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery.nice-select.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery-ui.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery.nicescroll.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery.barfiller.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery.slicknav.js"></script>
    <script src="<%=ctxPath %>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/main.js"></script>
