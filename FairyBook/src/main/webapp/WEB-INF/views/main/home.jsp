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
 
 <style>
 
	/*글씨체  */
	@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
	.hanna{
		font-family: 'Hanna', fantasy;
	}
	
	td{
		text-align: center;
	}

     .bg-1 { 
       background-color: #1abc9c; /* Green */
       color: #ffffff;
       margin-top: 8%;
      }
      
      .container-fluid {//패딩
          padding-top: 10px;
          padding-bottom: 10px;
      }
      .navbar {
          padding-top: 15px;
         
          border: 0;
          border-radius: 0;
          margin-bottom: 0;
          font-size: 12px;
          letter-spacing: 5px;
      }
      
      .navbar-nav li a:hover {
          color: #1abc9c !important;
      }
      .bg-4 { 
          background-color: #2f2f2f;
          color: #ffffff;
      }
</style>
<!--적용 자바스크립트와 스타일  -->
<link rel="stylesheet" href="./resources/css/main.css">
<script>

$(function(){
	homeImage();
	
   //profile사진 경로 설정
   $('#profile').attr('src','./resources/image/yo.jpg');

   //login버튼 이벤트
   $('#login').on('click',function(){
      location.href='./id/login';
   });
   //join버튼 이벤트
   $('#join').on('click',function(){
      location.href='./id/join';
   });
   //logout버튼 이벤트
   $('#logout').on('click',function(){
      if(confirm('로그아웃 하시겠습니까?'))
         location.href='./id/logout';
   });
   $('#update').on('click',function(){
      location.href='./id/userInfo';
   });
   
   
   //동화 선택 버튼 마우스오버
   $('#storyselect').on('mouseover',function(){
      $("#storyselect").attr('src',"./resources/image/icon/storyselect1.png");
   });
   
   //동화 선택 버튼 마우스아웃
   $('#storyselect').on('mouseout',function(){
      $("#storyselect").attr('src',"./resources/image/icon/storyselect.png");
   });
   
   //동화 감상 버튼 마우스오버
   $('#storyplay').on('mouseover',function(){
      $("#storyplay").attr('src',"./resources/image/icon/storyplay1.png");
   });
   
   //동화 감상 버튼 마우스아웃
   $('#storyplay').on('mouseout',function(){
      $("#storyplay").attr('src',"./resources/image/icon/storyplay.png");
   });
   
   //퀴즈 풀기 버튼 마우스오버
   $('#quizlist').on('mouseover',function(){
      $("#quizlist").attr('src',"./resources/image/icon/quizlist1.PNG");
   });
   
   //퀴즈 풀기 감상 버튼 마우스아웃
   $('#quizlist').on('mouseout',function(){
      $("#quizlist").attr('src',"./resources/image/icon/quizlist.png");
   });
   
   //내 아이 동화목록 버튼 마우스오버
   $('#mychildstory').on('mouseover',function(){
      $("#mychildstory").attr('src',"./resources/image/icon/mychildstory1.png");
   });
   
   //내 아이 동화목록 버튼 마우스아웃
   $('#mychildstory').on('mouseout',function(){
      $("#mychildstory").attr('src',"./resources/image/icon/mychildstory.png");
   });
   
   //게시판 버튼 마우스오버
   $('#board').on('mouseover',function(){
      $("#board").attr('src',"./resources/image/icon/board1.PNG");
   });
   
   //게시판 버튼 마우스아웃
   $('#board').on('mouseout',function(){
      $("#board").attr('src',"./resources/image/icon/board.png");
   });
   
   //상담 결과 보기 버튼 마우스오버
   $('#otherChildren').on('mouseover',function(){
      $("#otherChildren").attr('src',"./resources/image/icon/otherChildren1.png");
   });
   
   //상담 결과 보기 버튼 마우스아웃
   $('#otherChildren').on('mouseout',function(){
      $("#otherChildren").attr('src',"./resources/image/icon/otherChildren.png");
   });
   
   //장바구니 목록 버튼 마우스오버
   $('#ordercart').on('mouseover',function(){
      $("#ordercart").attr('src',"./resources/image/icon/ordercart1.png");
   });
   
   //장바구니 목록 버튼 마우스아웃
   $('#ordercart').on('mouseout',function(){
      $("#ordercart").attr('src',"./resources/image/icon/ordercart.png");
   });
   
   //주문 내역 버튼 마우스오버
   $('#confirmorder').on('mouseover',function(){
      $("#confirmorder").attr('src',"./resources/image/icon/confirmorder1.png");
   });
   
   //주문 내역 버튼 마우스아웃
   $('#confirmorder').on('mouseout',function(){
      $("#confirmorder").attr('src',"./resources/image/icon/confirmorder.png");
   });
   
   
   //login mouseover 이벤트
   $('#login').on('mouseover',function(){
      $('#login').css('cursor', 'pointer');
      $("#login").attr('src',"./resources/image/icon/loginbt1.png");
   });
   
   //login mouseout 이벤트
   $('#login').on('mouseout',function(){
      $("#login").attr('src',"./resources/image/icon/loginbt.png");
   }); 
   
   //join mouseover 이벤트
   $('#join').on('mouseover',function(){
      $('#join').css('cursor', 'pointer');   
      $("#join").attr('src',"./resources/image/icon/joinbt1.png");
   });
   
   //join mouseout 이벤트
   $('#join').on('mouseout',function(){
      $("#join").attr('src',"./resources/image/icon/joinbt.png");
   });
   
   //logout 커서 이벤트
   $('#logout').on('mouseover',function(){
      $('#logout').css('cursor', 'pointer');
      $("#logout").attr('src',"./resources/image/icon/logoutbt1.png");

   });
   
   //logout mouseout 이벤트
   $('#logout').on('mouseout',function(){
      $("#logout").attr('src',"./resources/image/icon/logoutbt.png");
   });
   
   //update 커서 이벤트
   $('#update').on('mouseover',function(){
      $('#update').css('cursor', 'pointer');
      $("#update").attr('src',"./resources/image/icon/userinfobt1.png");

   });
   
   //update mouseout 이벤트
   $('#update').on('mouseout',function(){
      $("#update").attr('src',"./resources/image/icon/userinfobt.png");
   });
   
});

function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

function myFunc(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show"; 
        x.previousElementSibling.className += " w3-red";
    } else { 
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-red", "");
    }
}

function homeImage(){
	var path = "./resources/img/homeNotLogin.png";
	var input = '<img src="' + path + '"id="homeMap" style="position: absolute;" usemap="#homeMap"/>';

	input += '<map name="homeMap">';
	
	input+='<area alt="login" shape="rect" coords="415, 752, 607, 813" onclick="location.href=\'./id/login\'">';
	input+='<area alt="join" shape="rect" coords="626, 752, 818, 813" onclick="location.href=\'./id/join\'">';

	$('#homeLoginJoin').html(input);
	
}

</script>

<body data-spy="scroll" data-target=".navbar" data-offset="50" style="height: 100%; position: relative;">

<!--상단, 사이드 메뉴  -->
<!--배너  -->
<nav class="navbar-fixed-top">
<div style="background-image: url('./resources/image/icon/banner.jpg');width: 100%;height: 100px;">
 <center><a href="./"><img src="./resources/image/icon/bannertitle.png" style="margin-top: 15px;"></a></center>
</div>
</nav>

<!-- 로그인 안했을 때의 페이지 내용 -->
<c:if test="${loginUser == null }">
	<div id="homeLoginJoin" style="display: ; top: 70%; left: 25%;">
	</div>
</c:if>

<!-- 로그인 했을 때 배경그림 -->
<c:if test="${loginUser != null }">
	<div id="under" style="min-height: 100%;background-image: url('./resources/image/icon/backg.png');width: 100%">
</c:if>
<!--로그인하지 않았을 때  -->
<c:if test="${loginUser == null }">
<%-- <nav class="w3-sidebar w3-bar-block w3-collapse w3-card-2" style="z-index:3;width:220px;background-image: url('./resources/image/icon/menubar.png');" id="mySidebar">
<div style="background-image: url('./resources/image/icon/userbar.png');">
  
 <center>
  <img src="./resources/image/icon/pleaselogin.png"><br>
  <img src="./resources/image/pp3.jpg" alt="img" style="width: 150px;" class="img-responsive img-circle" style="display:inline-block;"><br><!--circle image  -->
<!--   <button type="button" id="login" class="btn btn-success"><img src="./resources/image/icon/loginbt.png"></button>
 -->  
<!--  <button type="button" id="join" class="btn btn-warning"><img src="./resources/image/icon/joinbt.png"></button>
 -->   
 <img src="./resources/image/icon/loginbt.png" id="login">
 <img src="./resources/image/icon/joinbt.png" id="join">
  
  </center>
  <br><br>
  
  </div>
  <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu" 
  class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
<!--   <a href="javascript:void(0)" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align" onclick="document.getElementById('id01').style.display='block'">New Message <i class="w3-padding-left fa fa-pencil"></i></a>
 -->  
  <!-- <a href="menu/storySelect" class="w3-bar-item w3-button"><i class="fa fa-paper-plane w3-padding-right"></i>동화선택</a>
  <a href="menu/storyPlay" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>동화감상</a> -->
<a href="menu/storySelect"><img src="./resources/image/icon/storyselect.png" id="storyselect"></a>
 <br><br>
<a href="menu/storyPlay"><img src="./resources/image/icon/storyplay.png" id="storyplay"></a>
 <br><br>
</nav> --%>
</c:if>
<!--로그인 했을 때  -->
<c:if test="${loginUser != null }">
<!--아이로그인  -->
<c:if test="${userType == 'child'}">
<nav class="w3-sidebar w3-bar-block w3-collapse w3-animate-left w3-card-2" style="z-index:3;width:220px;background-image: url('./resources/image/icon/menubar.png');" id="mySidebar">
<div style="background-image: url('./resources/image/icon/userbar.png');">
  <center>
  <h5>${loginUser.cnickName}</h5>
  <img src="./resources/img/pinkunicorn.png" alt="img" style="width: 150px;background-color: white;" class="img-responsive img-circle" style="display:inline-block;"><br><!--circle image  -->
 <!--  <button type="button" id="update" class="btn btn-success">개인정보</button>
  <button type="button" id="logout" class="btn btn-warning">LOGOUT</button> -->
  <img src="./resources/image/icon/userinfobt.png" id="update">
 <img src="./resources/image/icon/logoutbt.png" id="logout">
  </center>
  <br><br>
  </div>
  <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu" 
  class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
<!--   <a href="javascript:void(0)" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align" onclick="document.getElementById('id01').style.display='block'">New Message <i class="w3-padding-left fa fa-pencil"></i></a>
 -->  
 <!-- <a href="menu/storySelect" class="w3-bar-item w3-button"><i class="fa fa-paper-plane w3-padding-right"></i>동화선택</a>
 <a href="menu/storyPlay" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>동화감상</a>
 <a href="quiz/quizList" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>문제풀기</a>
   -->
 <a href="menu/storySelect"><img src="./resources/image/icon/storyselect.png" id="storyselect"></a>
 <br><br>
 <a href="menu/storyPlay"><img src="./resources/image/icon/storyplay.png" id="storyplay"></a>
 <br><br>
 <a href="quiz/quizList"><img src="./resources/image/icon/quizlist.png" id="quizlist"></a>
 <br><br>
 <a href="menu/otherChildren"><img src="./resources/image/icon/otherChildren.png" id="otherChildren"></a>
</nav>
</c:if>
<!--부모 로그인했을때  -->
<c:if test="${userType == 'parent'}">
<nav class="w3-sidebar w3-bar-block w3-collapse w3-animate-left w3-card-2" style="z-index:3;width:220px;background-image: url('./resources/image/icon/menubar.png');" id="mySidebar">
<div style="background-image: url('./resources/image/icon/userbar.png');">
  <center>
  <h3>${loginUser.pnickName}</h3>
  <img src="./resources/img/yellowunicorn.png" alt="img" style="width: 150px;background-color: white;" class="img-responsive img-circle" style="display:inline-block;"><br><!--circle image  -->
  <!-- <button type="button" id="update" class="btn btn-success">개인정보</button>
  <button type="button" id="logout" class="btn btn-warning">LOGOUT</button> -->
  <img src="./resources/image/icon/userinfobt.png" id="update">
 <img src="./resources/image/icon/logoutbt.png" id="logout">
  </center>
  <br><br>
  </div>
  <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu" 
  class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
<!--   <a href="javascript:void(0)" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align" onclick="document.getElementById('id01').style.display='block'">New Message <i class="w3-padding-left fa fa-pencil"></i></a>
 -->  
  <!-- <a href="menu/myChildStory" class="w3-bar-item w3-button"><i class="fa fa-paper-plane w3-padding-right"></i>내 아이 동화 목록</a>
  <a href="pboard/listForm" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>게시판</a>
  <a href="menu/otherChildren" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>상담요청 결과보기</a>
  <a href="orderBook/orderCart" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>장바구니</a>
  <a href="orderBook/confirmOrder" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>주문내역</a>
   -->
  <a href="menu/myChildStory"><img src="./resources/image/icon/mychildstory.png" id="mychildstory"></a>
  <br><br>
  <a href="pboard/listForm"><img src="./resources/image/icon/board.png" id="board"></a>
  <br><br>
  <a href="orderBook/orderCart"><img src="./resources/image/icon/ordercart.png" id="ordercart"></a>
  <br><br>   
  <a href="orderBook/confirmOrder"><img src="./resources/image/icon/confirmorder.png" id="confirmorder"></a>
  <br><br>
  <a href="menu/otherChildren"><img src="./resources/image/icon/otherChildren.png" id="otherChildren"></a>
  
</nav>
</c:if>
</c:if>


<!-- Overlay effect when opening the side navigation on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="Close Sidemenu" id="myOverlay"></div>

 
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
   <c:if test="${url == 'board/list' }">
      <c:import url="pboard/list"></c:import>
   </c:if>
   <i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
   <a href="javascript:void(0)" class="w3-hide-large w3-red w3-button w3-right w3-margin-top w3-margin-right" onclick="document.getElementById('id01').style.display='block'"><i class="fa fa-pencil"></i></a>

   <c:if test="${userType == 'child'}">
      <div id="Borge" class="w3-container person">
        <br>
        <img src="./resources/image/smalltitle.png">
        <hr>
      </div>
      <!-- image -->
      
      <!-- 헨젤과 그레텔 -->
       <div class="w3-row-padding w3-padding-16">
          <div class="w3-third w3-margin-bottom">
            <img src="./resources/image/hansel.jpg" alt="Norway" style="width:100%">
            <div class="w3-container w3-white">
            <br>
        <img src="./resources/image/hanseltitle.png">
              <h6 class="w3-opacity">2017.3.22</h6>
             <button class="w3-button w3-block w3-pink w3-margin-bottom" onclick="location.href='story/storyTitle?storyNum=1'">Play</button>
            </div>
          </div>
          
       <!-- 백설공주 -->
          <div class="w3-third w3-margin-bottom">
            <img src="./resources/image/snowwhitetitle.jpg" alt="Norway" style="width:100%">
            <div class="w3-container w3-white">
            <br>
        <img src="./resources/image/whitesnowtitle.png">
              <h6 class="w3-opacity">2017.4.27</h6>
              <button class="w3-button w3-block w3-pink w3-margin-bottom" onclick="location.href='story/storyTitle?storyNum=2'">Play</button>
            </div>
          </div>
        
      <!-- 빨간 망토 -->
          <div class="w3-third w3-margin-bottom">
            <img src="./resources/image/redhoodtitle.jpg" alt="Norway" style="width:100%">
            <div class="w3-container w3-white">
              <br>
        <img src="./resources/image/redhoodtitle.png">
              <h6 class="w3-opacity">Please wait update</h6>
              <button class="w3-button w3-block w3-pink w3-margin-bottom">Play</button>
            </div>
          </div>
        </div>
     </c:if>

	<c:if test="${userType == 'parent'}">
		<div id="Borge" class="w3-container person">
     	<br>
		<img src="./resources/image/mychildstory.png">
     	</div>
     	
     	<table class="table-bordered table">
			<tr>
			<c:forEach var="story" items="${myStoryList}" varStatus="status">
			<c:if test="${status.index < 3 }">
			<td>
			<!-- 여기엔 썸네일이 들어간다 -->
			<a href="storySlide?selectionNum=${story.selectionNum}">
			<c:if test="${story.storyNum==0}">
				<img src="./resources/image/hiyoko.png" alt="노랑이의 모험" style="width:100%;"><br>
			</c:if>
			<c:if test="${story.storyNum==1}">
				<img src="./resources/image/hansel.jpg" alt="헨젤과그레텔" style="width:100%;"><br>
			</c:if>
			<c:if test="${story.storyNum==2}">
				<img src="./resources/image/snowwhitetitle.jpg" alt="백설공주" style="width:100%;"><br>
			</c:if>
			</a>
			<!-- 여기까지 썸네일 -->
				<div class="w3-container w3-white">
					<h3 class="hanna">
					<c:choose>
						<c:when test="${story.storyNum==0}">노랑이의 모험</c:when>
						<c:when test="${story.storyNum==1}">헨젤과 그레텔</c:when>			
						<c:when test="${story.storyNum==2}">백설공주</c:when>
						<c:when test="${story.storyNum==3}">빨간모자</c:when>
						<c:when test="${story.storyNum==4}">동물의 왕국</c:when>
					</c:choose>
					</h3>
					<h6 class="w3-opacity">${story.endDate}</h6>
					<form action="./slide/storySlide" method="post" style="display: inline;">
						<button type="submit" class="w3-button w3-red" style="margin-bottom:3px; width: 100%">감상하기</button>
						<input type="hidden" name="selectionNum" id="selectionNum" value="${story.selectionNum}">
						<input type="hidden" name="storyNum" id="storyNum" value="${story.storyNum}">
						<input type="hidden" name="id" id="id" value="${story.id}">
					</form>
				</div>
			</td>
			<c:if test="${status.count%3==0}">
				</tr>
				<tr>	
			</c:if>
			<c:if test="${status.last}">
				</tr>
			</c:if>
			</c:if>
		</c:forEach>
		</table>
	</c:if>
	
	<!-- 로그인 된 상태일 때 다른 아이들의 동화 보이기  -->
	<c:if test="${loginUser != null }">
     <div id="Borge" class="w3-container person">
     <br>
     <img src="./resources/image/smalltitle2.png">
     </div>
     <table class="table-bordered table">
		<tr>
		<c:forEach var="story" items="${yourStoryList}" varStatus="status">
		<c:if test="${status.index < 3 }">
		<td>
		<!-- 여기엔 썸네일이 들어간다 -->
		<a href="storySlide?selectionNum=${story.selectionNum}">
		<c:if test="${story.storyNum==0}">
			<img src="./resources/image/hiyoko.png" alt="노랑이의 모험" style="width:100%;"><br>
		</c:if>
		<c:if test="${story.storyNum==1}">
			<img src="./resources/image/hansel.jpg" alt="헨젤과그레텔" style="width:100%;"><br>
		</c:if>
		<c:if test="${story.storyNum==2}">
			<img src="./resources/image/snowwhitetitle.jpg" alt="백설공주" style="width:100%;"><br>
		</c:if>
		</a>
		<!-- 여기까지 썸네일 -->
			<div class="w3-container w3-white">
				<h3 class="hanna">
					${story.id}님의
				<c:choose>
					<c:when test="${story.storyNum==0}">노랑이의 모험</c:when>
					<c:when test="${story.storyNum==1}">헨젤과 그레텔</c:when>			
					<c:when test="${story.storyNum==2}">백설공주</c:when>
					<c:when test="${story.storyNum==3}">빨간모자</c:when>
					<c:when test="${story.storyNum==4}">동물의 왕국</c:when>
				</c:choose>
				</h3>
				<h6 class="w3-opacity">${story.endDate}</h6>
				<form action="./slide/storySlide" method="post" style="display: inline;">
					<button type="submit" class="w3-button w3-red" style="margin-bottom:3px; width: 100%">감상하기</button>
					<input type="hidden" name="selectionNum" id="selectionNum" value="${story.selectionNum}">
					<input type="hidden" name="storyNum" id="storyNum" value="${story.storyNum}">
					<input type="hidden" name="id" id="id" value="${story.id}">
				</form>
			</div>
		</td>
		<c:if test="${status.count%3==0}">
			</tr>
			<tr>	
		</c:if>
		<c:if test="${status.last}">
			</tr>
		</c:if>
		</c:if>
	</c:forEach>
	</table>

    </c:if>
</div>
</div>


<c:if test="${loginUser != null }">
<!--Footer  -->
<!--Add a navar  -->


<div style="
bottom:0;
width: 100%;
height: auto;">
<!--Footer  -->

<br><br>
<nav class="navbar navbar-default " >
   <footer class="container-fluid bg-4 text-center" style="position:fixed;
overflow:auto;
bottom: 0;
width: 100%;
"> 
   
     <p>Made By <a href="../">FairyBook.com</a></p>
     <p>Copyright ⓒJOKABURG All Rights Reserved</p>
   </footer>
</nav>
</c:if>
   

</div>
</body>
</html> 