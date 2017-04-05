<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>FairyBook</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--적용 자바스크립트와 스타일  -->

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!-- 페이스북 로그인 연결 -->
<script language="javascript" src="http://connect.facebook.net/ko_KR/all.js"></script>

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '176801956172556',
      xfbml      : true,
      version    : 'v2.8'
    });
    FB.AppEvents.logPageView();
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

  
  /* var fabceloginChk = 0;

  function loginFB(){

  if(fabceloginChk == 0){

	  FB.login(function(response) {
	
		  if (response.authResponse) {
		
		   fabceloginChk  = 1;
		   
		   alert('로그인 성공상태!!');
		   
		  
		
		  }
		  
		  else {   
		
			  alert('로그인에 실패했습니다!!!');
			
			  fabceloginChk  = 0;
		
		  }
	
	  }
	
	   , {scope: "user_about_me,email,user_birthday,publish_pages,manage_pages"} 
	
	  );

  }

 } */
 
 
 
//Only works after `FB.init` is called
function myFacebookLogin() {
FB.login(function(){
	// Note: The call will only work if you accept the permission request
	FB.api('/me/feed', 'post', {message: 'Hello, world!'});
}, {scope: 'publish_actions'});
}
</script>



</script>

	

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	
<!--####################여기부터  -->
<h1>SNS - Test</h1>

<!-- <input type="button" value="페이스북로그인!" onclick="loginFB()" />


<div class="fb-login-button" data-max-rows="1" data-size="icon" data-show-faces="false" data-auto-logout-link="false"></div>
 -->
<br><br>

<button onclick="myFacebookLogin()">Login with Facebook</button>



<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 
