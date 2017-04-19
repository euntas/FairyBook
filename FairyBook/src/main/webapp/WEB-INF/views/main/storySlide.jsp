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
	background-color: rgba( 0, 0, 0, 0.5 );
	z-index: 99;
}
</style>
<script>
$(document).ready(function(){
	$('#menu').on('mouseenter', showMenu);
	$('#menu').on('mouseleave', hideMenu);
});

function showMenu(){
	
}

function hideMenu(){
	
}
</script>

</head>

<body>
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
<button id="slideShowButton"></button>
</div>

</html>