<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>Story Select</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--적용 자바스크립트와 스타일  -->

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">

<!--####################여기부터  -->
<c:if test="${loginUser != null }">
<!-- 동화책 '헨젤과 그레텔'-->		
<div id="Borge" class="w3-container person">
	  <br>
<h1>동화 선택</h1>
	  <hr>
	</div>
	<!-- image -->
	 <div class="w3-row-padding w3-padding-16">
	    <div class="w3-third w3-margin-bottom">
	      <img src="../resources/image/book.jpg" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>헨젤과 그레텔</h3>
	        
	        <h6 class="w3-opacity">2017.3.22</h6>
	        <button class="w3-button w3-block w3-yellow w3-margin-bottom" onclick="location.href='story/storyTest'">Play</button>
	      </div>
	    </div>
	    
	    <div class="w3-third w3-margin-bottom">
	      <img src="../resources/image/pp1.png" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>Double Room</h3>
	        <h6 class="w3-opacity">From $149</h6>
	        <button class="w3-button w3-block w3-yellow w3-margin-bottom">play</button>
	      </div>
	    </div>
	    
	    <div class="w3-third w3-margin-bottom">
	      <img src="../resources/image/pp3.jpg" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>Deluxe Room</h3>
	        <h6 class="w3-opacity">From $199</h6>
	        <button class="w3-button w3-block w3-yellow w3-margin-bottom">play</button>
	      </div>
	    </div>
	  </div>

	    
</c:if>


<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="mainFooter.jsp"></c:import>

</body>
</html> 