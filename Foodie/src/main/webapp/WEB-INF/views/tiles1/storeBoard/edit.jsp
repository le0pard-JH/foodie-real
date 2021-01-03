<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>    

<style type="text/css">

	table, th, td, input, textarea {border: solid gray 1px;}
	
	#table {border-collapse: collapse;
	 		width: 1024px;
	 		}
	#table th, #table td{padding: 5px;}
	#table th{width: 120px; background-color: #DDDDDD;}
	#table td{width: 880px;}
	.long {width: 470px;}
	.short {width: 120px;}

</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		<%-- === #167. 스마트 에디터 구현 시작 === --%>
	 	//전역변수
	    var obj = [];
	    
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "content",
	        sSkinURI: "<%= request.getContextPath() %>/resources/smarteditor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,
	        }
	    });
	    <%-- === 스마트 에디터 구현 끝 === --%>
		
		// 완료버튼
		$("button#btnUpdate").click(function(){
			
			<%-- === 스마트 에디터 구현 시작 === --%>
		 	 //id가 content인 textarea에 에디터에서 대입
	         obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		    <%-- === 스마트 에디터 구현 끝 === --%>
			
			// 글제목 유효성 검사
			var subjectVal = $("input#subject").val().trim();
			if(subjectVal == "") {
				alert("글제목을 입력하세요!!");
				return;
			}
			
			// 글내용 유효성 검사(스마트에디터 사용 안 할시)
		<%--
			var contentVal = $("textarea#content").val().trim();
			if(contentVal == "") {
				alert("글내용을 입력하세요!!");
				return;
			}
		--%>
			
			<%-- === 스마트에디터 구현 시작 === --%>
			// 스마트에디터 사용시 무의미하게 생기는 p태그 제거
			 var contentval = $("textarea#content").val();
			        
	        // === 확인용 ===
	        // alert(contentval); // content에 내용을 아무것도 입력치 않고 쓰기할 경우 알아보는것.
	        // "<p>&nbsp;</p>" 이라고 나온다.
	        
	        // 스마트에디터 사용시 무의미하게 생기는 p태그 제거하기전에 먼저 유효성 검사를 하도록 한다.
	        // 글내용 유효성 검사 
		       if(contentval == "" || contentval == "<p>&nbsp;</p>") {
		           alert("글내용을 입력하세요!!");
		           return;
		       }
		        
		     // 스마트에디터 사용시 무의미하게 생기는 p태그 제거하기
		        contentval = $("textarea#content").val().replace(/<p><br><\/p>/gi, "<br>"); //<p><br></p> -> <br>로 변환
		    /*    
		                대상문자열.replace(/찾을 문자열/gi, "변경할 문자열");
		        ==> 여기서 꼭 알아야 될 점은 나누기(/)표시안에 넣는 찾을 문자열의 따옴표는 없어야 한다는 점입니다. 
		                     그리고 뒤의 gi는 다음을 의미합니다.

		        	g : 전체 모든 문자열을 변경 global
		        	i : 영문 대소문자를 무시, 모두 일치하는 패턴 검색 ignore
		    */    
		        contentval = contentval.replace(/<\/p><p>/gi, "<br>"); //</p><p> -> <br>로 변환  
		        contentval = contentval.replace(/(<\/p><br>|<p><br>)/gi, "<br><br>"); //</p><br>, <p><br> -> <br><br>로 변환
		        contentval = contentval.replace(/(<p>|<\/p>)/gi, ""); //<p> 또는 </p> 모두 제거시
		    
		        $("textarea#content").val(contentval);
		     
		        // alert(contentval);
			<%-- === 스마트에디터 구현 끝 === --%>
			
			// 글암호 유효성 검사
			var pwVal = $("#pw").val().trim();
			if(pwVal == "") {
				alert("글암호를 입력하세요!!");
				return;
			}
			
			// 폼(form)을 전송(submit)
			var frm = document.editFrm;
			frm.method = "POST";
			frm.action = "<%= ctxPath%>/editEnd.food";
			frm.submit();
		});
				
	});// end of $(document).ready(function(){})----------------
	
</script>

<div style="padding-left: 10%;">
	<h1>글수정</h1>

	<form name="editFrm">
		<table id="table">
			<tr>
				<th>성명</th>
				<td>
				    <input type="hidden" name="seq" value="${boardvo.seq}" />
					${boardvo.name}       
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" id="subject" class="long" value="${boardvo.subject}" />       
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="10" cols="100" style="width: 95%; height: 612px;" name="content" id="content">${boardvo.content}</textarea>       
				</td>
			</tr>
			<tr>
				<th>글암호</th>
				<td>
					<input type="password" name="pw" id="pw" class="short" />       
				</td>
			</tr>
		</table>
		
		<div style="margin: 20px;">
			<button type="button" id="btnUpdate">완료</button>
			<button type="button" onclick="javascript:history.back()">취소</button>
		</div>
			
	</form>
	
</div>
