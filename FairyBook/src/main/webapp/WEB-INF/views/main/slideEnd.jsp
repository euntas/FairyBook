<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>slideEnd</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">
<style>
/*글씨체  */
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
.hanna{
	font-family: 'Hanna', fantasy;
}

td{
	text-align: center;
}

</style>

<script>
/**
 * sns 공유를 위한 페북 로긴과정
 */
 var accessToken;
 
 function statusChangeCallback(response) {
   console.log('statusChangeCallback');
   console.log(response);
  
   if (response.status === 'connected') {
     accessToken = response.authResponse.accessToken;
     testAPI();
   } else {
     console.log('Please log ' +
       'into this app.');
   }
 }

 function checkLoginState() {
   FB.getLoginStatus(function(response) {
     statusChangeCallback(response);
     accessToken = response.authResponse.accessToken;
   });
 }

 window.fbAsyncInit = function() {
 FB.init({
   appId      : '176801416172610',
   cookie     : true,  // enable cookies to allow the server to access 
                       // the session
   oauth: true,
   xfbml      : true,  // parse social plugins on this page
   version    : 'v2.8' // use graph api version 2.8
 });

 FB.getLoginStatus(function(response) {
   statusChangeCallback(response);
 });

 };
 
 (function(d, s, id) {
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) return;
   js = d.createElement(s); js.id = id;
   js.src = "//connect.facebook.net/en_US/sdk.js";
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'));

 function testAPI() {
   console.log('Welcome!  Fetching your information.... ');
   FB.api('/me', function(response) {
     console.log('Successful login for: ' + response.name);/* 
     document.getElementById('status').innerHTML =
       'Thanks for logging in, ' + response.name + '!'; */
   });
 }
 
 // 실제 글 올리는 함수
 function myWrite(storyNum, selectionNum){
	 var str = '동화는 ' + storyNum + ' 이고 셀렉션넘버는 ' + selectionNum + '입니다.';
	 
	  FB.ui(
			  {
			    method: 'feed',
			    name: '내 애가 이렇게 잘해요',
			    link: 'www.naver.com',
			    picture: 'http://postfiles9.naver.net/MjAxNzAzMjhfMjY0/MDAxNDkwNjYyMTYyMTE4.bCGt0pjpam6jrn7YyvKpRaoCHx1CbRsmS23hIdkmQ40g.s8ATCxA34KfiheIts97FQHgpOE2q1YD9mmF95aD_W8Eg.PNG.tavstaus/farian.png?type=w3',
			    //caption: '',
			    description: str
			  });
	  
 }
 
 function downloadPDF(){
		var num=$('#selectionnum').val();
		$.ajax({
			url:'../pdf/imgToPdf',
			data:{selectionnum:num},
			success:function(){
				location.href='../pdf/download?selectionnum='+num;
			},
			fail:function(){
				alert('download fail');
			}
		});
	}
</script>

<!--적용 자바스크립트와 스타일  -->


<body data-spy="scroll" data-target=".navbar" data-offset="50" style="height: 100%;" class="hanna">

<!--상단, 사이드 메뉴  -->
<c:import url="main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px; min-height: 100%;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	

<!--####################여기부터  -->
<img src="../resources/image/mychildstory.png">  <hr>
<table class="table-bordered table">
	<tr>
	<td>
	<!-- 여기엔 엔딩페이지가 들어간다 -->
	<img src="../resources/img/scene${storyNum}/scene${lastScene}.jpg" alt="Norway" style="width:100%;"><br>
	<!-- 여기까지 썸네일 -->
	<div class="w3-container w3-white">
		<h3 class="hanna">
		
		</h3>
		<form action="../slide/storySlide" method="post" style="display: inline;">
			<button type="submit" class="w3-button w3-red">감상</button>
			<input type="hidden" name="selectionNum" id="selectionNum" value="${story.selectionNum}">
			<input type="hidden" name="storyNum" id="storyNum" value="${story.storyNum}">
		</form>
		<form action="../orderBook/order" method="post" style="display: inline;">
			<input type="hidden" class="orderSelectionnum" name="selectionnum" id="selectionnum" value="${story.selectionNum}">
			<button type="submit" class="w3-button w3-yellow" style="margin-top: 3px;">주문하기</button>
		</form>
			<button class="w3-button w3-purple w3-margin-bottom" onclick="javascript:downloadPDF();">PDF저장</button>
	</div>
	</td>
	<td>
	
	</td>
	</tr>
</table>
<!--여기까지###########################  -->

</div>


<!--Footer  -->
<div style="bottom:0;
width: 100%;
height: auto;
position: fixed;">
<c:import url="mainFooter.jsp"></c:import>
</div>
</body>
</html> 
 
