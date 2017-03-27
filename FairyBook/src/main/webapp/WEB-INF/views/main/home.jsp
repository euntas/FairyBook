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
<link rel="stylesheet" href="./resources/css/main.css">
<script>
$(function(){
	//profile사진 경로 설정
	$('#profile').attr('src','./resources/image/yo.jpg')

	//login버튼 이벤트
	$('#login').on('click',function(){
		location.href='id/login';
	});
	//join버튼 이벤트
	$('#join').on('click',function(){
		location.href='id/join';
	});
	//logout버튼 이벤트
	$('#logout').on('click',function(){
		if(confirm('로그아웃 하시겠습니까?'))
			location.href='id/logout';
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

</script>



<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<!--배너  -->
<nav class="navbar-fixed-top">
<div class="container-fluid bg-2 text-center">
  <h1>Fairytale Book</h1>
</div>
</nav>

<div id="under">
<!-- Side Navigation -->
<!--로그인하지 않았을 때  -->
<c:if test="${loginUser == null }">
<nav class="w3-sidebar w3-bar-block w3-collapse w3-white w3-animate-left w3-card-2" style="z-index:3;width:220px;" id="mySidebar">
  <div class="container-fluid bg-1">
  <h3>로그인 하세요</h3>
  <center><img src="./resources/image/pp3.jpg" alt="img" style="width: 150px;" class="img-responsive img-circle" style="display:inline-block;"></center><br><!--circle image  -->
  <button type="button" id="login" class="btn btn-success">LOGIN</button>
  <button type="button" id="join" class="btn btn-warning">JOIN</button>
  <br><br>
  </div>
  <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu" 
  class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align" onclick="document.getElementById('id01').style.display='block'">New Message <i class="w3-padding-left fa fa-pencil"></i></a>
  
  <a href="menu/storySelect" class="w3-bar-item w3-button"><i class="fa fa-paper-plane w3-padding-right"></i>동화선택</a>
  <a href="menu/storyPlay" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>동화감상</a>
</nav>
</c:if>
<!--로그인 했을 때  -->
<c:if test="${loginUser != null }">
<!--아이로그인  -->
<c:if test="${userType == 'child'}">
<nav class="w3-sidebar w3-bar-block w3-collapse w3-white w3-animate-left w3-card-2" style="z-index:3;width:220px;" id="mySidebar">
  <div class="container-fluid bg-1">
  <h3>${loginUser.cnickName}</h3>
  <center><img src="./resources/image/yo.jpg" alt="img" style="width: 150px;" class="img-responsive img-circle" style="display:inline-block;"></center><br><!--circle image  -->
  <button type="button" id="update" class="btn btn-success">개인정보</button>
  <button type="button" id="logout" class="btn btn-warning">LOGOUT</button>
  <br><br>
  </div>
  <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu" 
  class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align" onclick="document.getElementById('id01').style.display='block'">New Message <i class="w3-padding-left fa fa-pencil"></i></a>
  
  <a href="menu/storySelect" class="w3-bar-item w3-button"><i class="fa fa-paper-plane w3-padding-right"></i>동화선택</a>
  <a href="menu/storyPlay" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>동화감상</a>
  <a href="menu/quizSolve" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>문제풀기</a>
</nav>
</c:if>
<!--부모 로그인했을때  -->
<c:if test="${userType == 'parent'}">
<nav class="w3-sidebar w3-bar-block w3-collapse w3-white w3-animate-left w3-card-2" style="z-index:3;width:220px;" id="mySidebar">
  <div class="container-fluid bg-1">
  <h3>${loginUser.pnickName}</h3>
  <center><img src="./resources/image/pp4.jpg" alt="img" style="width: 150px;" class="img-responsive img-circle" style="display:inline-block;"></center><br><!--circle image  -->
  <button type="button" id="update" class="btn btn-success">개인정보</button>
  <button type="button" id="logout" class="btn btn-warning">LOGOUT</button>
  <br><br>
  </div>
  <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu" 
  class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align" onclick="document.getElementById('id01').style.display='block'">New Message <i class="w3-padding-left fa fa-pencil"></i></a>
  
  <a href="menu/myChildStory" class="w3-bar-item w3-button"><i class="fa fa-paper-plane w3-padding-right"></i>내 아이 동화 목록</a>
  <a href="pboard/list" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>게시판</a>
  <a href="menu/counselResult" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>상담요청 결과보기</a>
</nav>
</c:if>
</c:if>

<!-- Modal that pops up when you click on "New Message" -->
<div id="id01" class="w3-modal" style="z-index:4">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-padding w3-red">
       <span onclick="document.getElementById('id01').style.display='none'"
       class="w3-button w3-red w3-right w3-xxlarge"><i class="fa fa-remove"></i></span>
      <h2>Send Mail</h2>
    </div>
    <div class="w3-panel">
      <label>To</label>
      <input class="w3-input w3-border w3-margin-bottom" type="text">
      <label>From</label>
      <input class="w3-input w3-border w3-margin-bottom" type="text">
      <label>Subject</label>
      <input class="w3-input w3-border w3-margin-bottom" type="text">
      <input class="w3-input w3-border w3-margin-bottom" style="height:150px" placeholder="What's on your mind?">
      <div class="w3-section">
        <a class="w3-button w3-red" onclick="document.getElementById('id01').style.display='none'">Cancel  <i class="fa fa-remove"></i></a>
        <a class="w3-button w3-right" onclick="document.getElementById('id01').style.display='none'">Send  <i class="fa fa-paper-plane"></i></a> 
      </div>    
    </div>
  </div>
</div>

<!-- Overlay effect when opening the side navigation on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="Close Sidemenu" id="myOverlay"></div>


 
 
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
	<c:if test="${url == 'board/list' }">
		<c:import url="pboard/list"></c:import>
	</c:if>
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	<a href="javascript:void(0)" class="w3-hide-large w3-red w3-button w3-right w3-margin-top w3-margin-right" onclick="document.getElementById('id01').style.display='block'"><i class="fa fa-pencil"></i></a>
	
	<div id="Borge" class="w3-container person">
	  <br>
	  <h4>이 주의 업데이트</h4>
	  <hr>
	</div>
	<!-- image -->
	 <div class="w3-row-padding w3-padding-16">
	    <div class="w3-third w3-margin-bottom">
	      <img src="./resources/image/book.jpg" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>헨젤과 그레텔</h3>
	        <h6 class="w3-opacity">2017.3.22</h6>
	        <button class="w3-button w3-block w3-yellow w3-margin-bottom" onclick="location.href='story/storyStart?storyNum=0'">Play</button>
	      </div>
	    </div>
	    <div class="w3-third w3-margin-bottom">
	      <img src="./resources/image/pp1.png" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>Double Room</h3>
	        <h6 class="w3-opacity">From $149</h6>
	        <button class="w3-button w3-block w3-yellow w3-margin-bottom">Play</button>
	      </div>
	    </div>
	    <div class="w3-third w3-margin-bottom">
	      <img src="./resources/image/pp3.jpg" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>Deluxe Room</h3>
	        <h6 class="w3-opacity">From $199</h6>
	        <button class="w3-button w3-block w3-yellow w3-margin-bottom">Play</button>
	      </div>
	    </div>
	  </div>

	  <div id="Borge" class="w3-container person">
	  <br>
	  <h4>다른 어린이들의 동화</h4>
	  <hr>
	  </div>
	  <div class="w3-row-padding w3-padding-16">
	    <div class="w3-third w3-margin-bottom">
	      <img src="./resources/image/book.jpg" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>헨젤과 그레텔</h3>
	        <h6 class="w3-opacity">2017.3.22</h6>
	        <button class="w3-button w3-block w3-green w3-margin-bottom">Play</button>
	      </div>
	    </div>
	    <div class="w3-third w3-margin-bottom">
	      <img src="./resources/image/pp1.png" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>Double Room</h3>
	        <h6 class="w3-opacity">From $149</h6>
	        <button class="w3-button w3-block w3-green w3-margin-bottom">Play</button>
	      </div>
	    </div>
	    <div class="w3-third w3-margin-bottom">
	      <img src="./resources/image/pp3.jpg" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>Deluxe Room</h3>
	        <h6 class="w3-opacity">From $199</h6>
	        <button class="w3-button w3-block w3-green w3-margin-bottom">Play</button>
	      </div>
	    </div>
	  </div>
</div>
</div>

<!--Footer  -->
<!--Add a navar  -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="#">Me</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">WHO</a></li>
        <li><a href="#">WHAT</a></li>
        <li><a href="#">WHERE</a></li>
      </ul>
    </div>
  </div>
</nav>

<footer class="container-fluid bg-4 text-center">
  <p>Made By <a href="./">FairyBook.com</a></p> 
</footer>

</body>
</html> 
