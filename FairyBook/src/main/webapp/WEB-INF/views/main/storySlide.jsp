<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>Slide Show</title>
<script src="../resources/js/slideShow.js"></script>
<script src="../resources/js/jquery-3.1.1.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">
<style>
img{
	position: absolute;
	width: 100%;
	height: 100%;
}

#menu{
	position: absolute;
	width: 59%;
	height: 10%;
	top: 80%;
	left: 21%;
	opacity: 0;
	text-align: center;
	z-index: 99;
}

.btn{
	width: 90px;
	height: 90px;
	background-color: rgba(0,0,0,0);
	background-repeat: no-repeat;
	background-size: 100% 100%;
}
</style>
<script>
$(document).ready(function(){
	
	$('#slideShowImages').css("visibility", "hidden");
	$('#loadingImg').css("visibility", "visible");
	  
	$('#menu').on('mouseenter', showMenu);
	$('#menu').on('mouseleave', hideMenu);
    $('#replayButton').css('background-image',"url('../resources/img/util/replaybtn.png')");
    $('#homeButton').css('background-image',"url('../resources/img/util/homebtn.png')");
    $('#musicButton').css('background-image',"url('../resources/img/util/musicbtn.png')");
    
});

function showMenu(){
	$('#menu').animate({opacity: '1'});
}

function hideMenu(){
	$('#menu').animate({opacity: '0.0'});
}

function music(){
	var myAudio = document.getElementById("music");
	if(myAudio.paused){
		myAudio.play();
		$('#musicButton').css('background-image',"url('../resources/img/util/musicbtn.png')");
	}else{
		myAudio.pause();
		$('#musicButton').css('background-image',"url('../resources/img/util/nomusicbtn.png')");
	}
}

function storyEnd(){
	var form = document.getElementById("form");
	form.submit();
}

</script>

</head>
<body>
<audio src="../resources/bgm/bgm.mp3" autoplay="autoplay" loop="loop" id="music"></audio>

<img id="loadingImg" alt="로딩이미지" src="../resources/img/util/loadingIcon.gif">

<div id="slideShowImages">
	<c:if test="${storyNum==1}">
		<c:forEach var="slide" items="${slideList}">
			<c:if test="${slide<10}">
				<img src="../resources/img/scene1/scene0${slide}.jpg">
			</c:if>
			<c:if test="${slide>=10}">
				<img src="../resources/img/scene1/scene${slide}.jpg">
			</c:if>
		</c:forEach>
	</c:if>
	<c:if test="${storyNum==2}">
		<c:forEach var="slide" items="${slideList}">
			<c:if test="${slide<10}">
				<img src="../resources/img/scene2/scene0${slide}.jpg">
			</c:if>
			<c:if test="${slide>=10}">
				<img src="../resources/img/scene2/scene${slide}.jpg">
			</c:if>
		</c:forEach>
	</c:if>
  </div>  
</body>

<div id="menu">
<button class="btn" id="slideShowButton"></button>
<button class="btn" id="replayButton" onclick="window.location.reload()"></button>
<button class="btn" id="homeButton" onclick="javascript:storyEnd()"></button>
<button class="btn" id="musicButton" onclick="javascript:music()"></button>
</div>

<form id="form" method="post" action="slideEnd">
	<input type="hidden" name="storyNum" value="${storyNum}">
	<input type="hidden" name="selectionNum" value="${selectionNum}">
	<input type="hidden" name="id" value="${id}">
</form>


</html>
