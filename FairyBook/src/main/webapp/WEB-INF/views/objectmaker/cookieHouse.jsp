<!-- 과자집 색칠하기 페이지 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css 링크 -->
<link rel="stylesheet" type="text/css" href="./resources/css/cookieHouse.css">

<!-- favicon 링크 -->
<link rel="shortcut icon" type="image/x-icon" href="./resources/img/favicon.ico">

<!-- jquery 링크 -->
<script src="./resources/js/jquery-3.1.1.js"></script>


<title>색칠하기</title>
</head>
<body>

<!-- 만들어진 아바타가 보이는 div 태그 -->
<div id="avatar">
<input type="button" value="초기화" id="resetbtn">

	<!-- 저장버튼 및 초기화버튼이 보이는 div태그 -->
	<div id="saveArea">
	<input type="button" value="저장" id="savebtn">
	</div>
</div>

<!-- 아바타 신체부위 선택하는 대분류 div태그 -->
<div id="category">
<input id="facebtn" class="category" type="button" value="빨강"><input id="hairbtn" class="category" type="button" value="주황"><input id="eyebtn" class="category" type="button" value="노랑"><input id="nosebtn" class="category" type="button" value="초록"><input id="mouthbtn" class="category" type="button" value="파랑"><input id="earbtn" class="category" type="button" value="보라"><input id="neckbtn" class="category" type="button" value="하양"><input id="bodybtn" class="category" type="button" value="검정">
</div>

</body>
</html>

