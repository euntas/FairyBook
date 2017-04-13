<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>색칠하기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=RobotoDraft' >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/css/etc.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

<!-- 만들어진 기타요소가 보이는 div 태그 -->
<div id="etc">
<input type="button" value="초기화" id="resetbtn">

	<!-- 저장버튼 및 초기화버튼이 보이는 div태그 -->
	<div id="saveArea">
	<input type="button" value="저장" id="savebtn">
	</div>
</div>

<!-- 색깔 선택하는 div태그 -->
<div id="category">
<input id="facebtn" class="category" type="button" value="빨강"><input id="hairbtn" class="category" type="button" value="주황"><input id="eyebtn" class="category" type="button" value="노랑"><input id="nosebtn" class="category" type="button" value="초록"><input id="mouthbtn" class="category" type="button" value="파랑"><input id="earbtn" class="category" type="button" value="보라"><input id="neckbtn" class="category" type="button" value="하양"><input id="bodybtn" class="category" type="button" value="검정">
</div>

<!-- 받아온 스토리번호에 따라 배경 따로 설정 -->	
<c:if test="${storyNum==0}">
<script>
$('#etc').css('background-image','url("../resources/img/etc/testest.png")');
alert('됨??');
</script>
</c:if>

<c:if test="${storyNum==1}">
<script>
$('#etc').css('background-image','url("../resources/img/etc/cookieHouse.png")');
alert('됨??????');
</script>
</c:if>

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 
