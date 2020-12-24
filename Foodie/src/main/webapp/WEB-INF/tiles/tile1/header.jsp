<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.net.InetAddress"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- ======= #27. tile1 중 header 페이지 만들기 (#26.번은 없다 샘이 장난침.) ======= --%>
<%
	String ctxPath = request.getContextPath();
%>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=8a283a84534cab3af87f95bcee93c9a4&libraries=services"></script>

<script type="text/javascript">

//장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();
//키워드로 장소를 검색합니다
// searchPlaces();
	// 대분류
	var basicInfo = null;
	var blogReview = null;
	var kakaoStory = null;
	var comment = null;
	var findway = null;
	var menuInfo = null;
	var photo = null;
	var s2graph = null;
	
	// 가게 정보
	var store_id = null;
	var store_name = null;
	var mobile = null;
	
	// 가게 주소
	var postcode_new = null;
	var addr_new = null;
	var local_dist_tag = null;
	var local_old = null;
	var local_new = null;
	var addr_old = null;
	
	// 홈페이지 or SNS
	var social = null;
	
	// 영업시간
	var Store_Update_Date = null;
	var openHour = null;
	var Arr_RealHour = null;
	
	$(document).ready(function(){
		$("input#searchWord").focus();
		$("input#searchWord").keyup(function(event){
			if(event.keyCode == 13) {
				// 엔터를 했을 경우 
				goSearch();
			}
		});
		 
	});// end of $(document).ready(function(){})-------------------------------------------------- 
	function proc(foodie) {
		// 대분류
		basicInfo = foodie.basicInfo;
		blogReview = foodie.blogReview;
		kakaoStory = foodie.kakaoStory;
		comment = foodie.comment;
		findway = foodie.findway;
		menuInfo = foodie.menuInfo;
		photo = foodie.photo;
		s2graph = foodie.s2graph;
		// 카테고리 - 전체
		// 가게 정보
		store_id = basicInfo.cid;
		store_name = basicInfo.placenamefull;
		mobile = basicInfo.phonenum;
		// 가게 주소
		postcode_new = basicInfo.address.newaddr.bsizonno;
		addr_new = basicInfo.address.newaddr.newaddrfull;
		local_dist_tag = basicInfo.address.region.name3;
		local_old = basicInfo.address.region.fullname;
		local_new = basicInfo.address.region.newaddrfullname;
		addr_old = basicInfo.address.addrbunho;
		// 홈페이지 or SNS
		social = basicInfo.homepage;
		// 영업시간
		Store_Update_Date = basicInfo.openHour.realtime.datetime;
		openHour = basicInfo.openHour.realtime.currentPeriod.periodName;
		Arr_RealHour = basicInfo.openHour.realtime.currentPeriod.timeList;
		// TV 방영 목록
		Arr_TvList = basicInfo.tvInfoList;
		Arr_Store_tag = basicInfo.metaKeywordList;
		// 그래프 데이터
		Arr_Graph_Day = s2graph.day;
		Arr_Graph_Gender = s2graph.gender;
		Arr_Graph_Age = s2graph.age;
		// 리뷰
		Arr_Blog_Review = blogReview;
		Arr_Kakao_Story = kakaoStory;
		// 길찾기
		Arr_Find_Subway = findway.subway;
		Arr_Find_Bus = findway.busstop;
		// 
		Arr_Menu_List = menuInfo.menuList;
		Arr_Menu_List_Pic = menuInfo.menuboardphotourlList;
		Arr_Store_Photo = photo.photoList;
		print();
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
	
	
    function goSearch() {
    	
		if( $("input#searchWord").val() == "" || $("input#searchWord").val() == null){
			alert('가게명을 입력하세요.');
			console.log(searchWord);
			return;
		}
		
		var searchWord = ps.keywordSearch(keyword, placesSearchCB);
		
		var frm = document.searchFrm;
		frm.method = "GET";
		frm.action = "<%= request.getContextPath()%>/list.food";
		frm.submit();
		

	}// end of function goSearch() {}-----------------------
	
</script>

<script>
	// 마커를 담을 배열입니다
	var markers = [];
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		zIndex : 1
	});
	
	// 키워드로 장소를 검색합니다
	searchPlaces();
	
	function searchPlaces() {

        //var keyword = "${Place}";
        var keyword = document.getElementById('keyword').value;
        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
            
        }
        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        //keyword = ps.keywordSearch(keyword, placesSearchCB);
        
        var kfrm = document.KakaoSearchfrm;
		kfrm.method = "POST";
		kfrm.action = "<%= request.getContextPath()%>/map/search.food";
		kfrm.submit();
		
		var kakao_keyword = $("form[name=KakaoSearchfrm]").serialize();
			
			$.ajax({
				url: "/foodie/map/search.food",
				type: "POST",
				//data: {"keyword":queryString},
				data:{"keyword":$("input#keyword").val()},
				//data: queryString,
				success: function(foodie) {
					searchPlaces(kakao_keyword);	// KakaoMap의 searchPlaces 함수 호출
					
				}
			});
			
    }
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {
			// 정상적으로 검색이 완료됐으면
			// 검색 목록과 마커를 표출합니다
			displayPlaces(data);
			// 페이지 번호를 표출합니다
			displayPagination(pagination);
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
		var listEl = document.getElementById('placesList'), menuEl = document
				.getElementById('menu_wrap'), fragment = document
				.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';
		// 검색 결과 목록에 추가된 항목들을 제거합니다
		removeAllChildNods(listEl);
		// 지도에 표시되고 있는 마커를 제거합니다
		removeMarker();
		for (var i = 0; i < places.length; i++) {
			// 마커를 생성하고 지도에 표시합니다
			var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x), marker = addMarker(
					placePosition, i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(placePosition);
			// 마커와 검색결과 항목에 mouseover 했을때
			// 해당 장소에 인포윈도우에 장소명을 표시합니다
			// mouseout 했을 때는 인포윈도우를 닫습니다
			(function(marker, title) {
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					displayInfowindow(marker, title);
				});
				kakao.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});
				itemEl.onmouseover = function() {
					displayInfowindow(marker, title);
				};
				itemEl.onmouseout = function() {
					infowindow.close();
				};
			})(marker, places[i].place_name);
			fragment.appendChild(itemEl);
		}
		// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		listEl.appendChild(fragment);
		menuEl.scrollTop = 0;
		// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		map.setBounds(bounds);
	}
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
		var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
				+ (index + 1)
				+ '"></span>'
				+ '<div class="info">'
				+ '   <h5>'
				+ places.place_name + '</h5>';
		if (places.road_address_name) {
			itemStr += '    <span>' + places.road_address_name + '</span>'
					+ '   <span class="jibun gray">' + places.address_name
					+ '</span>';
		} else {
			itemStr += '    <span>' + places.address_name + '</span>';
		}
		itemStr += '  <span class="tel">' + places.phone + '</span>' + '</div>';
		el.innerHTML = itemStr;
		el.className = 'item';

		// console log start

		// console start
		console.log("");
		console.log("start");
		console.log(places.address_name);
		console.log(places.category_group_code);
		console.log(places.category_group_name);
		console.log(places.distance);
		console.log(places.id);
		console.log(places.phone);
		console.log(places.place_name);
		console.log(places.place_url);
		console.log(places.road_address_name);

		// console log end
		console.log(places.x);
		console.log(places.y);
		console.log("end");
		console.log("");
		// console end
		return el;
	}
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
		imgOptions = {
			spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset : new kakao.maps.Point(13, 37)
		// 마커 좌표에 일치시킬 이미지 내에서의 좌표
		}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
				imgOptions), marker = new kakao.maps.Marker({
			position : position, // 마커의 위치
			image : markerImage
		});
		marker.setMap(map); // 지도 위에 마커를 표출합니다
		markers.push(marker); // 배열에 생성된 마커를 추가합니다
		return marker;
	}
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}
	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
		var paginationEl = document.getElementById('pagination'), fragment = document
				.createDocumentFragment(), i;
		// 기존에 추가된 페이지번호를 삭제합니다
		while (paginationEl.hasChildNodes()) {
			paginationEl.removeChild(paginationEl.lastChild);
		}
		for (i = 1; i <= pagination.last; i++) {
			var el = document.createElement('a');
			el.href = "#";
			el.innerHTML = i;
			if (i === pagination.current) {
				el.className = 'on';
			} else {
				el.onclick = (function(i) {
					return function() {
						pagination.gotoPage(i);
					}
				})(i);
			}
			fragment.appendChild(el);
		}
		paginationEl.appendChild(fragment);
	}
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
		var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
		infowindow.setContent(content);
		infowindow.open(map, marker);
	}
	// 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {
		while (el.hasChildNodes()) {
			el.removeChild(el.lastChild);
		}
	}
</script>
<!-- Header Section Begin -->
<header class="header">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-3 col-md-3">
				<!-- 로고 -->
				<div class="header__logo">
					<a href="./index.food"><img
						src="<%=ctxPath%>/resources/images/foodie_logo.png"
						style="width: 200px; height: 100px;" alt=""></a>
				</div>
			</div>
			<div class="col-lg-9 col-md-9">
				<div class="header__nav">
					<!-- 헤더 기능 버튼 -->
					<nav class="header__menu mobile-menu">
						<ul>
							<li class="active"><a href="<%=ctxPath%>/index.food">Home</a></li>
							<li><a href="./listing.html">식당게시판</a></li>
							<li><a href="#">유저게시판</a></li>
						</ul>
					</nav>
					<!-- 유저모양 로그인 버튼 -->
					<div class="header__menu__right">
						<a href="#" class="login-btn"><i class="fa fa-user"></i></a>
					</div>
				</div>
			</div>
		</div>
		<div id="mobile-menu-wrap"></div>
	</div>
</header>

<!-- 검색 기능 및 메인화면 로딩시 출력문장 -->
<section class="hero set-bg"
	data-setbg="<%=ctxPath%>/resources/img/hero/hero-bg.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="hero__text">

					<!-- 머릿말 -->
					<div class="section-title">
						<h3 style="margin-top: 20px;">솔직한 리뷰, 믿을 수 있는 평점!</h3>
						<br>
						<h3>Foodie</h3>
					</div>
					<div class="hero__search__form">


						<form name="searchFrm">
							<div class="select__option">
								<select name="searchType" id="searchType">
									<option value="">지역</option>
									<!--  <option value="">서울특별시</option>                                       
                                        <option value="">인천광역시</option>
                                        <option value="">대전광역시</option>
                                        <option value="">대구광역시</option>
                                        <option value="">광주광역시</option>
                                        <option value="">부산광역시</option>
                                        <option value="">울산광역시</option>
                                        <option value="">세종특별시</option>
                                     
                                        <option value="">경기도</option>
                                        <option value="">강원도</option>
                                        <option value="">충청북도</option>
                                        <option value="">충청남도</option>
                                        <option value="">전라북도</option>
                                        <option value="">전라남도</option>
                                        <option value="">경상북도</option>
                                        <option value="">경상남도</option>
                                        <option value="">제주도</option>-->
								</select>
							</div>
							<div class="select__option">
								<select name="searchType2" id="searchType2">
									<option selected>세부지역</option>
									<!--  <option value="">세부지역</option>
                                        <option value="">세부지역</option>
                                        <option value="">세부지역</option>
                                        <option value="">세부지역</option>
                                        <option value="">세부지역</option>-->
								</select>
							</div>
							<input type="text" name="searchWord" id="searchWord" placeholder="가게명을 검색하세요.">
							<button type="button" id="btnSearch" onclick="goSearch()">검색</button>
							<div class="select__option"></div>
							<div class="select__option"></div>
							
						</form>
						<!-- <div id="displayList" style="border:solid 0px gray; float:right; border-top:0px; width:600px; height:150px; margin-left:70px; margin-top:-1px; overflow:auto;"></div> -->
						<div class="option">
								<div>
									<form name="KakaoSearchfrm"  onsubmit="searchPlaces(); return false;">
										<input type="text" value="" id="keyword" size="15" placeholder="키워드를 입력하세요">
										<button type="submit" style="background-color: #FAE100; color:#000000; ">카카오맵 검색</button>
									</form>
								</div>
						</div> 

					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Header Section End -->