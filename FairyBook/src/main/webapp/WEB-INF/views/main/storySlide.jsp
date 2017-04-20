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
<style>
img{
	position: absolute;
	width: 100%;
	height: 100%;
}

#menu{
	position: absolute;
	width: 59%;
	height: 19%;
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


</script>

</head>
<body>
<audio src="../resources/img/util/bgm.mp3" autoplay="autoplay" loop="loop" id="music"></audio>
	<div id="slideShowImages">
	<c:forEach var="slide" items="${slideList}">
		<c:if test="${slide<10}">
			<img src="../resources/img/scene/scene0${slide}.jpg">
		</c:if>
		<c:if test="${slide>=10}">
			<img src="../resources/img/scene/scene${slide}.jpg">
		</c:if>
	</c:forEach>
  </div>  
</body>

<div id="menu">
<button class="btn" id="slideShowButton"></button>
<button class="btn" id="replayButton" onclick="window.location.reload()"></button>
<button class="btn" id="homeButton" onclick="history.go(-1)"></button>
<button class="btn" id="musicButton" onclick="javascript:music()"></button>
</div>

</html>