<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>Slide Show</title>
<script src="./resources/js/slideShow.js"></script>
<script src="./resources/js/jquery-3.1.1.js"></script>
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
    <img src="./resources/img/scene/scene01.jpg" alt="Slide 1" />
    <img src="./resources/img/scene/scene04.jpg" alt="Slide 2" />
    <img src="./resources/img/scene/scene05.jpg" alt="Slide 3" />    
    <img src="./resources/img/scene/scene06.jpg" alt="Slide 4" />
  </div>  
</body>

<div id="menu">
<button id="slideShowButton"></button>
</div>

</html>
