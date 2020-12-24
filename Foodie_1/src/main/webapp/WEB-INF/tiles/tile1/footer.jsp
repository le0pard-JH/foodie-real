<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- === #24. tiles 를 사용하는 레이아웃1 페이지 만들기 === --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<%
	String ctxPath = request.getContextPath();
%>    

<%-- ======= #27. tile1 중 footer 페이지 만들기  ======= --%>


<!-- Footer Section Begin -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="footer__about">
                    <!-- Footer 로고 -->
                        <div class="footer__about__logo">
                            <a href="./index.html"><img src="<%=ctxPath %>/resources/img/footer-logo.png" alt=""></a>
                        </div>
                        <p>Eat, Share, Be Happy.</p>
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-1 col-md-6">
                    <div class="footer__address">
                        <ul>
                            <li>
                                <span>연락처:</span>
                                <p>(+12) 345-678-910</p>
                            </li>
                            <li>
                                <span>Email:</span>
                                <p>Foodie@gmail .com</p>
                            </li>
                            <li>
                                <span>Fax:</span>
                                <p>(+12) 345-678-910</p>
                            </li>
                            <!--  sns 로고 
                            <li>
                                <span>Connect Us:</span>
                                <div class="footer__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-skype"></i></a>
                                </div>
                            </li>
                            -->
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1 col-md-6">
                    <div class="footer__widget">
                        <ul>
                            <li><a href="#">회사소개</a></li>
                            <li><a href="#">투자정보</a></li>
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">이용약관</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">개인정보처리방침</a></li>
                            <li><a href="#">위치기반서비스</a></li>
                            <li><a href="#">커뮤니티</a></li>
                            <li><a href="#">문의하기</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;2020 Foodie Co., Ltd. All rights reserved.
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                        </div>
                        <div class="footer__copyright__links">
                            <ul style="list-style-type: none; font-size: 10pt;">
                            	<li>(주)푸디</li>
                            	<li>서울특별시 마포구 서교동 447-5 풍성빌딩 2,3,4층</li>
                            	<li>강사:SEO YOUNG HAK(서영학)</li>
                            	<li>연락처:02-336-8546</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->