<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>집 만들기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/css/house.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">
<script src="../resources/js/jquery-3.1.1.min.js"></script>
<script src="../resources/js/jquery-3.1.1.js"></script>
<script src="../resources/js/house.js"></script>

<!--적용 자바스크립트와 스타일  -->

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:220px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	
<!-- 만들어진 집이 보이는 div 태그 -->
<div id="house">
<input type="button" value="초기화" id="resetbtn">

	<!-- 저장버튼 및 초기화버튼이 보이는 div태그 -->
	<div id="saveArea">
	<input type="button" value="저장" id="savebtn">
	</div>
</div>

<!-- 집 부위 선택하는 대분류 div태그 -->
<div id="category">
<input id="roofbtn" class="category" type="button" value="지붕"><input id="doorbtn" class="category" type="button" value="문"><input id="windowbtn" class="category" type="button" value="창문"><input id="chimneybtn" class="category" type="button" value="굴뚝"><input id="yardbtn" class="category" type="button" value="마당"><input id="wallbtn" class="category" type="button" value="벽">
</div>

<!-- 실제로 쓸 부위 선택하는 소분류 div태그 -->
<div id="detail">
만들 부위를 선택해 주세요
	<span id="color">
	</span>

	<br>
	<!-- 색깔 선택하는 span태그 -->
	<span id="items">
	</span>
</div>
<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 