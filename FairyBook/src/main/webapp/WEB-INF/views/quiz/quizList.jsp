<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>QuizList</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script>

function alerty(){
	alert('힝');
}
</script>

<!--적용 자바스크립트와 스타일  -->

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
<!--####################여기부터  -->

<h1>퀴이이이이즈</h1>
<!-- image -->
	 <div class="w3-row-padding w3-padding-16">
	    <div class="w3-third w3-margin-bottom">
	      <img src="../resources/image/book.jpg" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>헨젤과 그레텔</h3>
	        <h6 class="w3-opacity">2017.3.22</h6>
	        <button class="w3-button w3-block w3-yellow w3-margin-bottom" onclick="location.href='quizSolve'">Play</button>
	      </div>
	    </div>
	    <div class="w3-third w3-margin-bottom">
	      <img src="../resources/image/pp1.png" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>백설공주</h3>
	        <h6 class="w3-opacity">From $149</h6>
	        <button class="w3-button w3-block w3-margin-bottom" disabled = 'disabled'>동화를 먼저 진행해주세요</button>
	      </div>
	    </div>
	    <div class="w3-third w3-margin-bottom">
	      <img src="../resources/image/pp3.jpg" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>신데렐라</h3>
	        <h6 class="w3-opacity">From $199</h6>
	        <button class="w3-button w3-block w3-margin-bottom" disabled = 'disabled'>동화를 먼저 진행해주세요</button>
	      </div>
	    </div>
	  </div>

<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 
