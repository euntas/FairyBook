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
<!--     <img src="../resources/img/scene/scene01.jpg">
    <img src="../resources/img/scene/scene04.jpg">
    <img src="../resources/img/scene/scene05.jpg">    
    <img src="../resources/img/scene/scene06.jpg">
    <img src="../resources/img/scene/scene07.jpg">
    <img src="../resources/img/scene/scene08.jpg">
    <img src="../resources/img/scene/scene09.jpg">
    <img src="../resources/img/scene/scene10.jpg">
    <img src="../resources/img/scene/scene11.jpg">
    <img src="../resources/img/scene/scene12.jpg">
    <img src="../resources/img/scene/scene13.jpg">
    <img src="../resources/img/scene/scene14.jpg">
    <img src="../resources/img/scene/scene15.jpg">
    <img src="../resources/img/scene/scene16.jpg">
    <img src="../resources/img/scene/scene17.jpg">
    <img src="../resources/img/scene/scene18.jpg">
    <img src="../resources/img/scene/scene45.jpg">
    <img src="../resources/img/scene/scene46.jpg"> -->
  </div>  
</body>

<div id="menu">
<button id="slideShowButton"></button>
</div>

</html>