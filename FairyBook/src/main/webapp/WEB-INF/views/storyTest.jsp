<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Rocket Page Flip</title>
	<link rel="stylesheet" href="./resources/css/demo.css">
	<link rel="stylesheet" href="./resources/css/pageflip.css">

	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0, minimal-ui">
</head>
<body>

	<div class="container">
		<h1>Rocket Page Flip 연습</h1>
	</div>
	<div class="fixed">
			질문 들어갈자리 확인용
	</div>
	<div class="pageflip">
		
		<div class="page page-current" style="background: #209657 url('./resources/img/1.jpg') no-repeat center center">
		</div>
		<div class="page" style="background: #0387A5 url('./resources/img/2.jpg') no-repeat center center">
		</div>
		<div class="page" style="background: #A5C8CB url('./resources/img/3.jpg') no-repeat center center">
		</div>
		<div class="page" style="background: #0B0B0B url('./resources/img/4.jpg') no-repeat center center">
		</div>
		<div class="page" style="background: #82BDC4 url('./resources/img/5.jpg') no-repeat center center">
		</div>
	</div>

	<div class= "container">
		created by eunji</a>
	</div>




<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="./resources/js/pageflip.js"></script>
<script src="./resources/js/demo.js"></script>

</body>
</html>