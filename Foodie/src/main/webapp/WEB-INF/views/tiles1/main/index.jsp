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
    <title>3조 | 파이널</title>
    
</head>

<style type="text/css">

body{
   font-family: Verdana;
}
.top_list{
/* == topList 스팬태그 가운데로 == */
       position: relative; 
       /*  bottom: 90px;
        right:80px; */
        color:white;
        font-size:23px;
        font-weight:bold;
        text-align:center;
          float:right;
          
}
.top_list2{
/* == topList 스팬태그 가운데로 == */
         position: relative; 
       /*  bottom: 90px;
        right:78px; */
        color:white;
        font-size:17px;
        font-weight:bold;
        text-align:center;
          float:right;
          
}

div.bright{
   /* position:relative;
   width:500px;
   height:300px; */
   /* filter:brightness(100%); */
}
div.set-bg{
   /* position:relative; */
   /* width:380px; */
   /* filter:brightness(80%); */
}

</style>

<script type="text/javascript">

   $(document).ready(function() {
      
	   // 맛집 탭 내부의 지역핫플레이스를 누를 경우 이벤트가 일어난 버튼의 정보를 Controller로 전송하는 기능
      $("div.listing__item").click(function() {
         
         var index = $("div.listing__item").index(this);
         
         var hotPlace = $("span.top_list").eq(index).text();
         
         var hotPlaceInfo = $("p.top_list2").eq(index).text();
         
         location.href="<%=ctxPath %>/storeBoard/storeMain.food?hotPlace="+hotPlace+"&hotPlaceInfo="+hotPlaceInfo+"&scrollCtrl=1";
      });
      
   });
   
</script>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Categories Section Begin -->
    <!-- <section class="categories spad">
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
    </section> -->
    <!-- Categories Section End -->

    <!-- Most Search Section Begin -->
    <section class="most-search spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2 style="color:orange; font-weight:bold;">믿고 보는 맛집 리스트</h2>
                        <p></p>
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
                                    인기지역
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">
                                    <span class="flaticon-030-kebab"></span>
                                    한식
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">
                                    <span class="flaticon-032-food-truck"></span>
                                    일식                
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">
                                    <span class="flaticon-031-delivery"></span>
                                    중식
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-5" role="tab">
                                    <span class="flaticon-038-take-away"></span>
                                    양식
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">
                                    <span class="flaticon-017-croissant"></span>
                                   카페&제과                   
                                </a>
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-7" role="tab">
                                    <span class="flaticon-031-delivery"></span>
                                   주점                   
                                </a>
                            </li>
                        </ul>
                    </div>
                    
                    
                    <!-- 지역핫플레이스 -->
                    <div class="tab-content">
                    
                        <div class="tab-pane active" id="tabs-1" role="tabpanel"> <!-- 지역핫플레이스 -->
                        
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                    <%--  <a href="<%=ctxPath %>/list.food/sinnonhyun"> --%>
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-1.jpg">
                                           <%--  <%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-1.png"> --%>
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                            <span class="top_list">신논현역 맛집 베스트</span>
                                            <br><br>
                                             <p class="top_list2">신논현의 맛집 모음</p>
                                               <!--  <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a> -->
                                            </div>
                                        </div>
                                     <!--  </a> --> 
                                    </div>
                               </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                    <%-- <a href="<%=ctxPath %>/list.food/garosugil"> --%>
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/fniqmkbao7_tgrue.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                            <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">가로수길 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">가로수길 처음와봐?</p>
                                           </div>
                                       </div>
                                     <!--   </a> -->
                                   </div>
                               </div>
                                    
                                 <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://cdn.crowdpic.net/list-thumb/thumb_l_F3D127229BB327266846B663A87B0803.jpg">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns">
                                            <span class="top_list">명동 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">명동이 요즘 핫하다던데..</p>
                                            </div>
                                       </div>
                                   </div>
                                 </div> 
                                   
                                <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://www.newzealand.com/assets/Tourism-NZ/Lake-Taupo/c47317b551/img-1536064442-8738-30473-p-11DB6F53-9C1F-12FB-64B569C5E02289AB-2544003__aWxvdmVrZWxseQo_CropResizeWzk0MCxudWxsLDgwLCJqcGciXQ.jpg">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">이태원 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">이태원 클라쓰!!</p>
                                           </div>
                                       </div>
                                   </div>
                                 </div> 
                                 
                                 
                                 <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://static.wtable.co.kr/image/production/service/recipe/668/6c59105b-1ea9-4e6d-bdd2-e5deafe499e3.jpg">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">홍대 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">아직도 여기 모르는사람 있어?</p>
                                           </div>
                                       </div>
                                   </div>
                                 </div> 
                                 
                                 
                                  <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://t1.daumcdn.net/cfile/tistory/01384F4B516317E018">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">강남역 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">강남의 핫한 맛집은?</p>
                                           </div>
                                       </div>
                                   </div>
                                 </div> 
                         </div>
                         </div>
                                 
                                 
                                 
                                 
                        <!-- 한식 태그 -->
                        
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="row">
                                 <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/59110_1607255618220385.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                           <div class="listing__item__pic__tag hot_deal">Hot Deal</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">갈비 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">회식 할 곳 찾아?</p>
                                           </div>
                                       </div>
                                     </div>
                                 </div> 
                                
                                
                               <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/added_restaurants/567494_1480569707297549.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                           <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">삼겹살 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">삼쏘 한잔?</p>
                                           </div>
                                       </div>
                                     </div>
                                 </div> 
                                 
                                 
                               <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/added_restaurants/447545_1471073424411761.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                           <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">냉면 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">면치기 하고 싶은 날</p>
                                           </div>
                                       </div>
                                     </div>
                                 </div> 
                               

                        <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/37398/593070_1472836660192_7917?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                           <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">국밥 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">든든한 국밥 먹을러 갈래요?</p>
                                           </div>
                                       </div>
                                     </div>
                                 </div> 
                                 
                                 
                                 
                                 <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/1432016_1574946598893990.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                           <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">부대찌개 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">겨울엔 역시 탕이지!</p>
                                           </div>
                                       </div>
                                     </div>
                                 </div> 
                                
                                
                                  <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/17625/134693_14352864734881447?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">족발 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">족발 매니아들만 안다는 그 곳들</p>
                                           </div>
                                       </div>
                                   </div>
                                 </div> 
                            </div>
                         </div>
                                 
                         <!-- 일식 -->
                                 
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/689979_1539971244122359.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">스시 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">스시 매니아들이 자주 가는곳은?</p>
                                           </div>
                                       </div>
                                   </div>
                                 </div> 
                                 
                                 
                               <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/added_restaurants/460278_1491386783474508.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">라멘 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">진한 육수에 두툼한 차슈와 반숙 계란!</p>
                                           </div>
                                       </div>
                                   </div>
                                 </div> 
                                 
                                 
                                <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/970231_1607092393085012.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">돈까스 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">이건 못참지!!</p>
                                           </div>
                                       </div>
                                   </div>
                                 </div> 
                                 
                                 
                               <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/1182605_1552197667841412.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">이자카야 베스트</span>
                                            <br><br>
                                            <p class="top_list2">혼술하기 좋은 곳</p>
                                           </div>
                                       </div>
                                   </div>
                                 </div> 
                              </div>
                              </div>
                              
                         
                         
                         
                         
                              
                      <!-- 중식 -->     
                                 
                        <div class="tab-pane" id="tabs-4" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/467354_1518934950804567.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">짬뽕 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">매콤한거 땡기는 날!</p>
                                           </div>
                                       </div>
                                   </div>
                                 </div> 
                                 
                                 
                                <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/984760_1559453236500092.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">양고기&양꼬치 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">칭따오랑 같이 시키는게 국룰</p>
                                           </div>
                                       </div>
                                   </div>
                                 </div> 
                                 
                                 
                                <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/597979_1606890314035132.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">마라탕 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">한번 빠지면 헤어나올 수 없는 이 중독성!</p>
                                           </div>
                                       </div>
                                    </div>
                                 </div> 
                                 
                                 
                                 
                               <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://search.pstatic.net/common/?src=http%3A%2F%2Fpost.phinf.naver.net%2F20161004_171%2F1475572826176gpE2V_JPEG%2FIlCAjoSCC2_36MC3qRjUBWJVKi3g.jpg&type=sc960_832">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">짜장면 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">국민들의 음식</p>
                                           </div>
                                       </div>
                                    </div>
                                 </div> 
                             </div>
                             </div>    
                          
                          
                          
                       <!-- 양식 -->
                       
                       
                                 
                        <div class="tab-pane" id="tabs-5" role="tabpanel">
                            <div class="row">
                                 <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/1062072_1606315708617361.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">경양식 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">칼 질 좀 해볼까?</p>
                                           </div>
                                       </div>
                                    </div>
                                 </div> 
                              
                             
                             
                                 <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/52544_1517882427712991.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">스테이크&바베큐 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">간만에 고기좀 뜯고 싶을 떄</p>
                                           </div>
                                       </div>
                                    </div>
                                 </div> 
                                
                               
                             </div>
                           </div>    
                            
                        
                        <!-- 카페&제과 -->
                        
                        <div class="tab-pane" id="tabs-6" role="tabpanel">
                            <div class="row">
                                 <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg=https://mp-seoul-image-production-s3.mangoplate.com/1843271_1606618816933055.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80>
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">카페&디저트 베스트</span>
                                            <br><br>
                                            <p class="top_list2">커피 한잔의 여유</p>
                                           </div>
                                       </div>
                                    </div>
                                 </div> 
                                 
                                <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/added_restaurants/9239_1488597035247996.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">빵집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">빵 매니아들이 자주 가는곳</p>
                                           </div>
                                       </div>
                                    </div>
                                 </div> 
                                 
                             
                            </div>
                        </div>
                        
                        
                        <!-- 주점 -->
                        
                         
                         <div class="tab-pane" id="tabs-7" role="tabpanel">
                            <div class="row">
                                 <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/added_restaurants/34450_1446264625748.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">감성주점 베스트</span>
                                            <br><br>
                                            <p class="top_list2">분위기에 취해봤니?</p>
                                           </div>
                                       </div>
                                    </div>
                                 </div> 
                              
                             
                             
                                 <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/added_restaurants/63176_1460723956278258.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">와인바 베스트</span>
                                            <br><br>
                                            <p class="top_list2">혼술 하기 좋은 날</p>
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
    <%-- <section class="work spad">
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
    </section> --%>
    <!-- Work Section End -->

    <!-- Feature Location Section Begin -->
    <section class="feature-location spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                         <h2 style="color:orange; font-weight:bold;">HOT Place!</h2>
                        <p>Foodie의 핫한 맛집을 한눈에!</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                
                    <a href="#" class="feature__location__item large-item set-bg"
                        data-setbg="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fnaverbooking-phinf.pstatic.net%2F20201102_158%2F1604294742012rFPrl_JPEG%2Fimage.jpg">
                        <div class="feature__location__item__text">
                            <h5>명동</h5>
                            <ul>
                                
                            </ul>
                        </div>
                    </a>
                </div>
                <div class="col-lg-6">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <a href="#" class="feature__location__item set-bg"
                                data-setbg="https://www.dtnews24.com/news/photo/201702/93893_415758.jpg">
                                <div class="feature__location__item__text">
                                    <h5>홍대</h5>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <a href="#" class="feature__location__item set-bg"
                                data-setbg="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fmyplace-phinf.pstatic.net%2F20201127_81%2F16064055842862fB4C_JPEG%2Fupload_b06014bb7e5c18e6cff67a5476d19e21.jpeg">
                                <div class="feature__location__item__text">
                                    <h5>이태원</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                    <a href="#" class="feature__location__item set-bg" data-setbg="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fmyplace-phinf.pstatic.net%2F20201123_238%2F1606141227884MJRSJ_JPEG%2Fupload_54e78314161b76e278953465783fb5ec.jpeg">
                        <div class="feature__location__item__text">
                            <h5>강남</h5>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>
    <!-- Feature Location Section End -->

    <!-- Testimonial Section Begin -->
    <section class="testimonial spad set-bg" data-setbg="https://i.pinimg.com/originals/a9/e8/49/a9e8498b09ab9c2e56c872d61af8662d.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>에디터 후기</h2>
                        <p>100% 검증된 Foodie 인플루언서의 다양한 의견을 한눈에</p>
                    </div>
                    <div class="testimonial__slider owl-carousel">
                        <div class="testimonial__item" data-hash="review-1">
                            <p>" 맛집입니다 강추!"</p>
                            <div class="testimonial__item__author">
                                <a href="#review-3"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-3.png" alt=""></a>
                                <a href="#review-1" class="active"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-1.png" alt=""></a>
                                <a href="#review-2"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-2.png" alt=""></a>
                            </div>
                            <div class="testimonial__item__author__text">
                                <h5>임정섭 -</h5>
                                <div class="testimonial__item__author__rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            </div>
                           <!--  <span>CEO Colorlib</span> -->
                        </div>
                        <div class="testimonial__item" data-hash="review-2">
                            <p>"여기 맛있어요!!"</p>
                            <div class="testimonial__item__author">
                                <a href="#review-1"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-1.png" alt=""></a>
                                <a href="#review-2" class="active"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-2.png" alt=""></a>
                                <a href="#review-3"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-3.png" alt=""></a>
                            </div>
                            <div class="testimonial__item__author__text">
                                <h5>황주호 -</h5>
                                <div class="testimonial__item__author__rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            </div>
                            <!-- <span>CEO Colorlib</span> -->
                        </div>
                        <div class="testimonial__item" data-hash="review-3">
                            <p>"제가 먹은것중에 제일 맛있어요"</p>
                            <div class="testimonial__item__author">
                                <a href="#review-2"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-2.png" alt=""></a>
                                <a href="#review-3" class="active"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-3.png" alt=""></a>
                                <a href="#review-1"><<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/testimonial/author-1.png" alt=""></a>
                            </div>
                            <div class="testimonial__item__author__text">
                                <h5>홍승의 -</h5>
                                <div class="testimonial__item__author__rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            </div>
                            <!-- <span>CEO Colorlib</span> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
 


   
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



