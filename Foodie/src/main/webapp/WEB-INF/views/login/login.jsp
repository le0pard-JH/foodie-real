<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.net.InetAddress"%>
<%@ page import="java.util.Random" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<%
    String ctxPath = request.getContextPath(); // 오류 발생함.!! ctxPath 지역변수가 중복되었다는 오류메시지임.
%>



<style>
* {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
}

.wrap {
	height: 100%;
	width: 100%;
	background-image:
		url("<%= ctxPath %>/resources/img/login/background.jpg");	
 	
	background-position: center;
	background-size: cover;
	position: absolute;

}


.form-wrap {

 	width: 380px;
	height: 480px;
	margin: 35px auto;
	background: #fff;
	padding: 5px;
	position: relative;
	
	
}

.button-wrap {
	width: 230px;
	margin: 35px auto;
	position: relative;
	box-shadow: 0 0 600px 9px #fcae8f;
	border-radius: 30px;
	font-size: 10pt;
}

.togglebtn {
	padding: 10px 30px;
	cursor: pointer;
	background: transparent;
	border: 0;
	outline: none;
	position: relative;
}

#btn {
	top: 0;
	left: 0;
	position: absolute;
	width: 110px;
	height: 100%;
	background: linear-gradient(to right, #ff105f, #ffad06);
	border-radius: 30px;
	transition: .5s;
}

.input-group {
	top: 180px;
	position: absolute;
	width: 280px;
	transition: .5s;
}

.input-field {
	width: 100%;
	padding: 10px 0;
	margin: 5px 0;
	border: none;
	border-bottom: 1px solid #999;
	outline: none;
	background: transparent;
	display: block;
}

.submit {
	width: 100%;
	padding: 10px 30px;
	cursor: pointer;
	display: block;
	margin: auto;
	background: linear-gradient(to right, #ff105f, #ffad06);
	border: 0;
	outline: none;
	border-radius: 3px;
	font-weight: bolder;
}


#login {
	left: 50px;
}


.kakao {
	width: 240px;
	height: 38px;
}

.loginbtn {
	margin-left: 18pt;
	margin-top: 20pt;
}

.inputDiv {
	
	margin-left: 10%;
	margin-right: 10%;
}

button#kakaoBtn {
	
	width: 100%;
	padding: 10px 30px;
	cursor: pointer;
	display: block;
	margin: auto;
	background-image: url("<%= ctxPath %>/resources/img/login/kakao_login_medium_wide.png");
	border: 0;
	outline: none;
	border-radius: 3px;
	font-weight: bolder;
	
	
}

a:hover{
	background:white;
}

a {
	
	
}
</style>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script>


$("button#findEmail").click(function () {
	
		
	});
	
$("button#findPwd").click(function () {
	
	
});	




$(document).ready(function () {
	
$("button#register").click(function () {
		
		location.href="/foodie/signup.food";
	});
	
	
});

// ============= 카카오로 로그인 하기 시작 ============= 
// 설명이 잘 나온 사이트 : https://webruden.tistory.com/272 
//                   https://devtalk.kakao.com/t/topic/98626/2

Kakao.init('adf2708493f00cbb2f18296dc2c60b88');
function loginWithKakao() {

	Kakao.Auth.login({  // 카카오 로그인은  Kakao.Auth.login() 함수를 사용한다.
		success: function(authObj) { // 카카오 아이디와 비밀번호가 일치하여 카카오 사이트에 로그인이 성공할 경우 사용자 인증 토큰을 받으려고 시도하는 콜백함수 
			
			 Kakao.API.request({
			      url: "/v2/user/me",
			      success: function(res) {
			    	     
		        		var kakaoid = res.id;                                  // 사용자의 카카오 고유 id를 얻어온다.
			    	  	var name = res.kakao_account.profile.nickname;         // 사용자의 닉네임을 얻어온다.
			    	    var email = res.kakao_account.email;                   // 사용자의 이메일을 얻어온다.
			    	    var thumbnail_image = res.properties.thumbnail_image;  // 사용자의 썸네일 이미지 경로를 얻어온다.
			    	    
			    	    console.log(thumbnail_image);
			    	    
			    	    // 이메일 중복검사
			    	    $.ajax({
			        		url:"<%= request.getContextPath()%>/emailDuplicateCheck.food",
			        		data:{"email":email},  
			        		type:"post",
			        		dataType:"json",       
			        		success:function(json){
			        			console.log(json.isExists);
			        			
			        			if(json.isExists) {
			        				
			        				// 입력한 email 이 존재하는 경우라면  카카오로 로그인 
			        				
						       	 	var frm = document.kakaoLoginFrm;
						       	 	
		      		        		frm.kakaoid.value=kakaoid;
		      		        		frm.email.value=email;
		      		        		
		      		        		
		      		        		frm.action="/foodie/kakaoLogin.food";
		      		        		
		      		        		frm.method="POST";
		      		        		
		      		        		frm.submit();	 
		      		        		
			        			}
			        			
			        			else {
			        				// 입력한 email 이 DB 테이블에 존재하지 않는 경우라면 
			        				
			        				alert("회원가입 폼으로 이동합니다.");
			        				
			        				var frm = document.kakaoLoginFrm;
			        			
		      		        		frm.kakaoid.value=kakaoid;
		      		        		frm.email.value=email;
		      		        		frm.name.value=name;
		      		        		frm.thumbnail_image.value=thumbnail_image;
		      		        		
		      		        		frm.action="/foodie/signupKaKao.food";
		      		        		frm.method="POST";
		      		        		
		      		        		frm.submit();
			        				
			        				}
			        				
			        				    
			        			
			        		},
			        		
			        		error: function(request, status, error){
			        			
			        			
			    				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			    			}
			        	});	

				   },
				   fail: function(error) {
				       alert(JSON.stringify(error));
				   }
				   
			 });
			
    	},
		fail: function(err) {
			alert(JSON.stringify(err));
    	}
	});
}; // end of function loginWithKakao() {} --------------------------------------
// ============= 카카오로 로그인 하기 끝 ============= 	

	function find() {
		
		location.href="/foodie/find.food";
	};

	
	
</script>

<body>
	<div class="wrap">
		<div class="form-wrap">
			<div class="button-wrap">
				<div id="btn"></div>
					<button  type="button" class="togglebtn">LOG IN</button>
                	<button id="register" type="button" class="togglebtn">REGISTER</button>
			</div>
			<div class="social-icons">
			</div>
			
			<div class ="inputDiv">
				<form id="login" name="Login" action="<%= ctxPath%>/loginEnd.food" method="POST" style="text-align: center;">
					<input type="text" name="email" class="input-field" placeholder="User Email" required> 
					<input type="password" name="pwd" class="input-field" placeholder="Enter Password" required>
								
				 	<br>
				 	<br>
					<button id="loginbtn" class="submit">로그인</button>
					<br>
					<button type="button" class="submit"> <a href="/foodie/find.food" style="text-decoration: none; color: #333; " >이메일</a>&nbsp;/&nbsp;<a href="/foodie/findPw.food" style="text-decoration: none; color: #333;" >비밀번호 찾기</a></button>
					<br>
					<a href="javascript:loginWithKakao()"><img style="width:100%; " src="<%= ctxPath %>/resources/img/login/kakao_login_medium_wide.png"></a>
				</form>
			</div>
	
			<%-- 카카오 로그인 --%>
			<form name="kakaoLoginFrm">
				<input type="hidden" name="email" />
				<input type="hidden" name="kakaoid" />
				<input type="hidden" name="name" />
				<input type="hidden" name="thumbnail_image" />
			</form>


		</div>

	</div>
</body>
