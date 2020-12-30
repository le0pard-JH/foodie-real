<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
    div.container {
        font-size: 16px;
    }

</style>

<script>
    $(document).ready(function() {

        console.log('ready');

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

        // comment
        var comment_allComntcnt = null;
        var comment_scoresum = null;
        var comment_scorecnt = null;
        var comment_list = null;
        var comment_score = 0;

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
        //console.log(basicInfo);

        console.log('5-45');

        var flag = false;

        try {
            if (typeof(basicInfo.openHour.realtime.datetime) !== undefined) {
                flag = true;
                Store_Update_Date = basicInfo.openHour.realtime.datetime;
                if (typeof(basicInfo.openHour.realtime.currentPeriod.periodName) !== undefined) {
                    flag = true;
                    openHour = basicInfo.openHour.realtime.currentPeriod.periodName;
                    if (typeof(basicInfo.openHour.realtime.currentPeriod.timeList) !== undefined) {
                        flag = true;
                        Arr_RealHour = basicInfo.openHour.realtime.currentPeriod.timeList;
                    }
                }
            }
        } catch (basicInfoTimeError) {
            flag = false;
            console.log(basicInfoTimeError);
        }

        console.log("basicInfo time flag : " + flag);

        try {
            if (typeof(comment) !== undefined) {
                flag = true;
                comment_allComntcnt = comment.allComntcnt;
                comment_scoresum = comment.scoresum;
                comment_scorecnt = comment.scorecnt;
                comment_score = (Number(comment_scoresum) / Number(comment_scorecnt)).toFixed(1);
                comment_list = comment.list;
                console.log(comment_score);
            }
        } catch (commentError) {
            flag = false;
            console.log("commentError flag : " + commentError);
        }

        console.log("commentError flag : " + flag);

        try {
            if (typeof(basicInfo.tvInfoList) !== undefined) {
                flag = true;
                Arr_TvList = basicInfo.tvInfoList;
                if (typeof(basicInfo.metaKeywordList) !== undefined) {
                    flag = true;
                    Arr_Store_tag = basicInfo.metaKeywordList;
                }
            }
        } catch (basicInfoTvTagError) {
            flag = false;
            console.log(basicInfoTimeError);
        }

        console.log("basicInfo tv flag : " + flag);

        try {
            if (typeof(s2graph.day) !== undefined) {
                flag = true;
                Arr_Graph_Day = s2graph.day;
                if (typeof(s2graph.gender) !== undefined) {
                    flag = true;
                    Arr_Graph_Gender = s2graph.gender;
                    if (typeof(s2graph.age) !== undefined) {
                        flag = true;
                        Arr_Graph_Age = s2graph.age;
                    }
                }
            }
        } catch (s2graphError) {
            flag = false;
            console.log(s2graphError);
        }

        console.log("s2graph flag : " + flag);
        var thumbnailList = new Array();
        try {
            if (typeof(blogReview) !== undefined) {
                flag = true;
                Arr_Blog_Review = blogReview;
                var thumbLen = Arr_Blog_Review.list.length;
                var thumbnailArr = Arr_Blog_Review.list;
                for (var i = 0; i < thumbLen; i++) {
                    var thumbList2 = thumbnailArr[i].photoList[0].orgurl;
                    var thumbList = thumbnailArr[i].photoList[0];
                    thumbnailList[i] = [thumbList2];
                }

                console.log('tList0');
                console.log(thumbnailList);

            }
        } catch (blogReviewError) {
            flag = false;
            console.log(blogReviewError);
        }

        console.log("blogReview flag : " + flag);

        try {
            if (typeof(kakaoStory) !== undefined) {
                flag = true;
                Arr_Kakao_Story = kakaoStory;
            }
        } catch (kakaoStoryError) {
            flag = false;
            console.log(kakaoStoryError);
        }

        console.log("kakaoStory flag : " + flag);

        try {
            if (typeof(findway.subway) !== undefined) {
                flag = true;
                Arr_Find_Subway = findway.subway;
                //console.log(Arr_Find_Subway);
                if (typeof(findway.busstop) !== undefined) {
                    flag = true;
                    Arr_Find_Bus = findway.busstop;
                }
            }
        } catch (findwayError) {
            flag = false;
            console.log(findwayError);
        }

        console.log("findway flag : " + flag);

        try {
            if (typeof(menuInfo.menuList) !== undefined) {
                flag = true;
                Arr_Menu_List = menuInfo.menuList;
                if (typeof(menuInfo.menuboardphotourlList) !== undefined) {
                    flag = true;
                    Arr_Menu_List_Pic = menuInfo.menuboardphotourlList;
                }
            }
        } catch (menuInfoError) {
            flag = false;
            console.log(menuInfoError);
        }

        console.log("menuInfo flag : " + flag);

        try {
            if (typeof(photo.photoList) !== undefined) {
                flag = true;
                Arr_Store_Photo = photo.photoList;
                //console.log(Arr_Store_Photo);
            }
        } catch (photoError) {
            flag = false;
            console.log(photoError);
        }

        console.log("photo flag : " + flag);
        print();
    }

    function print() {

        $('div.store_title').empty();
        $('div.store_time').empty();
        $('div.store_info').empty();
        $('div.menu_list').empty();

        $('div.store_title').append(
            store_id + '<br>' + store_name + '<br>' + '상세정보 <br>' +
            addr_new + ' (우) ' + postcode_new + '<br>' + '지번 ' +
            local_dist_tag + ' ' + addr_old);

        $.each(Arr_RealHour, function(index, realHour) {
            $('div.store_time').append(
                realHour.timeName + ' : ' + realHour.dayOfWeek + ' ' +
                realHour.timeSE + '<br>');
        });

        try {
            if (typeof(social) === 'String') {
                $('div.store_info').append(social + '<br>' + mobile + ' 대표번호<br>');
            } else {
                $('div.store_info').append(mobile + ' 대표번호<br>');
            }
        } catch (socialError) {
            console.log("socialError : " + socialError);
        }

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

                //console.log(photo_name);
                //console.log(img_url);

                $('div.menu_list').append('<br>');
                $('div.menu_list').append('<img src=' + img_url + ' alt=메뉴 />');
            });
        });

        $.each(Arr_Find_Subway, function(index, subway) {
            console.log('subway');
            console.log(subway);

            var html = "";

            html += "<table>";
            html += "<thead>";
            html += "<tr>";
            html += "<th>";
            html += "지하철역"
            html += "</th>";
            html += "</tr>";
            html += "</thead>";
            html += "<tbody>";
            html += "<tr>";
            html += "<td>";
            html += subway.stationSimpleName;
            html += "</td>";
            html += "</tr>";
            html += "</tbody>";
            html += "";
            html += "";
            html += "";
            html += "";
            html += "";
            html += "</table>";





 
                    
                    


            $(".findway").empty();
            $(".findway").append(html);

        });

        $.each(Arr_Find_Bus, function(index, bus) {
            console.log('bus');
            console.log(bus);
        });

    }

</script>

<body>

    <form name="kakao_store_id">
        <input type="text" name="kakao_store_id" id="kakao_store_id" class="kakao_store_id" value="" />
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
        <div class="findway"></div>
        <br>
        
        <div class="station_wayout">
            <h4 class="tit_findway">지하철역</h4>
            <ul class="list_wayout">
                    <li>
                        <em class="txt_station"><a href="https://map.kakao.com?subwayId=SES0152" target="_blank" class="link_station" data-logtarget="" data-logevent="waytogo,subway">종각역</a></em>
                            <span class="ico_traffic seoul_line1_small">1호선</span><!-- 호선별 대체 텍스트 부탁 드립니다. -->
                        <span class="bg_bar">|</span>
                        <span class="txt_wayout"><span class="num_wayout">3-1</span>번 출구 <span class="num_wayout txt_walk">도보 1분</span></span>
                    </li>
                    <li>
                        <em class="txt_station"><a href="https://map.kakao.com?subwayId=SES0202" target="_blank" class="link_station" data-logtarget="" data-logevent="waytogo,subway">을지로입구역</a></em>
                            <span class="ico_traffic seoul_line2_small">2호선</span><!-- 호선별 대체 텍스트 부탁 드립니다. -->
                        <span class="bg_bar">|</span>
                        <span class="txt_wayout"><span class="num_wayout">3</span>번 출구 <span class="num_wayout txt_walk">도보 10분</span></span>
                    </li>
                    <li>
                        <em class="txt_station"><a href="https://map.kakao.com?subwayId=SES2534" target="_blank" class="link_station" data-logtarget="" data-logevent="waytogo,subway">광화문역</a></em>
                            <span class="ico_traffic seoul_line5_small">5호선</span><!-- 호선별 대체 텍스트 부탁 드립니다. -->
                        <span class="bg_bar">|</span>
                        <span class="txt_wayout"><span class="num_wayout">4</span>번 출구 <span class="num_wayout txt_walk">도보 11분</span></span>
                    </li>
                    <li>
                        <em class="txt_station"><a href="https://map.kakao.com?subwayId=SES2535" target="_blank" class="link_station" data-logtarget="" data-logevent="waytogo,subway">종로3가역</a></em>
                            <span class="ico_traffic seoul_line5_small">5호선</span><!-- 호선별 대체 텍스트 부탁 드립니다. -->
                            <span class="ico_traffic seoul_line1_small">1호선</span><!-- 호선별 대체 텍스트 부탁 드립니다. -->
                            <span class="ico_traffic seoul_line3_small">3호선</span><!-- 호선별 대체 텍스트 부탁 드립니다. -->
                        <span class="bg_bar">|</span>
                        <span class="txt_wayout"><span class="num_wayout">5</span>번 출구 <span class="num_wayout txt_walk">도보 12분</span></span>
                    </li>
            </ul>
        </div>
        
        
        
        
        <div class="station_ride check_list">
            <h4 class="tit_findway">버스정류장</h4>
                <div class="ride_wayout"><!-- 지도에서 일치하는 정류장에 마우스 오버 했을 때 클래스 ride_on 추가 -->
                    <strong class="tit_wayout">
                        <a href="https://map.kakao.com?busStopId=BS119268" class="link_wayout" target="_blank" data-logtarget="" data-logevent="waytogo,busstop">
                            <span class="txt_busstop">종각.공평유적전시관</span>
                            <span class="txt_number"><span class="screen_out">정류장 번호: </span>(01888) <span class="bg_bar">|</span> <span class="screen_out">거리: </span> 81m</span>
                        </a>
                    </strong>
                    <ul class="list_ride">
                            <li>
                                <em class="ico_traffic bus_town">마을</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">종로01<span class="bg_bar">|</span>종로02</span>
                                    <a href="https://map.kakao.com?busStopId=BS119268" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                    </ul>
                </div>
                <div class="ride_wayout"><!-- 지도에서 일치하는 정류장에 마우스 오버 했을 때 클래스 ride_on 추가 -->
                    <strong class="tit_wayout">
                        <a href="https://map.kakao.com?busStopId=BS142746" class="link_wayout" target="_blank" data-logtarget="" data-logevent="waytogo,busstop">
                            <span class="txt_busstop">인사동들머리.3.1독립선언터</span>
                            <span class="txt_number"><span class="screen_out">정류장 번호: </span>(01727) <span class="bg_bar">|</span> <span class="screen_out">거리: </span> 136m</span>
                        </a>
                    </strong>
                    <ul class="list_ride">
                            <li>
                                <em class="ico_traffic bus_town">마을</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">종로01</span>
                                    <a href="https://map.kakao.com?busStopId=BS142746" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                    </ul>
                </div>
                <div class="ride_wayout"><!-- 지도에서 일치하는 정류장에 마우스 오버 했을 때 클래스 ride_on 추가 -->
                    <strong class="tit_wayout">
                        <a href="https://map.kakao.com?busStopId=BS455624" class="link_wayout" target="_blank" data-logtarget="" data-logevent="waytogo,busstop">
                            <span class="txt_busstop">종각역</span>
                            <span class="txt_number"><span class="screen_out">정류장 번호: </span>(01912) <span class="bg_bar">|</span> <span class="screen_out">거리: </span> 151m</span>
                        </a>
                    </strong>
                    <ul class="list_ride">
                            <li>
                                <em class="ico_traffic bus_circle">순환</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">TOUR11</span>
                                    <a href="https://map.kakao.com?busStopId=BS455624" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                    </ul>
                </div>
                <div class="ride_wayout"><!-- 지도에서 일치하는 정류장에 마우스 오버 했을 때 클래스 ride_on 추가 -->
                    <strong class="tit_wayout">
                        <a href="https://map.kakao.com?busStopId=BS418920" class="link_wayout" target="_blank" data-logtarget="" data-logevent="waytogo,busstop">
                            <span class="txt_busstop">종각역YMCA</span>
                            <span class="txt_number"><span class="screen_out">정류장 번호: </span>(01683) <span class="bg_bar">|</span> <span class="screen_out">거리: </span> 187m</span>
                        </a>
                    </strong>
                    <ul class="list_ride">
                            <li>
                                <em class="ico_traffic bus_town">마을</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">종로01<span class="bg_bar">|</span>종로02</span>
                                    <a href="https://map.kakao.com?busStopId=BS418920" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                    </ul>
                </div>
                <div class="ride_wayout"><!-- 지도에서 일치하는 정류장에 마우스 오버 했을 때 클래스 ride_on 추가 -->
                    <strong class="tit_wayout">
                        <a href="https://map.kakao.com?busStopId=BS404746" class="link_wayout" target="_blank" data-logtarget="" data-logevent="waytogo,busstop">
                            <span class="txt_busstop">종로2가(중)</span>
                            <span class="txt_number"><span class="screen_out">정류장 번호: </span>(01013) <span class="bg_bar">|</span> <span class="screen_out">거리: </span> 187m</span>
                        </a>
                    </strong>
                    <ul class="list_ride">
                            <li>
                                <em class="ico_traffic bus_blue">간선</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">101<span class="bg_bar">|</span>103<span class="bg_bar">|</span>143<span class="bg_bar">|</span>150<span class="bg_bar">|</span>160<span class="bg_bar">|</span>201<span class="bg_bar">|</span>260<span class="bg_bar">|</span>262<span class="bg_bar">|</span>270<span class="bg_bar">|</span>271A<span class="bg_bar">|</span>271B<span class="bg_bar">|</span>273<span class="bg_bar">|</span>370<span class="bg_bar">|</span>470<span class="bg_bar">|</span>501<span class="bg_bar">|</span>720<span class="bg_bar">|</span>721<span class="bg_bar">|</span>741<span class="bg_bar">|</span>N15<span class="txt_bustype">(심야)</span><span class="bg_bar">|</span>N26<span class="txt_bustype">(심야)</span><span class="bg_bar">|</span>N37<span class="txt_bustype">(심야)</span><span class="bg_bar">|</span>N62<span class="txt_bustype">(심야)</span></span>
                                    <a href="https://map.kakao.com?busStopId=BS404746" target="_blank" class="btn_more" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                            <li>
                                <em class="ico_traffic bus_green">지선</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">7212</span>
                                    <a href="https://map.kakao.com?busStopId=BS404746" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                            <li>
                                <em class="ico_traffic bus_circle">순환</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">04</span>
                                    <a href="https://map.kakao.com?busStopId=BS404746" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                            <li>
                                <em class="ico_traffic bus_direct">직행</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">9301</span>
                                    <a href="https://map.kakao.com?busStopId=BS404746" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                    </ul>
                </div>
                <div class="ride_wayout"><!-- 지도에서 일치하는 정류장에 마우스 오버 했을 때 클래스 ride_on 추가 -->
                    <strong class="tit_wayout">
                        <a href="https://map.kakao.com?busStopId=BS404756" class="link_wayout" target="_blank" data-logtarget="" data-logevent="waytogo,busstop">
                            <span class="txt_busstop">종로1가</span>
                            <span class="txt_number"><span class="screen_out">정류장 번호: </span>(01012) <span class="bg_bar">|</span> <span class="screen_out">거리: </span> 189m</span>
                        </a>
                    </strong>
                    <ul class="list_ride">
                            <li>
                                <em class="ico_traffic bus_blue">간선</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">101<span class="bg_bar">|</span>103<span class="bg_bar">|</span>150<span class="bg_bar">|</span>160<span class="bg_bar">|</span>260<span class="bg_bar">|</span>270<span class="bg_bar">|</span>271A<span class="bg_bar">|</span>271B<span class="bg_bar">|</span>273<span class="bg_bar">|</span>370<span class="bg_bar">|</span>470<span class="bg_bar">|</span>601<span class="bg_bar">|</span>720<span class="bg_bar">|</span>721<span class="bg_bar">|</span>741<span class="bg_bar">|</span>N26<span class="txt_bustype">(심야)</span><span class="bg_bar">|</span>N37<span class="txt_bustype">(심야)</span></span>
                                    <a href="https://map.kakao.com?busStopId=BS404756" target="_blank" class="btn_more" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                            <li>
                                <em class="ico_traffic bus_green">지선</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">7212</span>
                                    <a href="https://map.kakao.com?busStopId=BS404756" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                    </ul>
                </div>
                <div class="ride_wayout"><!-- 지도에서 일치하는 정류장에 마우스 오버 했을 때 클래스 ride_on 추가 -->
                    <strong class="tit_wayout">
                        <a href="https://map.kakao.com?busStopId=11010611014" class="link_wayout" target="_blank" data-logtarget="" data-logevent="waytogo,busstop">
                            <span class="txt_busstop">조계사</span>
                            <span class="txt_number"><span class="screen_out">정류장 번호: </span>(01201) <span class="bg_bar">|</span> <span class="screen_out">거리: </span> 190m</span>
                        </a>
                    </strong>
                    <ul class="list_ride">
                            <li>
                                <em class="ico_traffic bus_blue">간선</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">151<span class="bg_bar">|</span>162<span class="bg_bar">|</span>172<span class="bg_bar">|</span>401<span class="bg_bar">|</span>406<span class="bg_bar">|</span>704</span>
                                    <a href="https://map.kakao.com?busStopId=11010611014" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                            <li>
                                <em class="ico_traffic bus_green">지선</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">7022</span>
                                    <a href="https://map.kakao.com?busStopId=11010611014" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                    </ul>
                </div>
                <div class="ride_wayout"><!-- 지도에서 일치하는 정류장에 마우스 오버 했을 때 클래스 ride_on 추가 -->
                    <strong class="tit_wayout">
                        <a href="https://map.kakao.com?busStopId=11010611055" class="link_wayout" target="_blank" data-logtarget="" data-logevent="waytogo,busstop">
                            <span class="txt_busstop">조계사</span>
                            <span class="txt_number"><span class="screen_out">정류장 번호: </span>(01202) <span class="bg_bar">|</span> <span class="screen_out">거리: </span> 199m</span>
                        </a>
                    </strong>
                    <ul class="list_ride">
                            <li>
                                <em class="ico_traffic bus_blue">간선</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">109<span class="bg_bar">|</span>151<span class="bg_bar">|</span>162<span class="bg_bar">|</span>172<span class="bg_bar">|</span>606</span>
                                    <a href="https://map.kakao.com?busStopId=11010611055" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                            <li>
                                <em class="ico_traffic bus_green">지선</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">1020</span>
                                    <a href="https://map.kakao.com?busStopId=11010611055" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                    </ul>
                </div>
                <div class="ride_wayout"><!-- 지도에서 일치하는 정류장에 마우스 오버 했을 때 클래스 ride_on 추가 -->
                    <strong class="tit_wayout">
                        <a href="https://map.kakao.com?busStopId=BS68943" class="link_wayout" target="_blank" data-logtarget="" data-logevent="waytogo,busstop">
                            <span class="txt_busstop">조계사</span>
                            <span class="txt_number"><span class="screen_out">정류장 번호: </span>(01267) <span class="bg_bar">|</span> <span class="screen_out">거리: </span> 223m</span>
                        </a>
                    </strong>
                    <ul class="list_ride">
                            <li>
                                <em class="ico_traffic bus_metroplice">광역</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">9401</span>
                                    <a href="https://map.kakao.com?busStopId=BS68943" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                            <li>
                                <em class="ico_traffic bus_direct">직행</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">5000A<span class="bg_bar">|</span>5000B<span class="bg_bar">|</span>5005<span class="bg_bar">|</span>5500-2<span class="bg_bar">|</span>9000<span class="bg_bar">|</span>9000-1<span class="txt_bustype">(출근용)</span><span class="bg_bar">|</span>9200</span>
                                    <a href="https://map.kakao.com?busStopId=BS68943" target="_blank" class="btn_more" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                    </ul>
                </div>
                <div class="ride_wayout"><!-- 지도에서 일치하는 정류장에 마우스 오버 했을 때 클래스 ride_on 추가 -->
                    <strong class="tit_wayout">
                        <a href="https://map.kakao.com?busStopId=BS404745" class="link_wayout" target="_blank" data-logtarget="" data-logevent="waytogo,busstop">
                            <span class="txt_busstop">종로1가</span>
                            <span class="txt_number"><span class="screen_out">정류장 번호: </span>(01011) <span class="bg_bar">|</span> <span class="screen_out">거리: </span> 231m</span>
                        </a>
                    </strong>
                    <ul class="list_ride">
                            <li>
                                <em class="ico_traffic bus_blue">간선</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">101<span class="bg_bar">|</span>150<span class="bg_bar">|</span>160<span class="bg_bar">|</span>260<span class="bg_bar">|</span>270<span class="bg_bar">|</span>271A<span class="bg_bar">|</span>271B<span class="bg_bar">|</span>273<span class="bg_bar">|</span>370<span class="bg_bar">|</span>470<span class="bg_bar">|</span>501<span class="bg_bar">|</span>720<span class="bg_bar">|</span>721<span class="bg_bar">|</span>741<span class="bg_bar">|</span>N26<span class="txt_bustype">(심야)</span><span class="bg_bar">|</span>N37<span class="txt_bustype">(심야)</span></span>
                                    <a href="https://map.kakao.com?busStopId=BS404745" target="_blank" class="btn_more" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                            <li>
                                <em class="ico_traffic bus_green">지선</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">7212</span>
                                    <a href="https://map.kakao.com?busStopId=BS404745" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                            <li>
                                <em class="ico_traffic bus_circle">순환</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">04</span>
                                    <a href="https://map.kakao.com?busStopId=BS404745" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                    </ul>
                </div>
                <div class="ride_wayout"><!-- 지도에서 일치하는 정류장에 마우스 오버 했을 때 클래스 ride_on 추가 -->
                    <strong class="tit_wayout">
                        <a href="https://map.kakao.com?busStopId=11020521016" class="link_wayout" target="_blank" data-logtarget="" data-logevent="waytogo,busstop">
                            <span class="txt_busstop">청계1가.광교</span>
                            <span class="txt_number"><span class="screen_out">정류장 번호: </span>(02224) <span class="bg_bar">|</span> <span class="screen_out">거리: </span> 252m</span>
                        </a>
                    </strong>
                    <ul class="list_ride">
                            <li>
                                <em class="ico_traffic bus_blue">간선</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">173</span>
                                    <a href="https://map.kakao.com?busStopId=11020521016" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                            <li>
                                <em class="ico_traffic bus_green">지선</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">7017<span class="bg_bar">|</span>7021</span>
                                    <a href="https://map.kakao.com?busStopId=11020521016" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                    </ul>
                </div>
                <div class="ride_wayout"><!-- 지도에서 일치하는 정류장에 마우스 오버 했을 때 클래스 ride_on 추가 -->
                    <strong class="tit_wayout">
                        <a href="https://map.kakao.com?busStopId=BS404755" class="link_wayout" target="_blank" data-logtarget="" data-logevent="waytogo,busstop">
                            <span class="txt_busstop">종로2가</span>
                            <span class="txt_number"><span class="screen_out">정류장 번호: </span>(01014) <span class="bg_bar">|</span> <span class="screen_out">거리: </span> 258m</span>
                        </a>
                    </strong>
                    <ul class="list_ride">
                            <li>
                                <em class="ico_traffic bus_blue">간선</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">101<span class="bg_bar">|</span>103<span class="bg_bar">|</span>143<span class="bg_bar">|</span>150<span class="bg_bar">|</span>160<span class="bg_bar">|</span>201<span class="bg_bar">|</span>260<span class="bg_bar">|</span>262<span class="bg_bar">|</span>270<span class="bg_bar">|</span>271A<span class="bg_bar">|</span>271B<span class="bg_bar">|</span>273<span class="bg_bar">|</span>370<span class="bg_bar">|</span>470<span class="bg_bar">|</span>601<span class="bg_bar">|</span>720<span class="bg_bar">|</span>721<span class="bg_bar">|</span>741<span class="bg_bar">|</span>N15<span class="txt_bustype">(심야)</span><span class="bg_bar">|</span>N26<span class="txt_bustype">(심야)</span><span class="bg_bar">|</span>N37<span class="txt_bustype">(심야)</span><span class="bg_bar">|</span>N62<span class="txt_bustype">(심야)</span></span>
                                    <a href="https://map.kakao.com?busStopId=BS404755" target="_blank" class="btn_more" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                            <li>
                                <em class="ico_traffic bus_green">지선</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">7212</span>
                                    <a href="https://map.kakao.com?busStopId=BS404755" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                            <li>
                                <em class="ico_traffic bus_direct">직행</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">9301</span>
                                    <a href="https://map.kakao.com?busStopId=BS404755" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                    </ul>
                </div>
                <div class="ride_wayout"><!-- 지도에서 일치하는 정류장에 마우스 오버 했을 때 클래스 ride_on 추가 -->
                    <strong class="tit_wayout">
                        <a href="https://map.kakao.com?busStopId=11010611010" class="link_wayout" target="_blank" data-logtarget="" data-logevent="waytogo,busstop">
                            <span class="txt_busstop">청계1가.광교</span>
                            <span class="txt_number"><span class="screen_out">정류장 번호: </span>(01174) <span class="bg_bar">|</span> <span class="screen_out">거리: </span> 283m</span>
                        </a>
                    </strong>
                    <ul class="list_ride">
                            <li>
                                <em class="ico_traffic bus_blue">간선</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">173</span>
                                    <a href="https://map.kakao.com?busStopId=11010611010" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                    </ul>
                </div>
                <div class="ride_wayout"><!-- 지도에서 일치하는 정류장에 마우스 오버 했을 때 클래스 ride_on 추가 -->
                    <strong class="tit_wayout">
                        <a href="https://map.kakao.com?busStopId=BS29592" class="link_wayout" target="_blank" data-logtarget="" data-logevent="waytogo,busstop">
                            <span class="txt_busstop">종로1가</span>
                            <span class="txt_number"><span class="screen_out">정류장 번호: </span>(01763) <span class="bg_bar">|</span> <span class="screen_out">거리: </span> 289m</span>
                        </a>
                    </strong>
                    <ul class="list_ride">
                            <li>
                                <em class="ico_traffic bus_blue">간선</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">109<span class="bg_bar">|</span>606</span>
                                    <a href="https://map.kakao.com?busStopId=BS29592" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                            <li>
                                <em class="ico_traffic bus_green">지선</em><!-- 버스 선별로 대체 텍스트 부탁 드립니다. -->
                                <div class="bus_ride">
                                    <span class="num_ride">1020</span>
                                    <a href="https://map.kakao.com?busStopId=BS29592" target="_blank" class="btn_more hide" data-logtarget="" data-logevent="waytogo,busstop_more"><span class="ico_comm ico_more">더보기</span></a>
                                </div>
                            </li>
                    </ul>
                </div>
        </div>


    </div>

</body>

<!-- https://place.map.kakao.com/main/v/25406298 -->
