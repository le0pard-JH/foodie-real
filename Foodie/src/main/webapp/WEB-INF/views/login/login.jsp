<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.net.InetAddress"%>
<%@ page import="java.util.Random" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<%
    String ctxPath = request.getContextPath(); // 오류 발생함.!! ctxPath 지역변수가 중복되었다는 오류메시지임.
	

	// 카카오 로그인에 사용될 사용자의 비밀번호를 랜덤하게 생성하도록 한다.
	Random rnd = new Random();

	String pwd = "";
	// 비밀번호 영문소문자 5글자 + 숫자 7글자 로 만들겠습니다.
    // 예: pwd ==> dngrn4745003

	char randchar = ' ';
	for(int i=0; i<5; i++) {
		/*
		    min 부터 max 사이의 값으로 랜덤한 정수를 얻으려면 
		    int rndnum = rnd.nextInt(max - min + 1) + min;
		       영문 소문자 'a' 부터 'z' 까지 랜덤하게 1개를 만든다.  	
		 */	
		
		randchar = (char) (rnd.nextInt('z' - 'a' + 1) + 'a');
		pwd += randchar;
	}// end of for----------------------------

	int randnum = 0;
	for(int i=0; i<7; i++) {
		randnum = rnd.nextInt(9 - 0 + 1) + 0;
		pwd += randnum;
	}// end of for----------------------------

	// System.out.println("~~~~ 확인용 pwd => " + pwd);
	// ~~~~ 확인용 pwd => bpjfz4641015
	
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
	position: relative;
	margin: 6% auto;
	background: #fff;
	padding: 5px;
	overflow: hidden;
}

.button-wrap {
	width: 230px;
	margin: 35px auto;
	position: relative;
	box-shadow: 0 0 600px 9px #fcae8f;
	border-radius: 30px;
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

.social-icons {
	margin: 30px auto;
	text-align: center;
}

.social-icons img {
	width: 30px;
	cursor: pointer;
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
}

.submit {
	width: 85%;
	padding: 10px 30px;
	cursor: pointer;
	display: block;
	margin: auto;
	background: linear-gradient(to right, #ff105f, #ffad06);
	border: 0;
	outline: none;
	border-radius: 30px;
}

.checkbox {
	margin: 30px 10px 30px 0;
}

span {
	color: #777;
	font-size: 12px;
	bottom: 68px;
	position: absolute;
}

#login {
	left: 50px;
}

#register {
	left: 450px;
}

.kakao {
	width: 240px;
	height: 38px;
}

.loginbtn {
	margin-left: 18pt;
	margin-top: 20pt;
}

</style>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>

<script>



var login = $("#login");
var register = $("#register");
var btn = $("#btn");


function login(){
    x.css("left", "50px");
    y.css("left", "450");
    z.css("left", "0");
    
}

function register(){
	
	
    location.href="/foodie/signup.food"; 
	

    
}


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
			    	  alert('카카오 사용자에 접근할 수 있는 인증 토큰을 발급받았습니다.\n'+ Kakao.Auth.getAccessToken());   

			    	  	
		        		var kakaoid = res.id; // 사용자의 카카오 고유 id를 얻어온다.
			    	  	var name = res.kakao_account.profile.nickname; // 사용자의 닉네임을 얻어온다.
			    	    var email = res.kakao_account.email; // 사용자의 이메일을 얻어온다.
			    	   	    	    
			    	    /* var userid = id;       // 사용자의 카카오 고유 id를 userid로 사용하도록 함. */
						      
			    	     

			    	    			    	    
			    	    $.ajax({
			        		url:"<%= request.getContextPath()%>/emailDuplicateCheck.food",
			        		data:{"email":email},  
			        		type:"post",
			        		dataType:"json",       
			        		success:function(json){
			        			console.log("json.isExists")
			        			if(json.isExists) {
			        				
			        				// 입력한 email 이 존재하는 경우라면 
			        				alert("카카오로 로그인 할께요."); 
			        				
						       	 	var frm = document.kakaoLoginFrm;
		      		        		frm.kakaoid.value=kakaoid;
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
		      		        		
		      		        		frm.action="/foodie/signup.food";
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

	
</script>

<body>
	<div class="wrap">
		<div class="form-wrap">
			<div class="button-wrap">
				<div id="btn"></div>
				<button type="button" class="togglebtn" onclick="login();">LOGIN</button>
				<button type="button" class="togglebtn" onclick="register();">REGISTER</button>
			</div>

			<div class="social-icons">

				<a href="javascript:loginWithKakao()"><img src="<%= ctxPath %>/resources/img/login/카카오.png"> </a>
				<img src="<%= ctxPath %>/resources/img/login/gl.png" alt="google">
			</div>



			<form id="login" action="<%=ctxPath%>/loginEnd.food" class="input-group" method="POST">
				<input type="text" name="email" class="input-field" placeholder="User Email" required> 
				<input type="password" name="pwd"class="input-field" placeholder="Enter Password" required>
				<div>
					<input type="checkbox" class="checkbox">Remember id
				</div>
				<button class="submit">Login</button>

			</form>

			<%-- 카카오 로그인 --%>
			<form name="kakaoLoginFrm">
				<input type="hidden" name="email" />
				<input type="hidden" name="kakaoid" />
				<input type="hidden" name="name" />
			</form>


		</div>

	</div>

</body>
