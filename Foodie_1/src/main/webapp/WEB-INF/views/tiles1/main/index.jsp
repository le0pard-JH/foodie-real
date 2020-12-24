<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%
	String ctxPath = request.getContextPath();
  //       /board 
%>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Directing | Template</title>
    
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Categories Section Begin -->
    <section class="categories spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Most Popular Categories</h2>
                        <p>Travelocity empowers travelers who are giving back on their trips in ways big and small</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Most Search Section Begin -->
    <section class="most-search spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>The Most Searched Services</h2>
                        <p>Travelocity empowers travelers who are giving back on their trips in ways big and small</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="most__search__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                    <span class="flaticon-039-fork"></span>
                                    Restaurent
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">
                                    <span class="flaticon-030-kebab"></span>
                                    Shopping
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">
                                    <span class="flaticon-032-food-truck"></span>
                                    Travel
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">
                                    <span class="flaticon-017-croissant"></span>
                                    Beauty
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-5" role="tab">
                                    <span class="flaticon-038-take-away"></span>
                                    Event
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">
                                    <span class="flaticon-031-delivery"></span>
                                    Rental
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-1.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-1.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Chinese Sausage Restaurant</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 236 Littleton St. New
                                                        Philadelphia, Ohio, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>Restaurant</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-2.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-2.png" alt="">
                                            <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Shrimp floured and fried</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 1012 Vesper Dr. Columbus,
                                                        Georgia(GA), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-2.png" alt="">
                                                    <span>Food & Drink</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">Closed</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-3.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-3.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Sweet and sour pork ribs</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 251 Wiley St. Forks,
                                                        Washington(WA), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>Restaurant</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-4.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-4.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Crab fried with tamarind</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 14320 Keenes Mill Rd.
                                                        Cottondale, Alabama(AL), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>Hotel</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">Closed</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-5.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-5.png" alt="">
                                            <div class="listing__item__pic__tag hot_deal">Hot Deal</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Tortoise grilled on salt</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 236 Littleton St. New
                                                        Philadelphia, Ohio, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-4.png" alt="">
                                                    <span>Shopping</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-6.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-6.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Fish cooked with fishsauce</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 2604 E Drachman St. Tucson,
                                                        Arizona, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>Hotel</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-1.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-1.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Chinese Sausage Restaurant</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 236 Littleton St. New
                                                        Philadelphia, Ohio, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>Restaurant</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-2.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-2.png" alt="">
                                            <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Shrimp floured and fried</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 1012 Vesper Dr. Columbus,
                                                        Georgia(GA), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-2.png" alt="">
                                                    <span>Food & Drink</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">Closed</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-3.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-3.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Sweet and sour pork ribs</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 251 Wiley St. Forks,
                                                        Washington(WA), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>Restaurant</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-4.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-4.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Crab fried with tamarind</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 14320 Keenes Mill Rd.
                                                        Cottondale, Alabama(AL), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>Hotel</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">Closed</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-5.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-5.png" alt="">
                                            <div class="listing__item__pic__tag hot_deal">Hot Deal</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Tortoise grilled on salt</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 236 Littleton St. New
                                                        Philadelphia, Ohio, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-4.png" alt="">
                                                    <span>Shopping</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-3.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-3.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Sweet and sour pork ribs</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 251 Wiley St. Forks,
                                                        Washington(WA), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>Restaurant</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-4.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-4.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Crab fried with tamarind</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 14320 Keenes Mill Rd.
                                                        Cottondale, Alabama(AL), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>Hotel</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">Closed</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-5.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-5.png" alt="">
                                            <div class="listing__item__pic__tag hot_deal">Hot Deal</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Tortoise grilled on salt</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 236 Littleton St. New
                                                        Philadelphia, Ohio, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-4.png" alt="">
                                                    <span>Shopping</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-6.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-6.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Fish cooked with fishsauce</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 2604 E Drachman St. Tucson,
                                                        Arizona, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>Hotel</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-4" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-1.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-1.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Chinese Sausage Restaurant</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 236 Littleton St. New
                                                        Philadelphia, Ohio, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>Restaurant</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-2.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-2.png" alt="">
                                            <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Shrimp floured and fried</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 1012 Vesper Dr. Columbus,
                                                        Georgia(GA), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-2.png" alt="">
                                                    <span>Food & Drink</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">Closed</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-3.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-3.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Sweet and sour pork ribs</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 251 Wiley St. Forks,
                                                        Washington(WA), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>Restaurant</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-6.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-6.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Fish cooked with fishsauce</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 2604 E Drachman St. Tucson,
                                                        Arizona, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>Hotel</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-5" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-1.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-1.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Chinese Sausage Restaurant</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 236 Littleton St. New
                                                        Philadelphia, Ohio, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>Restaurant</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-2.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-2.png" alt="">
                                            <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Shrimp floured and fried</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 1012 Vesper Dr. Columbus,
                                                        Georgia(GA), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-2.png" alt="">
                                                    <span>Food & Drink</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">Closed</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-3.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-3.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Sweet and sour pork ribs</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 251 Wiley St. Forks,
                                                        Washington(WA), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>Restaurant</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-4.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-4.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Crab fried with tamarind</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 14320 Keenes Mill Rd.
                                                        Cottondale, Alabama(AL), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>Hotel</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">Closed</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-6.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-6.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Fish cooked with fishsauce</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 2604 E Drachman St. Tucson,
                                                        Arizona, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>Hotel</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-6" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-1.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-1.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Chinese Sausage Restaurant</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 236 Littleton St. New
                                                        Philadelphia, Ohio, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>Restaurant</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-2.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-2.png" alt="">
                                            <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Shrimp floured and fried</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 1012 Vesper Dr. Columbus,
                                                        Georgia(GA), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-2.png" alt="">
                                                    <span>Food & Drink</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">Closed</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-4.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-4.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Crab fried with tamarind</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 14320 Keenes Mill Rd.
                                                        Cottondale, Alabama(AL), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>Hotel</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">Closed</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-5.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-5.png" alt="">
                                            <div class="listing__item__pic__tag hot_deal">Hot Deal</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Tortoise grilled on salt</h5>
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
                                                    <li><span class="icon_pin_alt"></span> 236 Littleton St. New
                                                        Philadelphia, Ohio, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-4.png" alt="">
                                                    <span>Shopping</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Most Search Section End -->

    <!-- Work Section Begin -->
    <section class="work spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>How Does It Work</h2>
                        <p>Travelocity empowers travelers who are giving back on their trips in ways big and small</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="work__item">
                        <div class="work__item__number">01.</div>
                        <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/work/work-1.png" alt="">
                        <h5>Location & Categories</h5>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                            labore.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="work__item">
                        <div class="work__item__number">02.</div>
                        <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/work/work-2.png" alt="">
                        <h5>Explore Listting</h5>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                            labore.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="work__item">
                        <div class="work__item__number">03.</div>
                        <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/work/work-3.png" alt="">
                        <h5>Making Appointments</h5>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                            labore.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Work Section End -->

    <!-- Feature Location Section Begin -->
    <section class="feature-location spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Top Featured Locations</h2>
                        <p>Explore restaurants, bars, and cafés by locality</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <a href="#" class="feature__location__item large-item set-bg"
                        data-setbg="<%=ctxPath %>/resources/img/feature-location/fl-1.jpg">
                        <div class="feature__location__item__text">
                            <h5>Washington, D.C</h5>
                            <ul>
                                <li>2045 Listings</li>
                                <li>3648 Users</li>
                            </ul>
                        </div>
                    </a>
                </div>
                <div class="col-lg-6">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <a href="#" class="feature__location__item set-bg"
                                data-setbg="<%=ctxPath %>/resources/img/feature-location/fl-2.jpg">
                                <div class="feature__location__item__text">
                                    <h5>Chicago</h5>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <a href="#" class="feature__location__item set-bg"
                                data-setbg="<%=ctxPath %>/resources/img/feature-location/fl-3.jpg">
                                <div class="feature__location__item__text">
                                    <h5>San Antonio</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                    <a href="#" class="feature__location__item set-bg" data-setbg="<%=ctxPath %>/resources/img/feature-location/fl-4.jpg">
                        <div class="feature__location__item__text">
                            <h5>Los Angeles</h5>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>
    <!-- Feature Location Section End -->

    <!-- Testimonial Section Begin -->
    <section class="testimonial spad set-bg" data-setbg="<%=ctxPath %>/resources/img/testimonial/testimonial-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Trusted By Over 5000+ User</h2>
                        <p>What people say about us</p>
                    </div>
                    <div class="testimonial__slider owl-carousel">
                        <div class="testimonial__item" data-hash="review-1">
                            <p>" We worked with Consultant. Our representative was very knowledgeable and helpful.
                                Consultant made a number of suggestions to help improve our systems. Consultant
                                explained how things work and why it would help."</p>
                            <div class="testimonial__item__author">
                                <a href="#review-3"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-3.png" alt=""></a>
                                <a href="#review-1" class="active"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-1.png" alt=""></a>
                                <a href="#review-2"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-2.png" alt=""></a>
                            </div>
                            <div class="testimonial__item__author__text">
                                <h5>John Smith -</h5>
                                <div class="testimonial__item__author__rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            </div>
                            <span>CEO Colorlib</span>
                        </div>
                        <div class="testimonial__item" data-hash="review-2">
                            <p>" We worked with Consultant. Our representative was very knowledgeable and helpful.
                                Consultant made a number of suggestions to help improve our systems. Consultant
                                explained how things work and why it would help."</p>
                            <div class="testimonial__item__author">
                                <a href="#review-1"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-1.png" alt=""></a>
                                <a href="#review-2" class="active"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-2.png" alt=""></a>
                                <a href="#review-3"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-3.png" alt=""></a>
                            </div>
                            <div class="testimonial__item__author__text">
                                <h5>John Smith -</h5>
                                <div class="testimonial__item__author__rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            </div>
                            <span>CEO Colorlib</span>
                        </div>
                        <div class="testimonial__item" data-hash="review-3">
                            <p>" We worked with Consultant. Our representative was very knowledgeable and helpful.
                                Consultant made a number of suggestions to help improve our systems. Consultant
                                explained how things work and why it would help."</p>
                            <div class="testimonial__item__author">
                                <a href="#review-2"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-2.png" alt=""></a>
                                <a href="#review-3" class="active"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-3.png" alt=""></a>
                                <a href="#review-1"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-1.png" alt=""></a>
                            </div>
                            <div class="testimonial__item__author__text">
                                <h5>John Smith -</h5>
                                <div class="testimonial__item__author__rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            </div>
                            <span>CEO Colorlib</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonial Section End -->

    <!-- Blog Section Begin -->
    <section class="news-post spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>News Post</h2>
                        <p>Checkout Latest News And Articles From Our Blog</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/blog/blog-1.jpg">
                            <a href="https://www.youtube.com/watch?v=8EJ3zbKTWQ8" class="play-btn video-popup"><i class="fa fa-play"></i></a>
                        </div>
                        <div class="blog__item__text">
                            <ul class="blog__item__tags">
                                <li><i class="fa fa-tags"></i> Travel</li>
                                <li>Videos</li>
                            </ul>
                            <h5><a href="#">Internet Banner Advertising Most Reliable</a></h5>
                            <ul class="blog__item__widget">
                                <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                <li><i class="fa fa-user"></i> John Smith</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/blog/blog-2.jpg"></div>
                        <div class="blog__item__text">
                            <ul class="blog__item__tags">
                                <li><i class="fa fa-tags"></i> Travel</li>
                                <li>Restaurant</li>
                            </ul>
                            <h5><a href="#">Internet Banner Advertising Most Reliable</a></h5>
                            <ul class="blog__item__widget">
                                <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                <li><i class="fa fa-user"></i> John Smith</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/blog/blog-3.jpg"></div>
                        <div class="blog__item__text">
                            <ul class="blog__item__tags">
                                <li><i class="fa fa-tags"></i> Travel</li>
                                <li>Restaurant</li>
                            </ul>
                            <h5><a href="#">Internet Banner Advertising Most Reliable</a></h5>
                            <ul class="blog__item__widget">
                                <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                <li><i class="fa fa-user"></i> John Smith</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

    <!-- Newslatter Section Begin -->
    <section class="newslatter">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="newslatter__text">
                        <h3>Subscribe Newsletter</h3>
                        <p>Subscribe to our newsletter and don’t miss anything</p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <form action="#" class="newslatter__form">
                        <input type="text" placeholder="Your email">
                        <button type="submit">Subscribe</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Newslatter Section End -->

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

