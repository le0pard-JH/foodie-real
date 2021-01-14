<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String ctxPath = request.getContextPath(); 

	
	



%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<style>
	
		.site-btn {
			
			
		}
		
		button#btnAddcomment {
			font-size: 8pt;
		}
		
		.hideUl {
			
			/* display: none; */
			
		
		}
		
		.replycontent {
			
			width: 93%;
		}
		
		div.subcomment1 {
			
			margin-left: 10%;
		}
		
		div.subcomment2 {
			
			margin-left: 20%;
		}
		div.subcomment3 {
			
			margin-left: 30%;
		}
		
		div.subcomment4 {
			
			margin-left: 40%;
		}
		div.subcomment5 {
			
			margin-left: 50%;
		}

		div.listing__details__rating {
			display: flex;
			align-content: center;
			
			
		}
		
		div.listing__details__rating__overall {
			margin-right: 0px;
			float: none;
			width: 30%;
			
		}
		
		div.listing__details__rating__bar {
			
			width: 70%;
			font-weight: 700;
		}
		
		h2 {
			margin-top: 10pt;
		}
		
		.fa-star:before {
			margin-right: 2px;
			font-size: 12pt;
		}
		
		div.addcoment {
			display: flex;
			flex-direction: column;
			width: 15%;
			align-items: center; 
		}
		
		.listing__details__comment__item__rating {
			align-items: center; 
		}
		
		.listing__details__rating {
			margin-bottom: 0px;
		}
		
		
	</style>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=adf2708493f00cbb2f18296dc2c60b88&libraries=services"></script>	
 <script type="text/javascript">

	
	
 	var store_id="290249009";
 	var basicInfo="";
 	var menuInfo="";
 	var menuList="";
 	var region="";
 	var len = 5;
 	var end = 0;
 	
 	var blogReview="";
 	var comment="";
 	
 	var photo="";
 	var s2graph="";
 	var feedback="";
 	var cid="";
 	var photo="";
 	var mainphotourl="";
 	$(document).ready(function () {
		
 		 
 		$("span#currentCnt").hide();
 		$("span#totalCnt").hide();
 		
 		
 		// 별점 클릭 이벤트
 		$("#star0").click(function() {
 			
 	         $("#star0").css("color", "orange");
 	         $("#star1").css("color", "gray");
 	         $("#star2").css("color", "gray");
 	         $("#star3").css("color", "gray");
 	         $("#star4").css("color", "gray");
 	         $("input[name=spoint]").val("1");
 	         
 	      });
 		
 	      $("#star1").click(function() {
 	         reviewnum = 2;
 	         
 	         $("#star0").css("color", "orange");
 	         $("#star1").css("color", "orange");
 	         $("#star2").css("color", "gray");
 	         $("#star3").css("color", "gray");
 	         $("#star4").css("color", "gray");
 	         $("input[name=spoint]").val("2");
 	         
 	      });
 	      
 	      $("#star2").click(function() {
 	         
 	         $("#star0").css("color", "orange");
 	         $("#star1").css("color", "orange");
 	         $("#star2").css("color", "orange");
 	         $("#star3").css("color", "gray");
 	         $("#star4").css("color", "gray");
 	         $("input[name=spoint]").val("3");
 	      });
 	      
 	      $("#star3").click(function() {
 	         
 	         $("#star0").css("color", "orange");
 	         $("#star1").css("color", "orange");
 	         $("#star2").css("color", "orange");
 	         $("#star3").css("color", "orange");
 	         $("#star4").css("color", "gray");
 	         $("input[name=spoint]").val("4");
 	         
 	      });
 	      
 	      $("#star4").click(function() {
 	    	  
 	         $("#star0").css("color", "orange");
 	         $("#star1").css("color", "orange");
 	         $("#star2").css("color", "orange");
 	         $("#star3").css("color", "orange");
 	         $("#star4").css("color", "orange");
 	         $("input[name=spoint]").val("5");
 	         
 	      });
 	    // 별점 클릭 이벤트 끝
	 	    
 	    
 	    
 		// 댓글을 더보기 위하여 "더 보기" 버튼 클릭액션 이벤트 
		$("button#btnMoreComment").click(function(){
			if($(this).text() == "처음으로") {
				
				$("div#commentView").empty();
				
				getComment(0);
				$(this).text("더 보기");
				
			} else {
				
				getComment($(this).val());
				
			}// end of if($(this).text() == "처음으로"){}--------------------------
		});// end of $("button#btnMoreOneQuery").click(function(){})----------------------    
 	    
 	    
		
		
 	    // 가져오기 
 		goViewJson();       // json 카카오api
 		getComment(1);       // 해당 store_id 
 		likestroechecked(); // 좋아요 체크
 		
 		
 		
 		
/*  		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
 	    mapOption = {
 	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
 	        level: 3 // 지도의 확대 레벨
 	    };  

 	// 지도를 생성합니다    
 	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
 	
    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성함.   
    var zoomControl = new kakao.maps.ZoomControl();
    
    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 지도에 표시함.
    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 RIGHT는 오른쪽을 의미함.    
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
    
    
 	// 주소-좌표 변환 객체를 생성합니다
 	var geocoder = new kakao.maps.services.Geocoder();
	
 	
 	// 주소로 좌표를 검색합니다
 	geocoder.addressSearch(basicInfo.address.region.fullname+" "+basicInfo.address.newaddr.newaddrfull, function(result, status) {

 	    // 정상적으로 검색이 완료됐으면 
 	     if (status === kakao.maps.services.Status.OK) {

 	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

 	        // 결과값으로 받은 위치를 마커로 표시합니다
 	        var marker = new kakao.maps.Marker({
 	            map: map,
 	            position: coords
 	        });
 	        
            /* 
 	        // 인포윈도우로 장소에 대한 설명을 표시합니다
 	        var infowindow = new kakao.maps.InfoWindow({
 	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
 	        });
 	        infowindow.open(map, marker); 
 	        

 	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
 	        map.setCenter(coords);
 	    }
 	    
 	});  */

         
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
				photo=json.photo;
				cid=basicInfo.cid;
				
				console.log(cid);
				console.log(basicInfo);
				
				
				
				$("#adress_detail").text(basicInfo.address.region.fullname+" "+basicInfo.address.newaddr.newaddrfull);
				$("label#page").text(basicInfo.homepage);
				$("#store_name").text(basicInfo.placenamefull);				
				$("label#adress_detail").text(basicInfo.address.region.fullname+" "+basicInfo.address.newaddr.newaddrfull);
				$("label#email").text("");
				$("label#phone").text(basicInfo.phonenum);
				
				var scorercnt = comment.scorecnt;
				var scoresum = comment.scoresum;
				var allComntcnt = comment.allComntcnt;
				var score =scoresum/scorercnt;
				
				
				score=score.toFixed(1);
				
				
		 		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		 	    mapOption = {
		 	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		 	        level: 2 // 지도의 확대 레벨
		 	    };  

		 	// 지도를 생성합니다    
		 	var map = new kakao.maps.Map(mapContainer, mapOption); 
			
		 	
		    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성함.   
		    var zoomControl = new kakao.maps.ZoomControl();
		    
		    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 지도에 표시함.
		    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 RIGHT는 오른쪽을 의미함.    
		    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		    
		    
		 	// 주소-좌표 변환 객체를 생성합니다
		 	var geocoder = new kakao.maps.services.Geocoder();
			
		 	
		 	// 주소로 좌표를 검색합니다
		 	geocoder.addressSearch(basicInfo.address.region.fullname+" "+basicInfo.address.newaddr.newaddrfull, function(result, status) {

		 	    // 정상적으로 검색이 완료됐으면 
		 	     if (status === kakao.maps.services.Status.OK) {

		 	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		 	        // 결과값으로 받은 위치를 마커로 표시합니다
		 	        var marker = new kakao.maps.Marker({
		 	            map: map,
		 	            position: coords
		 	        });
		 	        
		            /* 
		 	        // 인포윈도우로 장소에 대한 설명을 표시합니다
		 	        var infowindow = new kakao.maps.InfoWindow({
		 	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
		 	        });
		 	        infowindow.open(map, marker); 
		 	        */

		 	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		 	        map.setCenter(coords);
		 	    }
		 	    
		 	});  
				
				
				
				
				
				
				
				$("div#commentscnt").text(comment.scorecnt);

					html ="";
					
					$.each(menuInfo.menuList, function (index, item) {
						
						var menu=item.menu;
						var price=item.price;
						html += "<li>"+menu+"  :   "+price+"</li>";
						
					});
					
					$("div#menuList").html(html);
					
					
					// 메인 photourl 가져오기					
					mainphotourl=basicInfo.mainphotourl
					
					html ="";
					html ="<img class='listing__details__gallery__item__large' src='"+mainphotourl+"' alt=''>";
					
					$("div.listing__details__gallery__item").html(html);
					
					
					html="";
					$.each(photo, function (index, item) {
						
						var food1=item[1];
						var photolist=food1['list'];
						
						$.each(photolist, function (index, item) {
							
							console.log(item['orgurl']);
								
							var orgurl=item['orgurl'];
							
							
							html +="<img data-imgbigurl='"+mainphotourl+"' src='"+orgurl+"' alt=''>";
							
							
							});
							
					});
					// $("div.listing__details__gallery__slider").html(html);
					
				},
				error : function(request, status, error) {
				}

			});

		}// end of function goViewJson(){}------------------------
		
		
	 	function getComment(end) {
			
			$.ajax({
				url:"/foodie/readComment.food",
				data:{"code": "290249009",
					   "end" : end,
					   "len" : len
					   },
				type:"POST",
				dataType:"JSON",
				success:function(json){
						
					var html = "";
					if(json.length > 0) {
						$.each(json, function(index, item){
							
						if(item.depthno == "0") {
							
							html +=	"<div class='listing__details__comment__item' style='margin-bottom: 0px;'>";
							
						}
						
						else if(item.depthno == "1")  {
							html +=	"<div class='subcomment1' style='margin-bottom: 0px;'>";	
						}
						else if(item.depthno == "2")  {
							html +=	"<div class='subcomment2' style='margin-bottom: 0px;'>";	
						}
						else if(item.depthno == "3")  {
							html +=	"<div class='subcomment3' style='margin-bottom: 0px;'>";	
						}
						else if(item.depthno == "4")  {
							html +=	"<div class='subcomment4' style='margin-bottom: 0px;'>";	
						}
						else if(item.depthno == "5")  {
							html +=	"<div class='subcomment5' style='margin-bottom: 0px;'>";	
						}
						
						html +=	"<div class='listing__details__comment__item__pic'>";
						
						if(item.thumbnail_image == "0") {
							html += "<img src='<%=ctxPath %>/resources/img/listing/details/comment.png' alt=''>";	
						}
						console.log(item.thumbnail_image);
						html += "<img src='"+item.thumbnail_image+"' alt=''>";
						
                        html += "</div>";
                        html += "<div id='"+index+"' class='listing__details__comment__item__text'>";
                        html +="<div class='listing__details__comment__item__rating'>";
                        
                        if (item.spoint == "1") {
                            html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                        }
                        
						if (item.spoint == "2") {
							html +="<i class='fa fa-star' style='color:orange;;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                        }
						
						if (item.spoint == "3") {
							html +="<i class='fa fa-star' style='color:orange;;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                            
                        }
						
						if (item.spoint == "4") {
							html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                        }
						
						if (item.spoint == "5") {
							html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;'></i>";
							
                        }
						
                        html += "</div>"; 
                        html += "<span>"+item.regDate+"</span>";
                        html += "<h5>"+item.name+"</h5>";
                        html += "<p>"+item.content+"</p>";  
                        html += "<ul><li><i onclick='addLike("+item.seq+");' class='fa fa-hand-o-right'></i> Like "+item.likecnt+"</li><li><i class='fa fa-share-square-o'></i> Reply "+item.commentcnt+"</li></ul><ul class='hideUl'><input class='replycontent' id='replycontent"+index+"'type='text'><button onclick='addReply("+item.seq+","+item.depthno+","+item.code+","+index+","+item.groupno+");'>답글</button></ul></div></div><hr>";
						});
						
					}
					
					$("div#commentView").html(html);
					
					// ★★★ 중요 !!! 더보기 버튼의 value 속성에 값을 지정하기 ★★★ //
					
					
					$("button#btnMoreComment").val(Number(end) + len);
					
					// 자기 자신의 원래 값에 불러온 json의 개수의 값을 넣어준다.
					$("span#currentCnt").text( Number($("span#currentCnt").text()) + json.length);  // 현재 기록된 개수에 불러온 개수(배열의 길이 == 개수)를 더한다.
					// 더보기 버튼을 계속해서 클릭해 countHIT 값과 totalHITCount 값이 일치하는 경우
					
					if($("span#currentCnt").text() == $("span#totalCnt").text()) {
						
						$("button#btnMoreComment").text("처음으로");
						$("span#currentCnt").text("0");
						
					}
					
					},

					error : function(request, status, error) {
						alert("오류가 발생했습니다.");
					}
			
				});

			}// end of function goViewJson(){}------------------------
			
			// 답글 누르면 아래 ul태그가 show 보여지는 이벤트
			function showReplycontent(index) {
				
				var divNumber=index;
				
				
				
				console.log($("ul"));
				
				
			};
			
			
			
			// == 댓글쓰기 ==  함수인데 페이지 이동이됨?//
			function goAddWrite() {
					
					if(${empty sessionScope.loginuser}) {
						   alert("후기를 작성하시려면 먼저 로그인 하셔야 합니다.");
						   location.href="/foodie/login.food";
						   return;
					   }
					
					var contentVal = $("textarea[name=content]").val()
					if(contentVal == "") {
						alert("댓글 내용을 입력하세요!!");
						return;
					}
					
					var spoint=$("input[name=spoint]").val();
					
					if(spoint == "0") {
						alert("별점을 클릭하세요");
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
							$("#star0").css("color", "orange");
				 	        $("#star1").css("color", "gray");
				 	        $("#star2").css("color", "gray");
				 	        $("#star3").css("color", "gray");
				 	        $("#star4").css("color", "gray");
				 	        $("input[name=spoint]").val("0");
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
							if(n == 0) {
								
								// 좋아요를 클릭한적이 없는경우 
								   $.ajax({
									   url:"/foodie/likeAdd.food",
									   type:"POST",
									   data:{"seq":seq,
										     "email":"${sessionScope.loginuser.email}"},
									   dataType:"JSON", 
									   success:function(json) {
										getComment($("button#btnMoreComment").val());	
											
									   },
									   error: function(request, status, error){
											alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
									   }
								   });
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
										getComment($("button#btnMoreComment").val());										
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
			   
			// 가고싶다 추가함수
			function likeStore() {				
					
				$.ajax({
					url:"<%= request.getContextPath()%>/storelike.food",
					data:{"cid":cid,
					     "email":"${sessionScope.loginuser.email}"},
					type:"POST",
					dataType:"JSON",
					success:function(json){
						
						
						alert("추가되었습니다.22222");
																
						
					},
					
					error: function(request, status, error){
						console.log("ajax 실패");
						console.log(cid);
						console.log(email);
						
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				 	}
					
				});
				   
			};

			// 가고싶다 삭제 함수
			function delStoreLike() {
				
				$.ajax({
					url:"<%= request.getContextPath()%>/delstorelike.food",
					data:{"cid":cid,
					     "email":"${sessionScope.loginuser.email}"},
					type:"POST",
					dataType:"JSON",
					success:function(json){  
						var n = json.n;
						
						if(n == 0) {
							
							
							return false;
							
						} else {
							
							alert("삭제에 성공하셨습니다.");
							
						}
																
						
					},
					
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				 	}
					
				});
				
			};
			
			
			// 가고싶다 중복검사결과에 따라 추가/삭제 함수 실행
			function duplicateStoreLike() {
				
				if(${empty sessionScope.loginuser}) {
					   alert("가고싶다 체크를 하시려면 먼저 로그인 하셔야 합니다.");
					   location.href="/foodie/login.food";
					   return;
					   
				   }
				
				$.ajax({
					url:"<%= request.getContextPath()%>/duplicateCheckStoreLike.food",
					data:{"cid":cid,
					     "email":"${sessionScope.loginuser.email}"},
					type:"POST",
					dataType:"JSON",
					success:function(json){  
						var n = json.n;
						console.log(n);
						
						if(n == 1) {
							
							alert("삭제합니다.");
							
							delStoreLike();
							
						} else {
							
							alert("추가합니다.");
							
							likeStore();
						}
																
						
					},
					
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				 	}
					
				});
				   
				
			};   
			
			// 가고싶다에 이전에 클릭했을 경우 
			function likestroechecked() {
				
				$.ajax({
					url:"<%= request.getContextPath()%>/duplicateCheckStoreLike.food",
					data:{"cid":cid,
					     "email":"${sessionScope.loginuser.email}"},
					type:"POST",
					dataType:"JSON",
					success:function(json){  
						var n = json.n;
						console.log(n);
						
						if(n == 1) {
							
							
							$("a.primary-btn").css('color','red');
							
							
						} else {
							
							
						}
																
						
					},
					
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				 	}
					
				});
			};
			
			
			// 댓글 삭제하기 Ajax
			function deleteComment(seq) {
				
				$.ajax({
					url:"<%= request.getContextPath()%>/deleteComment.food",
					data:{"seq":seq,
					     "email":"${sessionScope.loginuser.email}"},
					type:"POST",
					dataType:"JSON",
					success:function(json){  
						var n = json.n;
						console.log(n);
						
						if(n == 1) {
							
							
							console.log("성공적으로 댓글을 삭제했습니다.");
							
							
						} else {
							
							
						}
																
						
					},
					
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				 	}
					
				});
			};
			
			// 댓글 수정하기 Ajax
			function likestroechecked() {
				
				$.ajax({
					url:"<%= request.getContextPath()%>/duplicateCheckStoreLike.food",
					data:{"cid":cid,
					     "email":"${sessionScope.loginuser.email}"},
					type:"POST",
					dataType:"JSON",
					success:function(json){  
						var n = json.n;
						console.log(n);
						
						if(n == 1) {
							
							
							$("a.primary-btn").css('color','red');
							
							
						} else {
							
							
						}
																
						
					},
					
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				 	}
					
				});
			};
			
			

			
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
                        <a href="#" class="primary-btn" onclick="duplicateStoreLike();"><i class="fa fa-bookmark"></i> 가고싶다</a>
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
                                
                                </div>
                                <div class="listing__details__gallery__slider owl-carousel"> 
                             		  
                                </div>
                            </div>
                             
                        </div>
                                                
                        <div id="menuList" class="listing__details__menu"></div>                                               
                       
                        <div class="listing__details__rating">
                            
                            <div class="listing__details__rating__overall">
                                <h2>${storeAverage}</h2>
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
                                    <span>5점</span>
                                    <div id="bar5" class="barfiller">
                                        <span class="fill" data-percentage="${paraMap.five}"></span>
                                    </div>
                                    <span class="right">${paraMap.cntFive}</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>4점</span>
                                    <div id="bar4" class="barfiller">
                                        <span class="fill" data-percentage="${paraMap.four}"></span>
                                    </div>
                                    <span class="right">${paraMap.cntFour}</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>3점</span>
                                    <div id="bar3" class="barfiller">
                                        <span class="fill" data-percentage="${paraMap.three}"></span>
                                    </div>
                                    <span class="right">${paraMap.cntThree}</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>2점</span>
                                    <div id="bar2" class="barfiller">
                                        <span class="fill" data-percentage="${paraMap.two}"></span>
                                    </div>
                                    <span class="right">${paraMap.cntTwo}</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>1점</span>
                                    <div id="bar1" class="barfiller">
                                        <span class="fill" data-percentage="${paraMap.one}"></span>
                                    </div>
                                    <span class="right">${paraMap.cntOne}</span>
                                </div>
                            </div>
                            
                        </div>
                        
                         <div class="listing__details__review">
                            
                            <form name="addcomment">
                            	<input name ="name" type="hidden" value="${loginuser.name}">
                            	<input name ="code" type="hidden" value="290249009">   
                            	<input name ="spoint" type="hidden" value="0">
                            	
                            	<div style="display: flex;">
                            		<div style="width: 85%">
                            		<textarea style="resize: both;" name="content" placeholder="공개 댓글 추가 ..."></textarea>
                            		</div>
                            		
                            		<div class="addcoment">
                            			<br>
                            			<div class="listing__details__comment__item__rating" >
                                        <i id="star0" class="fa fa-star" style="font-size: 10pt;"></i>
                                        <i id="star1" class="fa fa-star" style="font-size: 10pt;"></i>
                                        <i id="star2" class="fa fa-star" style="font-size: 10pt;"></i>
                                        <i id="star3" class="fa fa-star" style="font-size: 10pt;"></i>
                                        <i id="star4" class="fa fa-star" style="font-size: 10pt;"></i>
                                		</div>
                                		<br>
                                		<div>
                                		<button id="btnAddcomment" class="site-btn" style="width: 100%;" onclick="goAddWrite();">댓글</button>
                                		</div>
                            		</div>
                					
                            	</div>   
                            	
   
                            </form>
                            <!-- <button class="site-btn" onclick="goAddWrite();">댓글</button> -->
                        </div>
                        
                        
                        <div id="commentView" class="listing__details__comment">
                          	
                        </div>
                        
                        <div>
                        	<span id="currentCnt">0</span>
							<span id="totalCnt">${totalCnt}</span>
							<button type="button" id="btnMoreComment" value="">더 보기</button>
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
                                    <li><span class="icon_globe-2"></span><label id="page"></label></li>
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


