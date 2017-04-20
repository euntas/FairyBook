<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--적용 자바스크립트와 스타일  -->
<link rel="stylesheet" href="../resources/css/joinForm.css">


<title>userInfo</title>

<body data-spy="scroll" data-target=".navbar" data-offset="50">



<!--배너  -->
<nav class="navbar-fixed-top">
<div class="container-fluid bg-2 text-center">
  <a href='../'><img src="../resources/image/title.PNG"></a>
</div>
</nav>

<div id="under">
<div style="text-align: center; margin: auto;"><img src="../resources/img/account/info.png" style="width: 150px;height: 50px;"></div>
<br>
	
		<table style="margin:auto; border: 1px solid black; width: 40%; height:350px;">
			<tr>
				<td class="firstRow">ID</td>
				<td class="secondRow">
				<span id="id">${info.id}</span></td>
			</tr>
			<tr>
				<td class="firstRow">닉네임</td>
				<td class="secondRow">
				${info.cnickName}</td>
			</tr>
			<tr>
				<td class="firstRow">아이 이름</td>
				<td class="secondRow">
				${info.cName}</td>				
			</tr>
			<tr>
				<td class="firstRow">아이 생일</td>
				<td class="secondRow">
				${info.cBirth}
				</td>
		
			</tr>
			<tr>
				<td class="firstRow">보호자 이름</td>
				<td class="secondRow">${info.pName}</td>
			
			</tr>
			<tr>
				<td class="firstRow">보호자 닉네임</td>
				<td class="secondRow">${info.pnickName}
				</td>
				
			</tr>
			<tr>
				<td class="firstRow">이메일</td>
				<td class="secondRow">${info.email}
				</td>
			
			</tr>
			<tr>
				<td class="firstRow">전화번호</td>
				<td class="secondRow">
				${info.phone}
				</td>
			</tr>
			<tr>
				<td class="firstRow">주소</td>
				<td class="secondRow">${info.address}
				</td>
				
			</tr>
			<c:if test="${info.originalProfile!=null }">
			<tr>
				<td class="firstRow">사진</td>
				<td class="secondRow">
				${info.originalProfile}
				</td>
				
			</tr>
			</c:if>

			</table>
			<br>
				<div style="text-align: center;">
				<c:if test="${userType == 'parent'}">
				<input type="button" value="수정하기" onclick="location.href='update'" class="btn btn-info"> 
				
				</c:if>
					<input type="button" value="메인으로"
					onclick="location.href='/fairybook/'" class="btn btn-info"></div>
			

		

</div>
<nav class="navbar navbar-default navbar-fixed-bottom">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="#">Me</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">WHO</a></li>
        <li><a href="#">WHAT</a></li>
        <li><a href="#">WHERE</a></li>
      </ul>
    </div>
  </div>
	<footer class="container-fluid bg-4 text-center">
	  <p>Made By <a href="../">FairyBook.com</a></p> 
	</footer>
</nav>

</body>
</html>