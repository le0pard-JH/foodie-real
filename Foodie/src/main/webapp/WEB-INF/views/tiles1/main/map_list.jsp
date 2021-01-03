<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
div.container {
	font-size: 16px;
}
</style>

<script>
	$(document).ready(function() {

		// 대분류
		var basicInfo = null;
		var blogReview = null;
		var kakaoStory = null;
		var comment = null;
		var findway = null;
		var menuInfo = null;
		var photo = null;
		var s2graph = null;

		// 카테고리 - 전체

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

		// TV 방영 목록
		var Arr_TvList = null;
		var Arr_Store_tag = null;

		// 그래프 데이터
		var Arr_Graph_Day = null;
		var Arr_Graph_Gender = null;
		var Arr_Graph_Age = null;

		// 리뷰
		var Arr_Blog_Review = null;
		var Arr_Kakao_Story = null;

		// 길찾기
		var Arr_Find_Subway = null;
		var Arr_Find_Bus = null;

		// 
		var Arr_Menu_List = null;
		var Arr_Menu_List_Pic = null;
		var Arr_Store_Photo = null;

		var kakao_store_id = "25406298";

		$.ajax({
			type : "POST",
			url : "/foodie/get/json.food",
			dataType : "json",
			data : kakao_store_id,
			success : function(foodie) { //json 데이터를 반환 받음
				console.log(foodie);
				// console.log(foodie.basicInfo);
				proc(foodie);
				
			},
			error : function() {
				console.log("Failed");
			}
		});
	});

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

	function print() {

		$('div.store_title').append(
				store_id + '<br>' + store_name + '<br>' + '상세정보 <br>'
						+ addr_new + ' (우) ' + postcode_new + '<br>' + '지번 '
						+ local_dist_tag + ' ' + addr_old);

		$.each(Arr_RealHour, function(index, realHour) {

			$('div.store_time').append(
					realHour.timeName + ' : ' + realHour.dayOfWeek + ' '
							+ realHour.timeSE + '<br>');

		});

		$('div.store_info').append(social + '<br>' + mobile + ' 대표번호<br>');

		$.each(Arr_Store_tag, function(index, store_tag) {

			$('div.store_info').append(store_tag);

		});

		$.each(Arr_TvList, function(index, tv) {

			$('div.store_info').append(
					tv.chtitle + ' ' + tv.prtitle + ' ' + tv.episodeseq + ' 화 '
							+ tv.telecastdt + '<br>');

		});

		$.each(Arr_Menu_List, function(index, menu) {

			$('div.menu_list').append(
					menu.menu + ' - ' + menu.price + ' ' + '<br>');

		});
		
		$.each(Arr_Menu_List_Pic, function(index, menu_pic) {

			$('div.menu_list').append('<br>');
			$('div.menu_list').append('<img src=' + menu_pic + ' alt=메뉴 />');

		});
		
		$('div.menu_list').append('<br>');
		
		$.each(Arr_Store_Photo, function(index, photo) {
			
			console.log(photo.photoList.list.orgurl);

            $('div.menu_list').append('<br>');
            $('div.menu_list').append('<img src=' + photo.list.orgurl + ' alt=메뉴 />');

        });
	    
		
	}
</script>

<body>

		<div class="container">

				<div class="store_title"></div>
				<br>
				<div class="store_time"></div>
				<br>
				<div class="store_info"></div>
				<br>
				<div class="menu_list"></div>
				<br>


		</div>

</body>

<!-- https://place.map.kakao.com/main/v/25406298 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  

<%
   String ctxPath = request.getContextPath();
  //       /board 
%>
<style type="text/css">
    div.container {
        font-size: 16px;
    }

</style>

<script>
    $(document).ready(function() {

        // 대분류
        var basicInfo = null;
        var blogReview = null;
        var kakaoStory = null;
        var comment = null;
        var findway = null;
        var menuInfo = null;
        var photo = null;
        var s2graph = null;

        // 카테고리 - 전체

        // 가게 정보
        var store_id = null;
        var store_name = null;
        var mobile = null;
        var Arr_Feedback = null;

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

        // TV 방영 목록
        var Arr_TvList = null;
        var Arr_Store_tag = null;

        // 그래프 데이터
        var Arr_Graph_Day = null;
        var Arr_Graph_Gender = null;
        var Arr_Graph_Age = null;

        // 리뷰
        var Arr_Blog_Review = null;
        var Arr_Kakao_Story = null;

        // 길찾기
        var Arr_Find_Subway = null;
        var Arr_Find_Bus = null;

        // 사진
        var Arr_Menu_List = null;
        var Arr_Menu_List_Pic = null;
        var Arr_Store_Photo = null;

        // var store_id = "27075901";

        $("input.kakao_store_id").val(store_id);

        $("input.kakao_store_id").keyup(function(event) {
            if (event.keyCode == 13) {
                goSearch();
            }
        });

        $("input.kakao_store_id").click(function(event) {
            goSearch();
        });
    });

    function goSearch() {

        //$("input.kakao_store_id").val(store_id);
        var text = $("input.kakao_store_id").val();
        console.log(text);

        var kakao_store_id = $("form[name=kakao_store_id]").serialize();
        // var kakao_store_id = '26217952';

        $.ajax({
            type: "POST",
            url: "/foodie/get/json.food",
            dataType: "json",
            data: kakao_store_id,
            success: function(foodie) { //json 데이터를 반환 받음
                // console.log(foodie);
                // console.log(foodie.basicInfo);
                proc(foodie);

            },
            error: function() {
                console.log("Failed");
            }
        });

    }

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
        Arr_Feedback = basicInfo.feedback;

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
        console.log(Arr_RealHour);

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

        // 사진 배열 객체
        Arr_Menu_List = menuInfo.menuList;
        Arr_Menu_List_Pic = menuInfo.menuboardphotourlList;
        Arr_Store_Photo = photo.photoList;

        console.log(Arr_Store_Photo);

        print();
    }

    function print() {

        $('div.store_title').append(
            store_id + '<br>' + store_name + '<br>' + '상세정보 <br>' +
            addr_new + ' (우) ' + postcode_new + '<br>' + '지번 ' +
            local_dist_tag + ' ' + addr_old);

        $.each(Arr_RealHour, function(index, realHour) {

            $('div.store_time').append(
                realHour.timeName + ' : ' + realHour.dayOfWeek + ' ' +
                realHour.timeSE + '<br>');

        });

        $('div.store_info').append(social + '<br>' + mobile + ' 대표번호<br>');

        $.each(Arr_Store_tag, function(index, store_tag) {

            $('div.store_info').append(store_tag);

        });

        $.each(Arr_TvList, function(index, tv) {

            $('div.store_info').append(
                tv.chtitle + ' ' + tv.prtitle + ' ' + tv.episodeseq + ' 화 ' +
                tv.telecastdt + '<br>');

        });

        $.each(Arr_Menu_List, function(index, menu) {

            $('div.menu_list').append(
                menu.menu + ' - ' + menu.price + ' ' + '<br>');

        });

        $.each(Arr_Menu_List_Pic, function(index, menu_pic) {

            $('div.menu_list').append('<br>');
            $('div.menu_list').append('<img src=' + menu_pic + ' alt=메뉴 />');

        });

        $('div.menu_list').append('<br>');

        //console.log();
        //console.log(Arr_Store_Photo.list);

        $.each(Arr_Store_Photo, function(index, photo) {
            var photo_count = photo.photoCount;
            var photo_name = photo.categoryName;
            var photo_list = photo.list;

            $.each(photo_list, function(index, img) {
                var img_url = img.orgurl;

                console.log(photo_name);
                console.log(img_url);

                $('div.menu_list').append('<br>');
                $('div.menu_list').append('<img src=' + img_url + ' alt=메뉴 />');
            });
        });
    }

</script>

<body>

    <form name="kakao_store_id">
        <input type="text" name="kakao_store_id" id="kakao_store_id" class="kakao_store_id" value="" placeholder="검색어 입력" />
    </form>

    <div class="container">

        <div class="store_title"></div>
        <br>
        <div class="store_time"></div>
        <br>
        <div class="store_info"></div>
        <br>
        <div class="menu_list"></div>
        <br>


    </div>

</body>
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
<!-- https://place.map.kakao.com/main/v/25406298 -->
