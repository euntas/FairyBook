<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>동화 진행 화면 - test</title>
	<link rel="stylesheet" href="./../resources/css/demo.css">
	<link rel="stylesheet" href="./../resources/css/pageflip.css">

	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0, minimal-ui">
</head>
<body>

<div class="mycontainer">
	
<nav>
  <ul>
    <li><a href="/">홈으로</a></li>
    <li><a href="story/storyTest">동화진행 - test</a></li>
  </ul>
</nav>

<article>	
	<div class="fixed">
			질문 들어갈자리 확인용
	</div>
	<div class="pageflip">
		<div class="page page-current" style="background: #209657 url('./../resources/img/scene/scene01.jpg') no-repeat center center; background-size: 100%;">
		</div>
		<div class="page" style="background: #0387A5 url('./../resources/img/scene/scene04.jpg') no-repeat center center;  background-size: 100%;">
		</div>
		<div class="page" style="background: #A5C8CB url('./../resources/img/scene/scene05.jpg') no-repeat center center;  background-size: 100%;">
		</div>
		<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene06.jpg') no-repeat center center;  background-size: 100%;">
		</div>
		<div class="page" style="background: #82BDC4 url('./../resources/img/5.jpg') no-repeat center center">
		</div>
	</div>

	<div class= "container">
		created by FairyBook
	</div>
</article>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="./../resources/js/pageflip.js"></script>
<script src="./../resources/js/demo.js"></script>

</div>
</body>
</html>