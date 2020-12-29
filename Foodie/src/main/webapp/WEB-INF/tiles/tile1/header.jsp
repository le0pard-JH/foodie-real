<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.net.InetAddress"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String ctxPath = request.getContextPath(); %>

<script type="text/javascript">

	
	$(document).ready(function(){
		$("input#searchWord").focus();
		
		
		$("input#searchWord").keyup(function(event){
			if(event.keyCode == 13) {
				// 엔터를 했을 경우 
				goSearch();
			}
		});
		
		
		
	});// end of $(document).ready(function(){})-------------------------------------------------- 
	
	 
	
function goSearch() {
	
		if( $("input#searchWord").val() == "" || $("input#searchWord").val() == null){
			alert('검색어를 입력하세요.');
			return;
		}
	
		
	
	var frm = document.searchFrm;
	frm.method = "GET";
	frm.action = "<%= request.getContextPath()%>/list.food";
	frm.submit();
	
	
}// end of function goSearch() {}-----------------------

</script>

 <!-- Header Section Begin -->
    <header class="header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                <!-- 로고 -->
                    <div class="header__logo">
                        <a href="./index.food"><img src="<%=ctxPath %>/resources/images/foodie_logo.png" style="width:200px; height:100px;"alt=""></a>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9">
                    <div class="header__nav">
                    <!-- 헤더 기능 버튼 -->
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="<%=ctxPath %>/index.foodie">Home</a></li>
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
    <section class="hero set-bg" data-setbg="<%=ctxPath %>/resources/img/hero/hero-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="hero__text">
                    
                    <!-- 머릿말 -->
                        <div class="section-title">
                            <h3 style="margin-top: 20px; color:white;">솔직한 리뷰, 믿을 수 있는 평점! </h3>
                            <br>
                            <h3 style="color:white;">Foodie</h3>
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
                                <input type="text" name="searchWord" id="searchWord" placeholder="검색어를 입력하세요.">
                                <button type="button" id="btnSearch" onclick="goSearch()">검색</button>
                            </form>
                            <!-- <div id="displayList" style="border:solid 0px gray; float:right; border-top:0px; width:600px; height:150px; margin-left:70px; margin-top:-1px; overflow:auto;"></div> -->
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Header Section End -->