<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String ctxPath = request.getContextPath(); 
%>

<!DOCTYPE html>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Listing Section Begin -->
    <section class="listing-hero set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/details/listing-hero.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="listing__hero__option">
                        <div class="listing__hero__icon">
                            <img src="<%=ctxPath %>/resources/img/listing/details/ld-icon.png">
                        </div>
                        <div class="listing__hero__text">
                            <h2>${svo.name}</h2>
                            
                            <p><span class="icon_pin_alt"></span> ${svo.address}</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="listing__hero__btns">
                        <a href="#" class="primary-btn"><i class="fa fa-bookmark"></i> 가고싶다</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Listing Section End -->

    <!-- Listing Details Section Begin -->
    <section class="listing-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="listing__details__text">
                        <div class="listing__details__gallery">
                            <h4>Gallery</h4>
                            <div class="listing__details__gallery__pic">
                                <div class="listing__details__gallery__item">
                                    <img class="listing__details__gallery__item__large"
                                        src="<%=ctxPath %>/resources/img/listing/details/listing-details-1.jpg" alt="">
                                    <span><i class="fa fa-camera"></i> 170 Image</span>
                                </div>
                                <div class="listing__details__gallery__slider owl-carousel">
                                    <img data-imgbigurl="<%=ctxPath %>/resources/img/listing/details/listing-details-1.jpg"
                                        src="<%=ctxPath %>/resources/img/listing/details/thumb-1.jpg" alt="">
                                    <img data-imgbigurl="<%=ctxPath %>/resources/img/listing/details/listing-details-1.jpg"
                                        src="<%=ctxPath %>/resources/img/listing/details/thumb-2.jpg" alt="">
                                    <img data-imgbigurl="<%=ctxPath %>/resources/img/listing/details/listing-details-1.jpg"
                                        src="<%=ctxPath %>/resources/img/listing/details/thumb-3.jpg" alt="">
                                    <img data-imgbigurl="<%=ctxPath %>/resources/img/listing/details/listing-details-1.jpg"
                                        src="<%=ctxPath %>/resources/img/listing/details/thumb-4.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="listing__details__amenities">
                            <h4>Amenities</h4>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="listing__details__amenities__item">
                                        <img src="<%=ctxPath %>/resources/img/listing/details/amenities/ame-1.png" alt="">
                                        <h6>Accept Credit Card</h6>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="listing__details__amenities__item">
                                        <img src="<%=ctxPath %>/resources/img/listing/details/amenities/ame-2.png" alt="">
                                        <h6>Free Wifi</h6>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="listing__details__amenities__item">
                                        <img src="<%=ctxPath %>/resources/img/listing/details/amenities/ame-3.png" alt="">
                                        <h6>Smoking Area</h6>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="listing__details__amenities__item">
                                        <img src="<%=ctxPath %>/resources/img/listing/details/amenities/ame-4.png" alt="">
                                        <h6>Free Parking</h6>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="listing__details__amenities__item">
                                        <img src="<%=ctxPath %>/resources/img/listing/details/amenities/ame-5.png" alt="">
                                        <h6>Family Friendly</h6>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="listing__details__amenities__item">
                                        <img src="<%=ctxPath %>/resources/img/listing/details/amenities/ame-6.png" alt="">
                                        <h6>Coffee</h6>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="listing__details__amenities__item">
                                        <img src="<%=ctxPath %>/resources/img/listing/details/amenities/ame-7.png" alt="">
                                        <h6>Massage</h6>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="listing__details__amenities__item">
                                        <img src="<%=ctxPath %>/resources/img/listing/details/amenities/ame-8.png" alt="">
                                        <h6>Coupons</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="listing__details__rating">
                            <h4>Rate</h4>
                            <div class="listing__details__rating__overall">
                                <h2>4.7</h2>
                                <div class="listing__details__rating__star">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                </div>
                                <span>(120 Rating)</span>
                            </div>
                            <div class="listing__details__rating__bar">
                                <div class="listing__details__rating__bar__item">
                                    <span>4.4</span>
                                    <div id="bar1" class="barfiller">
                                        <span class="fill" data-percentage="100"></span>
                                    </div>
                                    <span class="right">Quality</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>3.9</span>
                                    <div id="bar2" class="barfiller">
                                        <span class="fill" data-percentage="75"></span>
                                    </div>
                                    <span class="right">Price</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>4.2</span>
                                    <div id="bar3" class="barfiller">
                                        <span class="fill" data-percentage="80"></span>
                                    </div>
                                    <span class="right">Space</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>4.8</span>
                                    <div id="bar4" class="barfiller">
                                        <span class="fill" data-percentage="80"></span>
                                    </div>
                                    <span class="right">Service</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>4.0</span>
                                    <div id="bar5" class="barfiller">
                                        <span class="fill" data-percentage="85"></span>
                                    </div>
                                    <span class="right">Location</span>
                                </div>
                            </div>
                        </div>
                        <div class="listing__details__comment">
                            <h4>Comment</h4>
                            <div class="listing__details__comment__item">
                                <div class="listing__details__comment__item__pic">
                                    <img src="<%=ctxPath %>/resources/img/listing/details/comment.png" alt="">
                                </div>
                                <div class="listing__details__comment__item__text">
                                    <div class="listing__details__comment__item__rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <span>March 22, 2019</span>
                                    <h5>Marry Jane</h5>
                                    <p>From ships to airports, museums to burger vans, from revered Michelin star
                                        establish to the fleeting dynamism of pop-ups.</p>
                                    <ul>
                                        <li><i class="fa fa-hand-o-right"></i> Like</li>
                                        <li><i class="fa fa-share-square-o"></i> Reply</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="listing__details__comment__item">
                                <div class="listing__details__comment__item__pic">
                                    <img src="<%=ctxPath %>/resources/img/listing/details/comment.png" alt="">
                                </div>
                                <div class="listing__details__comment__item__text">
                                    <div class="listing__details__comment__item__rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <span>March 22, 2019</span>
                                    <h5>Marry Jane</h5>
                                    <p>From ships to airports, museums to burger vans, from revered Michelin star
                                        establish to the fleeting dynamism of pop-ups.</p>
                                    <ul>
                                        <li><i class="fa fa-hand-o-right"></i> Like</li>
                                        <li><i class="fa fa-share-square-o"></i> Reply</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="listing__details__comment__item">
                                <div class="listing__details__comment__item__pic">
                                    <img src="<%=ctxPath %>/resources/img/listing/details/comment.png" alt="">
                                </div>
                                <div class="listing__details__comment__item__text">
                                    <div class="listing__details__comment__item__rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <span>March 22, 2019</span>
                                    <h5>Marry Jane</h5>
                                    <p>From ships to airports, museums to burger vans, from revered Michelin star
                                        establish to the fleeting dynamism of pop-ups.</p>
                                    <ul>
                                        <li><i class="fa fa-hand-o-right"></i> Like</li>
                                        <li><i class="fa fa-share-square-o"></i> Reply</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="listing__details__review">
                            <h4>Add Review</h4>
                            <form action="#">
                                <input type="text" placeholder="Name">
                                <input type="text" placeholder="Email">
                                <textarea placeholder="Review"></textarea>
                                <button type="submit" class="site-btn">Submit Now</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="listing__sidebar">
                        <div class="listing__sidebar__contact">
                            <div class="listing__sidebar__contact__map">
                                <iframe
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d24168.833995532765!2d-74.79633710628465!3d40.78172222265886!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c384de7a5300b9%3A0x8afc61979217d49d!2sLong%20Valley%2C%20NJ%2007853%2C%20USA!5e0!3m2!1sen!2sbd!4v1586852528126!5m2!1sen!2sbd"
                                    height="200" style="border:0;" allowfullscreen="" aria-hidden="false"
                                    tabindex="0"></iframe>
                                <img src="<%=ctxPath %>/resources/img/listing/details/map-icon.png" alt="">
                            </div>
                            <div class="listing__sidebar__contact__text">
                                <h4>Contacts</h4>
                                <ul>
                                    <li><span class="icon_pin_alt"></span> 236 Littleton St. New Philadelphia, Ohio,
                                        United States</li>
                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                    <li><span class="icon_mail_alt"></span> Info.colorlib@gmail.com</li>
                                    <li><span class="icon_globe-2"></span> https://colorlib.com</li>
                                </ul>
                                <div class="listing__sidebar__contact__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
                                    <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                                    <a href="#" class="google"><i class="fa fa-google"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="listing__sidebar__working__hours">
                            <h4>Working Hours</h4>
                            <ul>
                                <li>Monday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Tuesday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Wednesday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Thursday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Friday <span class="opening">Opening</span></li>
                                <li>Saturday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Saturday <span class="closed">Closed</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Listing Details Section End -->

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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<style>
	
	$("#star0").click(function() {
	
         reviewnum = 1;
         $("#star0").css("color", "#efef4e");
         $("#star1").css("color", "gray");
         $("#star2").css("color", "gray");
         $("#star3").css("color", "gray");
         $("#star4").css("color", "gray");
         $(".inputs").text(reviewnum);
         $("#starnums").val(reviewnum);
      });

      $("#star1").click(function() {
         reviewnum = 2;
         $("#star0").css("color", "#efef4e");
         $("#star1").css("color", "#efef4e");
         $("#star2").css("color", "gray");
         $("#star3").css("color", "gray");
         $("#star4").css("color", "gray");
         $(".inputs").text(reviewnum);
         $("#starnums").val(reviewnum);
      });
      
      $("#star2").click(function() {
         reviewnum = 3;
         $("#star0").css("color", "#efef4e");
         $("#star1").css("color", "#efef4e");
         $("#star2").css("color", "#efef4e");
         $("#star3").css("color", "gray");
         $("#star4").css("color", "gray");
         $(".inputs").text(reviewnum);
         $("#starnums").val(reviewnum);
      });
      
      $("#star3").click(function() {
         reviewnum = 4;
         $("#star0").css("color", "#efef4e");
         $("#star1").css("color", "#efef4e");
         $("#star2").css("color", "#efef4e");
         $("#star3").css("color", "#efef4e");
         $("#star4").css("color", "gray");
         $(".inputs").text(reviewnum);
         $("#starnums").val(reviewnum);
      });
      
      $("#star4").click(function() {
         reviewnum = 5;
         $("#star0").css("color", "#efef4e");
         $("#star1").css("color", "#efef4e");
         $("#star2").css("color", "#efef4e");
         $("#star3").css("color", "#efef4e");
         $("#star4").css("color", "#efef4e");
         $(".inputs").text(reviewnum);
         $("#starnums").val(reviewnum);
      });
	

	</style>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=adf2708493f00cbb2f18296dc2c60b88"></script>	
 <script type="text/javascript">
 
 	
 	var store_id="290249009";
 	var basicInfo="";
 	var menuInfo="";
 	var menuList="";
 	
 	var blogReview="";
 	var comment="";
 	
 	var photo="";
 	var s2graph="";
 	var feedback="";
 	
 	
 	
 	$(document).ready(function () {
		
 		
 		goViewJson();

 		getComment();
 		
 		
 		
 		  // 지도를 담을 영역의 DOM 레퍼런스 
        var mapContainer = document.getElementById('map');
        
        // 지도를 생성할때 필요한 기본 옵션
        var options = {
               center: new kakao.maps.LatLng(37.56602747782394, 126.98265938959321), // 지도의 중심좌표. 반드시 존재해야함.
            level: 4 // 지도의 레벨(확대, 축소 정도). 숫자가 적을수록 확대된다. 4가 적당함.
        };
 
          
        // 지도 생성 및 생성된 지도객체 리턴
        var mapobj = new kakao.maps.Map(mapContainer, options);
        
        // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성함.    
        var mapTypeControl = new kakao.maps.MapTypeControl();
        
        // 지도 타입 컨트롤을 지도에 표시함.
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미함.   
        mapobj.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
        
        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성함.   
        var zoomControl = new kakao.maps.ZoomControl();
        
        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 지도에 표시함.
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 RIGHT는 오른쪽을 의미함.    
        mapobj.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
        
        if(navigator.geolocation) {
           // HTML5의 geolocation 으로 사용할 수 있는지 확인한다.
           
           // GeoLocation을 이용해서 웹페이지에 접속한 사용자의 현재 위치를 확인하여 그 위치(위도,경도)를 지도의 중앙에 오도록 한다.
           navigator.geolocation.getCurrentPosition(function(position) { 

              
              var latitude = position.coords.latitude;   // 현위치의 위도
              var longitude = position.coords.longitude; // 현위치의 경도
           
              
              
            // 마커가 표시될 위치를 geolocation으로 얻어온 현위치의 위.경도 좌표로 한다   
            
            	// 저기 안에다가 꽂아주면 위치가 알아서뜸
              /* var locPosition = new kakao.maps.LatLng(37.57777094158683, 126.97679253697846); */
              
              var locPosition = new kakao.maps.LatLng(37.57777094158683, 126.97679253697846);
              
             // 마커이미지의 크기 
               var imageSize = new kakao.maps.Size(34, 39);
                
            // 마커이미지의 옵션. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정한다. 
               var imageOption = {offset: new kakao.maps.Point(15, 39)};

            // 마커의 이미지정보를 가지고 있는 마커이미지를 생성한다. 
               var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
               
            // == 마커 생성하기 == //
              var marker = new kakao.maps.Marker({ 
                 map: mapobj, 
                   position: locPosition, // locPosition 좌표에 마커를 생성 
                   image: markerImage     // 마커이미지 설정
                   
             }); 
              
             marker.setMap(mapobj); // 지도에 마커를 표시한다
              // == 지도의 센터위치를 locPosition로 변경한다.(사이트에 접속한 클라이언트 컴퓨터의 현재의 위.경도로 변경한다.)
              mapobj.setCenter(locPosition);
           });
        }
        else {
           // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정한다.
           var locPosition = new kakao.maps.LatLng(37.556583,126.919557);     
             
          // 지도의 센터위치를 위에서 정적으로 입력한 위.경도로 변경한다.
            mapobj.setCenter(locPosition);
        }// end of if ~ else---------------------------------------------------
        
        
        // ================== 지도에 클릭 이벤트를 등록하기 ======================= //
        // 지도를 클릭하면 클릭한 위치에 마커를 표시하면서 위,경도를 보여주도록 한다.
        
        // == 마커 생성하기 == //
        // 1. 마커이미지 변경
        var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png';       
                
        // 2. 마커이미지의 크기 
         var imageSize = new kakao.maps.Size(34, 39);   
                 
         // 3. 마커이미지의 옵션. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정한다. 
         var imageOption = {offset: new kakao.maps.Point(15, 39)};   
           
         // 4. 이미지정보를 가지고 있는 마커이미지를 생성한다. 
         var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
               
         var movingMarker = new kakao.maps.Marker({ 
             map: mapobj, 
             image: markerImage  // 마커이미지 설정
        });
        
         

 	
 		
	}); // end of ready
 	

	
 	function goViewJson() {
		
		$.ajax({
			url:"/foodie/get/json.food",
			data:"",
			dataType:"JSON",
			success:function(json){
					
				
				basicInfo=json.basicInfo;
				blogReview=json.blogReview;
				comment=json.comment;
				menuInfo=json.menuInfo;
				menuList=menuInfo.menuList
				photo=json.photo;
				s2graph=json.s2graph;
				feedback=json.feedback;
				
				
				$("#adress_detail").text(basicInfo.address.region.fullname+basicInfo.address.newaddr.newaddrfull);
				
				$("a#page").text(basicInfo.homepage);
				$("#store_name").text(basicInfo.placenamefull);				
				$("label#adress_detail").text(basicInfo.address.region.fullname+basicInfo.address.newaddr.newaddrfull);
				$("label#email").text("");
				$("label#phone").text(basicInfo.phonenum);
				
				
				var scorercnt = comment.scorecnt;
				var scoresum = comment.scoresum;
				var allComntcnt = comment.allComntcnt;
				var score =scoresum/scorercnt;
				
				
				
				score=score.toFixed(1);
				
				$("div#commentscnt").text(comment.scorecnt);
				
				
					console.log(allComntcnt);
					console.log(score);
					console.log(json);
				 	console.log(basicInfo.placenamefull);
					console.log(blogReview);
					console.log(comment);
					console.log(menuInfo);
					console.log(photo);
					console.log(s2graph);
					
					
					
					
					html ="";
					html += "<span style='font-weight:bold; font-size:20pt; color:red;'>"+"메뉴"+"</span>";
					html += "<hr style='border:solid 1px gray;'>";
					$.each(menuInfo.menuList, function (index, item) {
						
						var menu=item.menu;
						var price=item.price;
						
						
						html += "<li style='list-style:none; font-weight:bold; font-size:18pt;'>"+menu+"  :   "+price+"<span>"+"&nbsp;원"+"</span>"+"</li>"+"<br>";
					});
					
					$("div#menuList").html(html);
					
					
					
					
					
					// ============= 사진부분 =============
					html ="";
					
					var mainphotourl=basicInfo.mainphotourl
					
					console.log(mainphotourl);
					
					$.each(menuInfo.menuList, function (index, item) {
						
	                     /* <img data-imgbigurl=mainphotourl src=resources/img/listing/details/thumb-1.jpg" alt=""> */
						
					});
					//$("div.listing__details__gallery__slider").html(html);
					
               
					
					
					
				},
				
				error : function(request, status, error) {

				}

			});

		}// end of function goViewJson(){}------------------------
		
		
	 	function getComment() {
			
			$.ajax({
				url:"/foodie/readComment.food",
				data:{"code":"290249009"},
				type:"GET",
				dataType:"JSON",
				success:function(json){
						
				
					var html = "";
					
					if(json.length > 0) {
						$.each(json, function(index, item){
							
							
						html +=	"<div class='listing__details__comment__item' style='margin-bottom: 0px;'>";
						html +=	"<div class='listing__details__comment__item__pic'>";
                            
                        html += "<img src='<%=ctxPath %>/resources/img/listing/details/comment.png' alt=''>";
                        html += "</div>";
                            
                        html += "<div class='listing__details__comment__item__text'>";
                        html += "<div class='listing__details__comment__item__rating'>";
                        html += "<i class='fa fa-star'></i>";
                        html += "<i class='fa fa-star'></i>";
                        html += "<i class='fa fa-star'></i>";
                        html += "<i class='fa fa-star'></i>";
                        html += "<i class='fa fa-star'></i>";
                        html += "</div>"; 
                                
						
                        html += "<span>"+item.regDate+"</span>";
                        html += "<h5>"+item.name+"</h5>";
                        html += "<p>"+item.content+"</p>";  
                        html += "<ul><li><i onclick='addLike("+item.seq+");' class='fa fa-hand-o-right'></i> Like "+item.likecnt+"</li><li><i onclick='addReply("+item.seq+","+item.depthno+","+item.code+","+index+","+item.groupno+");' class='fa fa-share-square-o'></i> Reply<input id='replycontent"+index+"' type='text'>     "+item.commentcnt+"</li></ul></div></div><hr>";
							
						});
					}
					
					else {
						
					}
					
					$("div#commentView").html(html);
			
					},

					error : function(request, status, error) {
						alert("오류가 발생했습니다.")
					}
			
				});

			}// end of function goViewJson(){}------------------------
			
			// == 댓글쓰기 == //
			function goAddWrite() {
				
					var contentVal = $("textarea[name=content]").val()
					if(contentVal == "") {
						alert("댓글 내용을 입력하세요!!");
						return;
					}
					
					
					if(${empty sessionScope.loginuser}) {
						   alert("제품사용 후기를 작성하시려면 먼저 로그인 하셔야 합니다.");
						   location.href="/foodie/login.food";
						   return;
					   }
						
					
					
					var form_data = $("form[name=addcomment]").serialize();
					
					$.ajax({
						url:"<%= request.getContextPath()%>/addComment.food",
						data:form_data,
						type:"POST",
						dataType:"JSON",
						success:function(json){  
							var n = json.n;
							
							if(n == 0) {
								alert("댓글쓰기 실패");
							}
							else {
								
								alert("댓글쓰기 성공");
								getComment(); 
								
							}
							
							$("textarea[name=content]").val("");
						},
						
						error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					 	}
					});
					
				
				
				
				
				
				
			}// end of function goAddWrite(){}---------------------------
		
			
			   // **** 특정댓글에 댓글 쓰기 // 
			   function addReply(parentSeq, depthno, code, index, groupno) {
					
				    var content=$("input#replycontent"+index).val();
				    
				    
					
					if(${empty sessionScope.loginuser}) {
						   alert("댓글을 작성하시려면 먼저 로그인 하셔야 합니다.");
						   location.href="/foodie/login.food";
						   return;
					   }
					
 					 	$.ajax({
							url:"<%= request.getContextPath()%>/addReply.food",
							data:{"parentSeq":parentSeq, "depthno":depthno, "code":code, "parentSeq":parentSeq, "content":content, "groupno":groupno},
							type:"POST",
							dataType:"JSON",
							success:function(json){  
								var n = json.n;
								
								if(n == 0) {
									alert("댓글쓰기 실패");
								}
								else {
									
									alert("댓글쓰기 성공");
									getComment(); 
									
								}
								
								$("textarea[name=content]").val("");
							},
							
							error: function(request, status, error){
								alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						 	}
						});  
						    
					
	
				   
			   }// end of addReply(seq, depthno) ---------------
			   
			   
			
			  // 나중에 다 함수로 쪼개어서 리펙토링해야함 //
			  
			   // **** 특정댓글에 대한 좋아요 등록하기 **** // 
			   function addLike(seq) {
					
					if(${empty sessionScope.loginuser}) {
						   
						   location.href="/foodie/login.food";
						   return;
					   }
					
					// 중복검사 ajax
					$.ajax({
						url:"<%= request.getContextPath()%>/duplicateCheckLike.food",
						data:{"seq":seq,
						     "email":"${sessionScope.loginuser.email}"},
						type:"POST",
						dataType:"JSON",
						success:function(json){  
							var n = json.n;
							console.log(n);
							
							if(n == 0) {
								// 좋아요를 클릭한적이 없는경우 
								//
								   $.ajax({
									   url:"/foodie/likeAdd.food",
									   type:"POST",
									   data:{"seq":seq,
										     "email":"${sessionScope.loginuser.email}"},
									   dataType:"JSON", 
									   success:function(json) {
										   
										getComment();	
												 
												
											
											
									   },
									   error: function(request, status, error){
											alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
									   }
								   });
								//
							}
							
							else {
								// 좋아요를 클릭한 적이 있는경우
								
								 								
								$.ajax({
									url:"<%= request.getContextPath()%>/delLikeCnt.food",
									data:{"seq":seq,
									     "email":"${sessionScope.loginuser.email}"},
									type:"POST",
									dataType:"JSON",
									success:function(json){  
										
										
									getComment();										
										
									},
									
									error: function(request, status, error){
										alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
								 	}
									
								});
								 
								
							}
							
							 
							
						},
						
						error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					 	}
						
					});//
					
					
				
				   
			   }// end of addLike(seq)---------------
		
	</script>

	
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader">제목</div>
    </div>

    <!-- Listing Section Begin -->
    <section class="listing-hero set-bg" data-setbg="<%= ctxPath %>/resources/img/listing/details/listing-hero.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="listing__hero__option">
                        <div class="listing__hero__icon">
                            <img src="<%= ctxPath %>/resources/img/listing/details/ld-icon.png">
                        </div>
                        <div class="listing__hero__text">
                            <h2 id="store_name"></h2>
                            <div class="listing__hero__widget">
                                <div class="listing__hero__widget__rating" >
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star-half_alt"></span>
                                </div>
                                <div id=commentscnt></div> <span>Views</span>
                            </div>
                            <p><span class="icon_pin_alt"></span> <label id="adress_detail"></label></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="listing__hero__btns">
                        <a href="#" class="primary-btn"><i class="fa fa-bookmark"></i> 가고싶다</a>
                    </div>
                </div>
            </div>
        </div>
        
    </section>
    <!-- Listing Section End -->

    <!-- Listing Details Section Begin -->
    <section class="listing-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="listing__details__text">

                        
                        <div class="listing__details__gallery" style="padding-top: 0pt;">
                            <div class="listing__details__gallery__pic">
                                <div class="listing__details__gallery__item">
                                    <img class="listing__details__gallery__item__large" src="<%=ctxPath %>/resources/img/listing/details/listing-details-1.jpg" alt="">
                                    <span><i class="fa fa-camera"></i> 이미지 </span>
                                </div>
                                <div class="listing__details__gallery__slider owl-carousel">
                                     <img data-imgbigurl="<%=ctxPath %>/resources/img/listing/details/listing-details-1.jpg"
                                        src="<%=ctxPath %>/resources/img/listing/details/thumb-1.jpg" alt="">
                                    <img data-imgbigurl="<%=ctxPath %>/resources/img/listing/details/listing-details-1.jpg"
                                        src="<%=ctxPath %>/resources/img/listing/details/thumb-2.jpg" alt="">
                                    <img data-imgbigurl="<%=ctxPath %>/resources/img/listing/details/listing-details-1.jpg"
                                        src="<%=ctxPath %>/resources/img/listing/details/thumb-3.jpg" alt="">
                                    <img data-imgbigurl="<%=ctxPath %>/resources/img/listing/details/listing-details-1.jpg"
                                        src="<%=ctxPath %>/resources/img/listing/details/thumb-4.jpg" alt=""> 
                                </div>
                            </div>
                        </div>
                                                
                        <div id="menuList" class="listing__details__menu"></div><!-- 메뉴랑 가격들어가는 부분 -->                                        
                       
                        <div class="listing__details__rating">
                            
                            <div class="listing__details__rating__overall">
                                <h2>4.7</h2>
                                <div class="listing__details__rating__star">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                </div>
                                <span id=reviewcnt></span>
                            </div>
                            <div class="listing__details__rating__bar">
                                <div class="listing__details__rating__bar__item">
                                    <span>4.4</span>
                                    <div id="bar1" class="barfiller">
                                        <span class="fill" data-percentage="100"></span>
                                    </div>
                                    <span class="right">1</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>3.9</span>
                                    <div id="bar2" class="barfiller">
                                        <span class="fill" data-percentage="75"></span>
                                    </div>
                                    <span class="right">2</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>4.2</span>
                                    <div id="bar3" class="barfiller">
                                        <span class="fill" data-percentage="80"></span>
                                    </div>
                                    <span class="right">3</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>4.8</span>
                                    <div id="bar4" class="barfiller">
                                        <span class="fill" data-percentage="80"></span>
                                    </div>
                                    <span class="right">4</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>4.0</span>
                                    <div id="bar5" class="barfiller">
                                        <span class="fill" data-percentage="85"></span>
                                    </div>
                                    <span class="right">5</span>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                         <div class="listing__details__review">
                            
                            <form name="addcomment">
                            	<input name ="name" type="hidden" value="${loginuser.name}">
                            	<input name ="code" type="hidden" value="290249009">   <%-- ${code} --%>
                            	<input name ="spoint" type="hidden" value="3">   
                                <textarea name="content" placeholder="공개 댓글 추가 ..."></textarea>
								<div style="display: inline-block; class="listing__details__comment__item__rating" >
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                </div>
                                    
                            </form>
                            <button class="site-btn" onclick="goAddWrite();">댓글</button>
                        </div>
                        
                        
                        <div id="commentView" class="listing__details__comment">
                          	
                        </div>
                        
                       
                        
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="listing__sidebar">
                        <div class="listing__sidebar__contact">
                            <div class="listing__sidebar__contact__map">
								<div id="map" style="width: 360px; height: 200px;"></div>
								<div id="latlngResult"></div>
                            </div>
                            <div class="listing__sidebar__contact__text">
                                <h4>Contacts</h4>
                                <ul>
                                    <li><span class="icon_pin_alt"></span> <label id="adress_detail"></label> </li>
                                    <li><span class="icon_phone"></span> <label id="phone"></label></li>
                                    <li><span class="icon_mail_alt"></span> <label id="email"></label></li>
                                    <li><span class="icon_globe-2"></span><a id="page"></a></li>
                                </ul>
                                
                                <div class="listing__sidebar__contact__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
                                    <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                                    <a href="#" class="google"><i class="fa fa-google"></i></a>
                                </div>
                                
                            </div>
                        </div>
                        <div class="listing__sidebar__working__hours">
                            <h4>Working Hours</h4>
                            <ul>
                                <li>Monday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Tuesday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Wednesday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Thursday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Friday <span class="opening">Opening</span></li>
                                <li>Saturday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Saturday <span class="closed">Closed</span></li>
                            </ul>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Listing Details Section End -->

    <!-- Newslatter Section Begin -->
    <!--  <section class="newslatter">
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
    -->
    <!-- Newslatter Section End -->
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


