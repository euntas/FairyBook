<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>My Child's Story</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">
<style>
/*글씨체  */
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
.hanna{
	font-family: 'Hanna', fantasy;
}

td{
	text-align: center;
}

</style>

<!--적용 자바스크립트와 스타일  -->

<body data-spy="scroll" data-target=".navbar" data-offset="50" style="height: 100%;" class="hanna">

<!--상단, 사이드 메뉴  -->
<c:import url="main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px; min-height: 100%;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	

<!--####################여기부터  -->
<img src="../resources/image/mychildstory.png">  <hr>
<table class="table-bordered table">
	<tr>
	<c:forEach var="story" items="${myStoryList}" varStatus="status">
	<td>
	<!-- 여기엔 썸네일이 들어간다 -->
	<a href="storySlide?selectionNum=${story.selectionNum}">
	<c:if test="${story.storyNum==0}">
		<img src="../resources/image/hiyoko.png" alt="노랑이의 모험" style="width:100%;"><br>
	</c:if>
	<c:if test="${story.storyNum==1}">
		<img src="../resources/image/hansel.jpg" alt="헨젤과그레텔" style="width:100%;"><br>
	</c:if>
	<c:if test="${story.storyNum==2}">
		<img src="../resources/image/snowwhitetitle.jpg" alt="백설공주" style="width:100%;"><br>
	</c:if>
	</a>
	<!-- 여기까지 썸네일 -->
		<div class="w3-container w3-white">
			<h3 class="hanna">
			<c:choose>
				<c:when test="${story.storyNum==0}">노랑이의 모험</c:when>
				<c:when test="${story.storyNum==1}">헨젤과 그레텔</c:when>			
				<c:when test="${story.storyNum==2}">백설공주</c:when>
				<c:when test="${story.storyNum==3}">빨간모자</c:when>
				<c:when test="${story.storyNum==4}">동물의 왕국</c:when>
			</c:choose>
			
			</h3>
			<h6 class="w3-opacity">${story.endDate}</h6>
			<form action="../slide/storySlide" method="post" style="display: inline; width: 100%;">
				<button type="submit" class="w3-button w3-red">감상하기</button>
				<input type="hidden" name="selectionNum" id="selectionNum" value="${story.selectionNum}">
				<input type="hidden" name="storyNum" id="storyNum" value="${story.storyNum}">
			</form>
		</div>
	</td>
	<c:if test="${status.count%3==0}">
		</tr>
		<tr>	
	</c:if>
	<c:if test="${status.last}">
		</tr>
	</c:if>
</c:forEach>
</table>
<!--여기까지###########################  -->

</div>


<!--Footer  -->
<div style="bottom:0;
width: 100%;
height: auto;
position: fixed;">
<c:import url="mainFooter.jsp"></c:import>
</div>
</body>
</html> 
 
