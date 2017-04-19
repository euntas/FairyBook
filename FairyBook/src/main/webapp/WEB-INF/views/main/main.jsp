<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--배너  -->
<nav class="navbar-fixed-top">
<div class="container-fluid bg-2 text-center">
  <h1 id="banner">Fairytale Book</h1>
</div>
</nav>

<div id="under">
<!-- Side Navigation -->
<!--로그인하지 않았을 때  -->
<c:if test="${loginUser == null }">
<nav class="w3-sidebar w3-bar-block w3-collapse w3-white w3-animate-left w3-card-2" style="z-index:3;width:220px;" id="mySidebar">
  <div class="container-fluid bg-1">
  <h3>로그인 하세요</h3>
  <center><img id="profile" alt="img" style="width: 150px;" class="img-responsive img-circle" style="display:inline-block;"></center><br><!--circle image  -->
  <button type="button" id="login" class="btn btn-success">LOGIN</button>
  <button type="button" id="join" class="btn btn-warning">JOIN</button>
  <br><br>
  </div>
  <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu" 
  class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align" onclick="document.getElementById('id01').style.display='block'">New Message <i class="w3-padding-left fa fa-pencil"></i></a>
  
  <a href="../menu/storySelect" class="w3-bar-item w3-button"><i class="fa fa-paper-plane w3-padding-right"></i>동화선택</a>
  <a href="../menu/storyPlay" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>동화감상</a>
</nav>
</c:if>
<!--로그인 했을 때  -->
<c:if test="${loginUser != null }">
<!--아이로그인  -->
<c:if test="${userType == 'child'}"> <!--w3-animate-left   -->
<nav class="w3-sidebar w3-bar-block w3-collapse w3-white w3-card-2" style="z-index:3;width:220px;" id="mySidebar">
  <div class="container-fluid bg-1">
  <h3>${loginUser.cnickName}</h3>
  <center><img src="./../resources/image/yo.jpg" alt="img" style="width: 150px;" class="img-responsive img-circle" style="display:inline-block;"></center><br><!--circle image  -->
  <button type="button" id="update" class="btn btn-success">개인정보</button>
  <button type="button" id="logout" class="btn btn-warning">LOGOUT</button>
  <br><br>
  </div>
  <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu" 
  class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align" onclick="document.getElementById('id01').style.display='block'">New Message <i class="w3-padding-left fa fa-pencil"></i></a>
  
  <a href="../menu/storySelect" class="w3-bar-item w3-button"><i class="fa fa-paper-plane w3-padding-right"></i>동화선택</a>
  <a href="../menu/storyPlay" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>동화감상</a>
  <a href="../quiz/quizList" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>문제풀기</a>
  
  
</nav>
</c:if>
<!--부모 로그인했을때  -->
<c:if test="${userType == 'parent'}">
<nav class="w3-sidebar w3-bar-block w3-collapse w3-white <!-- w3-animate-left --> w3-card-2" style="z-index:3;width:220px;" id="mySidebar">
  <div class="container-fluid bg-1">
  <h3>${loginUser.pnickName}</h3>
  <center><img src="./../resources/image/pp4.jpg" alt="img" style="width: 150px;" class="img-responsive img-circle" style="display:inline-block;"></center><br><!--circle image  -->
  <button type="button" id="update" class="btn btn-success">개인정보</button>
  <button type="button" id="logout" class="btn btn-warning">LOGOUT</button>
  <br><br>
  </div>
  <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu" 
  class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align" onclick="document.getElementById('id01').style.display='block'">New Message <i class="w3-padding-left fa fa-pencil"></i></a>
  
  <a href="../menu/storyPlay" class="w3-bar-item w3-button"><i class="fa fa-paper-plane w3-padding-right"></i>내 아이 동화 목록</a>
  <a href="../pboard/listForm" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>게시판</a>
  <a href="../menu/counselResult" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>상담요청 결과보기</a>
  <a href="../orderBook/orderCart" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>장바구니</a>
  <a href="../orderBook/confirmOrder" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>주문내역</a>
  
  
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


</body>
</html> 
