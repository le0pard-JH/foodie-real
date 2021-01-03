<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String ctxPath = request.getContextPath(); %>
<style type="text/css">
	table, th, td, input, textarea {border: solid gray 1px;}
	
	#table, #table2 {border-collapse: collapse;
	 		         width: 1024px;
	 		        }
	#table th, #table td{padding: 5px;}
	#table th{width: 120px; background-color: #DDDDDD;}
	#table td{width: 880px;}
	.long {width: 470px;}
	.short {width: 120px;}
	
	.move {cursor: pointer;}
	.moveColor {color: #660029; font-weight: bold;}
	
	a {text-decoration: none !important;}
	
	td.comment {text-align: center;}
</style>


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
<script type="text/javascript">
	$(document).ready(function(){
		
	 // goReadComment();  // 페이징처리 안한 댓글 읽어오기 
	    goViewComment(1); // 페이징처리 한 댓글 읽어오기 
		
		$("span.move").hover(function(){
			                   $(this).addClass("moveColor");
		                    }
		                    ,function(){
		                       $(this).removeClass("moveColor");
		                    });

	}); // end of $(document).ready(function(){})----------------
	
	
	// == 댓글쓰기 == //
	function goAddWrite() {
		
		var contentVal = $("input#commentContent").val().trim();
		if(contentVal == "") {
			alert("댓글 내용을 입력하세요!!");
			return;
		}
				
		var form_data = $("form[name=addWriteFrm]").serialize();
		$.ajax({
			url:"<%= request.getContextPath()%>/addComment.food",
			data:form_data,
			type:"POST",
			dataType:"JSON",
			success:function(json){  // {"n", 1} OR {"n", 0}
				var n = json.n;
				
				if(n == 0) {
					alert(json.name+"님의 포인트는 300점을 초과할 수 없으므로 댓글쓰기가 불가합니다.");
				}
				else {
				//	goReadComment();  // 페이징처리 안한 댓글 읽어오기 
					goViewComment(1); // 페이징처리 한 댓글 읽어오기 
				}
				
				$("input#commentContent").val("");
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		 	}
		});
		
	}// end of function goAddWrite(){}---------------------------
	
	
	// === 페이징 처리 안한 댓글 읽어오기 === // 
	function goReadComment() {
		
		$.ajax({
			url:"<%= request.getContextPath()%>/readComment.food",
			data:{"parentSeq":"${boardvo.seq}"},
			dataType:"JSON",
			success:function(json){
				var html = "";
				if(json.length > 0) {
					$.each(json, function(index, item){
						html += "<tr>";
						html += "<td class='comment'>"+(index+1)+"</td>";
						html += "<td>"+item.content+"</td>";
						html += "<td class='comment'>"+item.name+"</td>";
						html += "<td class='comment'>"+item.regDate+"</td>";
						html += "</tr>";
					});
				}
				else {
					html += "<tr>";
					html += "<td colspan='4' class='comment'>댓글이 없습니다</td>";
					html += "</tr>";
				}
				
				$("tbody#commentDisplay").html(html);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		 	}
		});
		
	}// end of function goReadComment(){}------------------------
	
	
	// === #127. Ajax로 불러온 댓글내용을 페이징처리 하기 === // 
	function goViewComment(currentShowPageNo) {
		
		$.ajax({
			url:"<%= request.getContextPath()%>/commentList.food",
			data:{"parentSeq":"${boardvo.seq}",
				  "currentShowPageNo":currentShowPageNo},
			dataType:"JSON",
			success:function(json){
				var html = "";
				if(json.length > 0) {
					$.each(json, function(index, item){
						html += "<tr>";
						html += "<td class='comment'>"+(index+1)+"</td>";
						html += "<td>"+item.content+"</td>";
						html += "<td class='comment'>"+item.name+"</td>";
						html += "<td class='comment'>"+item.regDate+"</td>";
						html += "</tr>";
					});
				}
				else {
					html += "<tr>";
					html += "<td colspan='4' class='comment'>댓글이 없습니다</td>";
					html += "</tr>";
				}
				
				$("tbody#commentDisplay").html(html);
				
				// 페이지바 함수 호출
				makeCommentPageBar(currentShowPageNo);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		 	}
		});
		
	}// end of function goReadComment(){}------------------------
	
	
	// ==== 댓글내용 페이지바 Ajax로 만들기 ==== //
	function makeCommentPageBar(currentShowPageNo) {
	
		<%-- 원글에 대한 댓글의 totalPage 수를 알아오려고 한다. --%> 
		$.ajax({
			url:"<%= request.getContextPath()%>/getCommentTotalPage.food", 
			data:{"parentSeq":"${boardvo.seq}",
				  "sizePerPage":"5"},
			type:"GET",
			dataType:"JSON",
			success:function(json){
			//	console.log("전체페이지수 : " + json.totalPage);
				
				if(json.totalPage > 0) {
					// 댓글이 있는 경우
					
					var totalPage = json.totalPage;
					
					var pageBarHTML = "<ul style='list-style: none;'>";
					
					var blockSize = 2;
					// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수 이다.
					/*
					      1 2 3 4 5 6 7 8 9 10  다음                   -- 1개블럭
					   이전  11 12 13 14 15 16 17 18 19 20  다음   -- 1개블럭
					   이전  21 22 23
					*/
					
					var loop = 1;
					/*
				    	loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수[ 지금은 10개(== blockSize) ] 까지만 증가하는 용도이다.
				    */
				    
				    if(typeof currentShowPageNo == "string") {
				    	currentShowPageNo = Number(currentShowPageNo);
				    }
				    
				    // *** !! 다음은 currentShowPageNo 를 얻어와서 pageNo 를 구하는 공식이다. !! *** //
				    var pageNo = Math.floor( (currentShowPageNo - 1)/blockSize ) * blockSize + 1;
					/*  currentShowPageNo 가 2페이지 이라면 pageNo 는 1이 되어야 한다.
					    Math.floor((2 - 1)/10)*10 + 1 
					    ==>  Math.floor((1)/10)*10 + 1  
					    ==>  Math.floor(0.1)*10 + 1   // 소수부가 있을시 Math.floor(0.1) 은  0.1 보다 작은 최대의 정수인 0을 나타낸다.  
					    ==>   0*10+1  
					    ==>   1
					    
					    currentShowPageNo 가 11페이지 이라면 pageNo 는 11이 되어야 한다.
					    Math.floor((11 - 1)/10)*10 + 1 
					    ==>  Math.floor((10)/10)*10 + 1  
					    ==>  Math.floor(1)*10 + 1   // 소수부가 없을시 Math.floor(1) 은  그대로 1 이 된다.  
					    ==>   1*10+1  
					    ==>   11
					    
					    currentShowPageNo 가 20페이지 이라면 pageNo 는 11이 되어야 한다.
					    Math.floor((20 - 1)/10)*10 + 1 
					    ==>  Math.floor((19)/10)*10 + 1  
					    ==>  Math.floor(1.9)*10 + 1   // 소수부가 있을시 Math.floor(1.9) 은  1.9 보다 작은 최대의 정수인 1을 나타낸다.  
					    ==>   1*10+1  
					    ==>   11
				    */

					/*
					    1  2  3  4  5  6  7  8  9  10  -- 첫번째 블럭의 페이지번호 시작값(pageNo)은 1 이다.
					    11 12 13 14 15 16 17 18 19 20  -- 두번째 블럭의 페이지번호 시작값(pageNo)은 11 이다.
					    21 22 23 24 25 26 27 28 29 30  -- 세번째 블럭의 페이지번호 시작값(pageNo)은 21 이다.
					    
					    currentShowPageNo         pageNo
					   ----------------------------------
					         1                      1 = ((1 - 1)/10) * 10 + 1
					         2                      1 = ((2 - 1)/10) * 10 + 1
					         3                      1 = ((3 - 1)/10) * 10 + 1
					         4                      1
					         5                      1
					         6                      1
					         7                      1 
					         8                      1
					         9                      1
					         10                     1 = ((10 - 1)/10) * 10 + 1
					        
					         11                    11 = ((11 - 1)/10) * 10 + 1
					         12                    11 = ((12 - 1)/10) * 10 + 1
					         13                    11 = ((13 - 1)/10) * 10 + 1
					         14                    11
					         15                    11
					         16                    11
					         17                    11
					         18                    11 
					         19                    11 
					         20                    11 = ((20 - 1)/10) * 10 + 1
					         
					         21                    21 = ((21 - 1)/10) * 10 + 1
					         22                    21 = ((22 - 1)/10) * 10 + 1
					         23                    21 = ((23 - 1)/10) * 10 + 1
					         ..                    ..
					         29                    21
					         30                    21 = ((30 - 1)/10) * 10 + 1
					*/
						
					// === [맨처음][이전] 만들기 === 
					if(pageNo != 1) {
						pageBarHTML += "<li style='display:inline-block; width:60px; font-size:12pt;'><a href='javascript:goViewComment(\"1\")'>[맨처음]</a></li>"; 
						pageBarHTML += "<li style='display:inline-block; width:50px; font-size:11pt;'><a href='javascript:goViewComment(\""+(pageNo-1)+"\")'>[이전]</a></li>";
					}
						
					while( !(loop > blockSize || pageNo > totalPage) ) {
						
						if(pageNo == currentShowPageNo) {
							pageBarHTML += "<li style='display:inline-block; width:30px; font-size:11pt; border:solid 1px gray; color:red; padding:2px 4px;'>"+pageNo+"</li>";
						}
						else {
							pageBarHTML += "<li style='display:inline-block; width:30px; font-size:11pt;'><a href='javascript:goViewComment(\""+pageNo+"\")'>"+pageNo+"</a></li>";
						}
						
						loop++;
						pageNo++;
						
					}// end of while------------------------------
						
						
					// === [다음][마지막] 만들기 ===
					if( !(pageNo > totalPage) ) {
						pageBarHTML += "<li style='display:inline-block; width:50px; font-size:11pt;'><a href='javascript:goViewComment(\""+pageNo+"\")'>[다음]</a></li>";
						pageBarHTML += "<li style='display:inline-block; width:60px; font-size:11pt;'><a href='javascript:goViewComment(\""+totalPage+"\")'>[마지막]</a></li>";
					}
					
					pageBarHTML += "</ul>";
						
					$("div#pageBar").html(pageBarHTML);
				}
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		 	}
		});
		
	}// end of function makeCommentPageBar(currentShowPageNo){}----------
	
	
</script>

<div style="padding-left: 10%;">
	<h1>글내용보기</h1>
	
    <c:if test="${not empty boardvo}"> 
		<table id="table">
			<tr>
				<th>글번호</th>
				<td>${boardvo.seq}</td>
			</tr>
			<tr>
				<th>성명</th>
				<td>${boardvo.name}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${boardvo.subject}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
				 <p style="word-break: break-all;">${boardvo.content}</p>
				</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${boardvo.readCount}</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${boardvo.regDate}</td>
			</tr>
			
			<%-- === #162. 첨부파일 이름 및 파일크기를 보여주고 첨부파일을 다운로드 되도록 만들기 === --%>
			<tr>
				<th>첨부파일</th>
				<td>
					<c:if test="${sessionScope.loginuser != null}">
						<a href="<%= request.getContextPath()%>/download.food?seq=${boardvo.seq}">${boardvo.orgFilename}</a> 
					</c:if>
					<c:if test="${sessionScope.loginuser == null}">
						${boardvo.orgFilename}
					</c:if>
				</td>
			</tr>
			<tr>
				<th>파일크기(bytes)</th>
				<td><fmt:formatNumber value="${boardvo.fileSize}" pattern="#,###" /></td>
			</tr>
			
		</table>
		
		<br/>
		
		<c:set var="gobackURL2" value='${ fn:replace(gobackURL, "&" ," ") }' />
		<div style="margin-bottom: 1%;">이전글&nbsp;:&nbsp;<span class="move" onclick="javascript:location.href='view.food?seq=${boardvo.previousseq}&gobackURL=${gobackURL2}'">${boardvo.previoussubject}</span></div> 
		<div style="margin-bottom: 1%;">다음글&nbsp;:&nbsp;<span class="move" onclick="javascript:location.href='view.food?seq=${boardvo.nextseq}&gobackURL=${gobackURL2}'">${boardvo.nextsubject}</span></div>
	
    </c:if> 
	
	<c:if test="${empty boardvo}">
		<div style="padding: 50px 0; font-size: 16pt; color: red;">존재하지 않습니다</div>
	</c:if>
	
	<br/>
	
	 
	<button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/storeBoard/userBoardMain.food'">전체목록보기</button>
	
	<%--  === #126. 페이징 처리되어진 후 특정 글제목을 클릭하여 상세내용을 본 이후
		                        사용자가 목록보기 버튼을 클릭했을때 돌아갈 페이지를 알려주기 위해
		                        현재 페이지 주소를 뷰단으로 넘겨준다. --%>
	<button type="button" onclick="javascript:location.href='${gobackURL}'">목록보기</button>	                        
	
	<c:if test="${not empty sessionScope.loginuser}">
		<button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/edit.food?seq=${boardvo.seq}'">수정</button>
		<button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/del.food?seq=${boardvo.seq}'">삭제</button>
	</c:if>
	
    <%-- === #141. 어떤글에 대한 답변글쓰기는 로그인 되어진 회원의 gradelevel 컬럼의 값이 10 인 직원들만 답변글쓰기가 가능하다 --%>
    <c:if test="${sessionScope.loginuser.gradelevel == 10}">
    	<button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/add.food?fk_seq=${boardvo.seq}&groupno=${boardvo.groupno}&depthno=${boardvo.depthno}'">답변글쓰기</button>
	</c:if>

	<%-- === #83. 댓글쓰기 폼 추가 === --%>
	<c:if test="${not empty sessionScope.loginuser}">
		<h3 style="margin-top: 50px;">댓글쓰기 및 보기</h3>
		<form name="addWriteFrm" style="margin-top: 20px;">
			      <input type="hidden" name="fk_userid" value="${sessionScope.loginuser.userid}" />
			성명 : <input type="text" name="name" value="${sessionScope.loginuser.name}" class="short" readonly />  
			&nbsp;&nbsp;
			댓글내용 : <input id="commentContent" type="text" name="content" class="long" /> 
			
			<%-- 댓글에 달리는 원게시물 글번호(즉, 댓글의 부모글 글번호) --%>
			<input type="hidden" name="parentSeq" value="${boardvo.seq}" /> 
			
			<button id="btnComment" type="button" onclick="goAddWrite()">확인</button> 
			<button type="reset">취소</button> 
		</form>
	</c:if>
	
	<!-- ===== #94. 댓글 내용 보여주기 ===== -->
	<table id="table2" style="margin-top: 2%; margin-bottom: 3%;">
		<thead>
		<tr>
		    <th style="width: 10%; text-align: center;">번호</th>
			<th style="width: 60%; text-align: center;">내용</th>
			<th style="width: 10%; text-align: center;">작성자</th>
			<th style="text-align: center;">작성일자</th>
		</tr>
		</thead>
		<tbody id="commentDisplay"></tbody>
	</table>
	
	
	<%-- ==== #136. 댓글 페이지바 ==== --%>
	<div id="pageBar" style="border:solid 0px gray; width: 90%; margin: 10px auto; text-align: center;"></div>
	
</div>    

