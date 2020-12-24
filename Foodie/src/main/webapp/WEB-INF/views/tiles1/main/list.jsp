<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Get it Foodie!</title>
    
    
    <!-- css Styles -->
    <link rel="stylesheet" href="<%=ctxPath %>/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=ctxPath %>/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=ctxPath %>/resources/ss/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=ctxPath %>/resources/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="<%=ctxPath %>/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=ctxPath %>/resources/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="<%=ctxPath %>/resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="<%=ctxPath %>/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="<%=ctxPath %>/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=ctxPath %>/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=ctxPath %>/resources/css/style.css" type="text/css">

</head>

<body >
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
<!-- Filter Begin -->
<!--
    <div class="filter nice-scroll">
        <div class="filter__title">
            <h5><i class="fa fa-filter"></i> Filter</h5>
        </div>
        <div class="filter__search">
            <input type="text">
        </div>
        <div class="filter__select">
            <select>
                <option value="">All Categories</option>
            </select>
        </div>
        <div class="filter__location">
            <input type="text" placeholder="Location">
            <i class="fa fa-map-marker"></i>
        </div>
        <div class="filter__radius">
            <p>Radius:</p>
            <div class="price-range-wrap">
                <div
                    class="price-range-radius ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content">
                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                </div>
                <div class="range-slider">
                    <div class="price-input">
                        <input type="text" id="radius">
                    </div>
                </div>
            </div>
        </div>
        <div class="filter__price">
            <p>Price:</p>
            <div class="price-range-wrap">
                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content">
                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                </div>
                <div class="range-slider">
                    <div class="price-input">
                        <input type="text" id="minamount">
                        <input type="text" id="maxamount" value="$80">
                    </div>
                </div>
            </div>
        </div>
        <div class="filter__tags">
            <h6>Tag</h6>
            <label for="coupon">
                Coupons
                <input type="checkbox" id="coupon">
                <span class="checkmark"></span>
            </label>
            <label for="sa">
                Smoking Allowed
                <input type="checkbox" id="sa">
                <span class="checkmark"></span>
            </label>
            <label for="camping">
                Camping
                <input type="checkbox" id="camping">
                <span class="checkmark"></span>
            </label>
            <label for="hot-spots">
                Hot Spots
                <input type="checkbox" id="hot-spots">
                <span class="checkmark"></span>
            </label>
            <label for="internet">
                Internet
                <input type="checkbox" id="internet">
                <span class="checkmark"></span>
            </label>
            <label for="tr">
                Top Rated
                <input type="checkbox" id="tr">
                <span class="checkmark"></span>
            </label>
            <label for="hd">
                Hot Deal
                <input type="checkbox" id="hd">
                <span class="checkmark"></span>
            </label>
        </div>
        <div class="filter__btns">
            <button type="submit">Filter Results</button>
            <button type="submit" class="filter__reset">Reset All</button>
        </div>
    </div>
    <!-- Filter End -->
-->
    <!-- Listing Section Begin -->
    <section class="listing nice-scroll">
        <div class="listing__text__top">
            <div class="listing__text__top__left">
                <h5>검색결과 List</h5>
                <span>18 Results Found</span>
            </div>
            <div class="listing__text__top__right">근처순 <i class="fa fa-sort-amount-asc"></i></div>
        </div>
        <div class="listing__list">
            
      	  <c:forEach var="searchList" items="${searchList}" >
      	    <div class="listing__item">
                <div class="listing__item__text">
                    <div class="listing__item__text__inside">
                        <h5>${searchList.name}</h5>
                        <div class="listing__item__text__rating">
                            <div class="listing__item__rating__star">
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star-half_alt"></span>
                            </div>
                            <h6>$40 - $70</h6>
                        </div>
                        <ul>
                            <li>
                            <span class="icon_pin_alt"></span> 
                            우편번호-${searchList.postcode} 
                            <br>
                            ${searchList.address}
                             </li>
                            <li>
                            <span class="icon_phone"></span>
                            ${searchList.call}
                            </li>
                        </ul>
                    </div>
                    <div class="listing__item__text__info">
                        <div class="listing__item__text__info__left">
                            <img src="img/listing/list_small_icon-2.png" alt="">
                            <span>${searchList.hygine}</span>
                        </div>
                        <div class="listing__item__text__info__right closed">${searchList.open_status}</div>
                    </div>
                </div>
            </div>  
      	  </c:forEach> 
        </div>
    </section>
    <!-- Listing Section End -->
    
  	<div id = "mycontent">
    <!-- Map Begin -->
  
    <div class="listing__map">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d423283.43556031643!2d-118.69192431097179!3d34.020730495817475!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c75ddc27da13%3A0xe22fdf6f254608f4!2sLos%20Angeles%2C%20CA%2C%20USA!5e0!3m2!1sen!2sbd!4v1586670019340!5m2!1sen!2sbd" 
            style="border:0; width: 80%; height:250%;" allowfullscreen="" aria-hidden="false" tabindex="0">
        </iframe>
    </div>
    <!-- Map End -->
	</div>
   
    <!-- Js Plugins -->
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
</body>



