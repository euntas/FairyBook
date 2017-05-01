<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/avatar.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">
<script src="../resources/js/jquery-3.1.1.min.js"></script>
<script src="../resources/js/jquery-3.1.1.js"></script>
<script src="../resources/js/avatar.js"></script>
<link rel="stylesheet" href="../resources/css/alertify.core.css" />
<link rel="stylesheet" href="../resources/css/alertify.default.css" id="toggleCSS" />
<script src="../resources/js/alertify.min.js"></script>


<title>아바타 만들기</title>
</head>

<body id="bodytag">
	
<!-- 만들어진 아바타가 보이는 div 태그 -->
<div id="avatar">
<input type="button" id="resetbtn">

	<!-- 저장버튼 및 초기화버튼이 보이는 div태그 -->
	<div id="saveArea">
	<input type="button" id="savebtn">
	<input type="button" id="helpbtn">
	</div>
</div>

<!-- 아바타 신체부위 선택하는 대분류 div태그 -->
<div id="category">
<input id="facebtn" class="category" type="button"><input id="hairbtn" class="category" type="button"><input id="eyebtn" class="category" type="button"><input id="nosebtn" class="category" type="button"><input id="mouthbtn" class="category" type="button"><input id="earbtn" class="category" type="button"><input id="bodybtn" class="category" type="button">
</div>

<!-- 실제로 쓸 신체부위 선택하는 소분류 div태그 -->
<div id="detail">
<img src="../resources/img/util/selectbtn.png">
	<span id="color">
	</span>
	
	<br>
	<!-- 색깔 선택하는 span태그 -->
	<span id="items">
	</span>
</div>
</body>
</html>