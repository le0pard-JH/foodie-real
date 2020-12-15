<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.net.InetAddress"%>
<%@ page import="java.util.Random" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>


<%
	String ctxPath = request.getContextPath();
   //      /MyMVC
%>


<style>

   table#tblMemberRegister {
   	    width: 93%;
   	    
   	    /* 선을 숨기는 것 */
   	    border: hidden;
   	    
   	    margin: 10px;
   }  
   
   table#tblMemberRegister #th {
   		height: 40px;
   		text-align: center;
   		background-color: silver;
   		font-size: 14pt;
   }
   
   table#tblMemberRegister td {
   		/* border: solid 1px gray;  */
   		line-height: 30px;
   		padding-top: 8px;
   		padding-bottom: 8px;
   }
   
   .star { color: red;
           font-weight: bold;
           font-size: 13pt;
   }
   
</style>


<script type="text/javascript">
	var flagIdDuplicateClick = false;
	
	
	$(document).ready(function(){
		
		$("span.error").hide();
		$("input#name").focus();
		
		$("input#name").blur(function(){
			
			var name = $(this).val().trim();
			if(name == "") {
				// 입력하지 않거나 공백만 입력했을 경우
				$(":input").prop("disabled",true);
				$(this).prop("disabled",false);
			
			//	$(this).next().show();
			//  또는
			    $(this).parent().find(".error").show();
			
			    $(this).focus();
			}
			else {
				// 공백이 아닌 글자를 입력했을 경우 
			//	$(this).next().hide();
			//  또는
				$(this).parent().find(".error").hide();
				$(":input").prop("disabled",false);
			}
			
		}); // 아이디가 name 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.
		
		
		$("input#userid").blur(function(){
			
			var userid = $(this).val().trim();
			if(userid == "") {
				// 입력하지 않거나 공백만 입력했을 경우
				$(":input").prop("disabled",true);
				$(this).prop("disabled",false);
			
			//	$(this).next().show();
			//  또는
			    $(this).parent().find(".error").show();
			
			    $(this).focus();
			}
			else {
				// 공백이 아닌 글자를 입력했을 경우 
			//	$(this).next().hide();
			//  또는
				$(this).parent().find(".error").hide();
				$(":input").prop("disabled",false);
			}
			
		}); // 아이디가 userid 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.
		
		
		$("input#pwd").blur(function(){
			
			var pwd = $(this).val();
			
		 // var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
		 // 또는
			var regExp = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
			// 숫자/문자/특수문자/ 포함 형태의 8~15자리 이내의 암호 정규표현식 객체 생성
			
			var bool = regExp.test(pwd);
			
			if(!bool) {
				// 암호가 정규표현식에 위배된 경우
				$(":input").prop("disabled",true);
				$(this).prop("disabled",false);
			
			//	$(this).next().show();
			//  또는
			    $(this).parent().find(".error").show();
			
			    $(this).focus();
			}
			else {
				// 암호가 정규표현식에 맞는 경우
			//	$(this).next().hide();
			//  또는
				$(this).parent().find(".error").hide();
				$(":input").prop("disabled",false);
			}
			
		}); // 아이디가 pwd 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.
		

		$("input#pwdcheck").blur(function(){
			var pwd = $("input#pwd").val();
			var pwdcheck = $(this).val();
		 
			if(pwd != pwdcheck) {
				// 암호와 암호확인값이 틀린 경우
				$(":input").prop("disabled",true);
				$(this).prop("disabled",false);
				$("input#pwd").prop("disabled",false);
			
			//	$(this).next().show();
			//  또는
			    $(this).parent().find(".error").show();
			
			    $("input#pwd").focus();
			}
			else {
				// 암호와 암호확인값이 같은 경우
			//	$(this).next().hide();
			//  또는
				$(this).parent().find(".error").hide();
				$(":input").prop("disabled",false);
			}
			
		}); // 아이디가 pwdcheck 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.	
		

		$("input#email").blur(function(){

			var email = $(this).val();
			
			 // var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			 // 또는
			 var regExp = new RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i); 
			 // 이메일 정규표현식 객체 생성
				
			 var bool = regExp.test(email);
				
			 if(!bool) {
					// 이메일이 정규표현식에 위배된 경우
					$(":input").prop("disabled",true);
					$(this).prop("disabled",false);
				
				//	$(this).next().show();
				//  또는
				    $(this).parent().find(".error").show();
				
				    $(this).focus();
				}
			 else {
					// 이메일이 정규표현식에 맞는 경우
				//	$(this).next().hide();
				//  또는
					$(this).parent().find(".error").hide();
					$(":input").prop("disabled",false);
			 }
			
		}); // 아이디가 email 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.			
		

		$("input#hp2").blur(function(){
			
			var hp2 = $(this).val();  
			
		 // var regExp = /^[1-9][0-9]{2,3}$/g;
		 // 또는
			var regExp = new RegExp(/^[1-9][0-9]{2,3}$/g);
			// 숫자 3자리 또는 4자리만 들어오도록 검사해주는 정규표현식 객체 생성
			
			var bool = regExp.test(hp2);
			
			if(!bool) {
				// 국번이 정규표현식에 위배된 경우
				$(":input").prop("disabled",true);
				$(this).prop("disabled",false);
			
			//	$(this).next().show();
			//  또는
			    $(this).parent().find(".error").show();
			
			    $(this).focus();
			}
			else {
				// 국번이 정규표현식에 맞는 경우
			//	$(this).next().hide();
			//  또는
				$(this).parent().find(".error").hide();
				$(":input").prop("disabled",false);
			}
			
		}); // 아이디가 hp2 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.		

		
		$("input#hp3").blur(function(){
			
			var hp3 = $(this).val();  
			
		 // var regExp = /^\d{4}$/g;
		 // 또는
			var regExp = new RegExp(/^\d{4}$/g);
			// 숫자 4자리만 들어오도록 검사해주는 정규표현식 객체 생성
			
			var bool = regExp.test(hp3);
			
			if(!bool) {
				// 마지막 전화번호 4자리가 정규표현식에 위배된 경우
				$(":input").prop("disabled",true);
				$(this).prop("disabled",false);
			
			//	$(this).next().show();
			//  또는
			    $(this).parent().find(".error").show();
			
			    $(this).focus();
			}
			else {
				// 마지막 전화번호 4자리가 정규표현식에 맞는 경우
			//	$(this).next().hide();
			//  또는
				$(this).parent().find(".error").hide();
				$(":input").prop("disabled",false);
			}
			
		}); // 아이디가 hp3 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.	
		
		
		$("img#zipcodeSearch").click(function(){
			new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
	            }
	        }).open();					
		});
		
		////////////////////////////////////////////////////////////////
		var mmhtml = "";
		for(var i=1; i<=12; i++) {
			if(i<10) {
				mmhtml += "<option value ='0"+i+"'>0"+i+"</option>";
			}
			else {
				mmhtml += "<option value ='"+i+"'>"+i+"</option>";
			}
		}
		
		$("select#birthmm").html(mmhtml);
		
		
		var ddhtml = "";
		for(var i=1; i<=31; i++) {
			if(i<10) {
				ddhtml += "<option value ='0"+i+"'>0"+i+"</option>";
			}
			else {
				ddhtml += "<option value ='"+i+"'>"+i+"</option>";
			}
		}
		
		$("select#birthdd").html(ddhtml);
		
		
	
 
            
            ////// == 아이디중복검사하기 ==  //////
            $("img#idcheck").click(function(){
            	flagIdDuplicateClick = true; 

			    
            	$.ajax({
            		url:"<%= ctxPath%>/emailDuplicateCheck.food",
            		data:{"userid":$("input#userid").val()}, // data 는 /MyMVC/member/idDuplicateCheck.up 로 전송해야할 데이터를 말한다. 
            		type:"post", 
            		success:function(text){ 
            			 
            			
            			var json = JSON.parse(text); 
            			// JSON.parse(text); 은 JSON 형식으로 되어진 문자열을 자바스크립트 객체로 변환해주는 것이다.
        				// 조심할 것은 text 는 반드시 JSON 형식으로 되어진 문자열이어야 한다.
            			
            			if(json.isExists) {
            				// 입력한 userid 가 이미 사용중이라면 
            				$("span#idcheckResult").html($("input#userid").val()+" 은 중복된 ID 이므로 사용불가 합니다.").css("color","orange");
            				$("input#userid").val("");
            			}
            			else {
            				// 입력한 userid 가 DB 테이블에 존재하지 않는 경우라면 
             				$("span#idcheckResult").html("사용가능합니다").css("color","green");
            			}
            		},
            		error: function(request, status, error){
    					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
    				}
            	});

            });
            		
	}); // end of $(document).ready()--------------------------------
	
	
	function goRegister() {
		
		var radioCheckedLength = $("input:radio[name=gender]:checked").length;
		
		if(radioCheckedLength == 0) {
			alert("성별을 선택하셔야 합니다.");
			return;  // 종료 
		}
		
		var checkboxCheckedLength = $("input:checkbox[id=agree]:checked").length;
		
		if(checkboxCheckedLength == 0) {
			alert("이용약관에 동의하셔야 합니다.");
			return;  // 종료 
		}
			
		if(!flagIdDuplicateClick) { // 아이디중복확인을 클릭했는지 클릭안했는지 알아오기 위한 것임.
			alert("아이디중복확인 클릭하여 ID중복검사를 하세요!!");
			return; // 종료 
		}
		
		
	    //// 필수입력사항에 모두 입력이 되었는지 검사한다  ////
		var bFlagRequiredInfo = false;
		
		$(".requiredInfo").each(function(){
			var data = $(this).val();
			if(data == "") {
				bFlagRequiredInfo = true;
				alert("*표시된 필수입력사항은 모두 입력하셔야 합니다.");
				return false;  // break 라는 뜻이다.
			}
		});
		
		if(!bFlagRequiredInfo) {
			var frm = document.registerFrm;
			frm.action = "memberRegister.up";
			frm.method = "post";
			frm.submit();
		}
		
	}// end of function goRegister()---------------------------------
	
	
	// 이메일 중복여부 검사하기 
	function isExistEmailCheck() {
		
		$.ajax({
    		url:"<%= ctxPath%>/emailDuplicateCheck.up",
    		data:{"email":$("input#email").val()}, // data 는 /MyMVC/member/emailDuplicateCheck.up 로 전송해야할 데이터를 말한다. 
    		type:"post",
    		dataType:"json",   // Javascript Standard Object Notation.  dataType은  /MyMVC/member/emailDuplicateCheck.up 로 부터 실행되어진 결과물을 받아오는 데이터타입을 말한다. 
    		success:function(json){
    			if(json.isExists) {
    				
    				$("span#emailCheckResult").html($("input#email").val()+" 은 중복된 email 이므로 사용불가 합니다.").css("color","red");
    				$("input#email").val("");
    			}
    			else {
    				// 입력한 email 이 DB 테이블에 존재하지 않는 경우라면 
     				$("span#emailCheckResult").html("사용가능합니다").css("color","navy");
    			}
    		},
    		error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
    	});	
		
	}// end of function isExistEmailCheck()--------------------------
	
</script>


<div class="row" id="divRegisterFrm">
	<div class="col-md-12" align="center">
	<form name="registerFrm">
	
	<table id="tblMemberRegister">
		<thead>
		<tr>
			<th colspan="2" id="th">::: 회원가입 (<span style="font-size: 10pt; font-style: italic;"><span class="star">*</span>표시는 필수입력사항</span>) :::</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td style="width: 20%; font-weight: bold;">이메일&nbsp;<span class="star">*</span></td>
			<td style="width: 80%; text-align: left;"><input type="text" name="email" id="email" class="requiredInfo" placeholder="abc@def.com" /> 
			    <span class="error">이메일 형식에 맞지 않습니다.</span>
			    
			    <%-- ==== 퀴즈 시작 ==== --%>
			    <span style="display: inline-block; width: 80px; height: 30px; border: solid 1px gray; border-radius: 5px; font-size: 8pt; text-align: center; margin-left: 10px; cursor: pointer;" onclick="isExistEmailCheck();">이메일중복확인</span> 
			    <span id="emailCheckResult"></span>
			    <%-- ==== 퀴즈 끝 ==== --%>
			</td>
		</tr>
		
		<tr>
			<td style="width: 20%; font-weight: bold;">성명&nbsp;<span class="star">*</span></td>
			<td style="width: 80%; text-align: left;">
			    <input type="text" name="name" id="name" class="requiredInfo" /> 
				<span class="error">성명은 필수입력 사항입니다.</span>
			</td>
		</tr>
		<tr>
			<td style="width: 20%; font-weight: bold;">비밀번호&nbsp;<span class="star">*</span></td>
			<td style="width: 80%; text-align: left;"><input type="password" name="pwd" id="pwd" class="requiredInfo" />
				<span class="error">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로 입력하세요.</span>
			</td>
		</tr>
		<tr>
			<td style="width: 20%; font-weight: bold;">비밀번호확인&nbsp;<span class="star">*</span></td>
			<td style="width: 80%; text-align: left;"><input type="password" id="pwdcheck" class="requiredInfo" /> 
				<span class="error">암호가 일치하지 않습니다.</span>
			</td>
		</tr>

		<tr>
			<td style="width: 20%; font-weight: bold;">연락처</td>
			<td style="width: 80%; text-align: left;">
			    <input type="text" id="hp1" name="hp1" size="6" maxlength="3" value="010" readonly />&nbsp;-&nbsp;
			    <input type="text" id="hp2" name="hp2" size="6" maxlength="4" />&nbsp;-&nbsp;
			    <input type="text" id="hp3" name="hp3" size="6" maxlength="4" />
			    <span class="error">휴대폰 형식이 아닙니다.</span>
			</td>
		</tr>
		

		<tr>
			<td colspan="2" style="line-height: 90px;">
				<button type="button" id="btnRegister" style="background-image:url('/MyMVC/images/join.png'); border:none; width: 135px; height: 34px; margin-left: 30%;" onClick="goRegister();"></button> 
			</td>
		</tr>
		</tbody>
	</table>
	</form>
	</div>
</div>


