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
 
  <style>
	
		.container-fluid {//패딩
		    padding-top: 50px;
		    padding-bottom: 50px;
		}
		.navbar {
		    padding-top: 15px;
		    padding-bottom: 15px;
		    border: 0;
		    border-radius: 0;
		    margin-bottom: 0;
		    font-size: 12px;
		    letter-spacing: 5px;
		}
		
		.navbar-nav li a:hover {
		    color: #1abc9c !important;
		}
		.bg-4 { 
		    background-color: #2f2f2f;
		    color: #ffffff;
		}
	</style>
	
	<style>
	
		
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
	
	th {font-family: 'Jeju Hallasan', serif;}
	td {font-family: 'Jeju Hallasan', serif;}
	</style>
	
	<style>
	@font-face {
  font-family: 'LotteMartHappy';
  font-style: normal;
  font-weight: 400;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyMedium.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyMedium.woff') format('woff');
}

@font-face {
  font-family: 'LotteMartHappy';
  font-style: normal;
  font-weight: 700;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyBold.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyBold.woff') format('woff');
}

.lottemarthappy * {
 font-family: 'LotteMartHappy', sans-serif;
}

.normal {
 font-style: normal;
}

.w250 {
 font-weight: 250;
}

.w300 {
 font-weight: 300;
}

.w350 {
 font-weight: 350;
}

.w400 {
 font-weight: 400;
}

.w500 {
 font-weight: 500;
}

.w700 {
 font-weight: 700;
}

.w800 {
 font-weight: 800;
}

.w900 {
 font-weight: 900;
}

li span {
 line-height: 1.8;
 font-size: 1.3em;
}
	</style>
<!--적용 자바스크립트와 스타일  -->
<link rel="stylesheet" href="../resources/css/joinForm.css">


<title>userInfo</title>

<body data-spy="scroll" data-target=".navbar" data-offset="50" style="height: 100%; background-image: url('../resources/img/account/back4.png'); background-repeat: no-repeat; background-size: cover;">




<!--배너  -->
<nav class="navbar-fixed-top">
<div style="background-image: url('../resources/image/icon/banner.png');width: 100%;height: 100px;">
 <center><a href="../"><img src="../resources/image/icon/bannertitle.png" style="margin-top: 15px;margin-right: 17px"></a></center>
</div>
</nav>


<div id="under">
<br>
<div style="text-align: center; margin: auto;"><img src="../resources/img/account/info.png" style="width: 150px;height: 50px;"></div>
<br>
	
		<table style="margin:auto; background-color:#B4E5FF; opacity:20%; border-radius:20px; width: 40%; height:350px;">
			<tr>
				<th class="firstRow">ID</th>
				<td class="secondRow">
				<span id="id">${info.id}</span></td>
			</tr>
			<tr>
				<th class="firstRow">닉네임</th>
				<td class="secondRow">
				${info.cnickName}</td>
			</tr>
			<tr>
				<th class="firstRow">아이 이름</th>
				<td class="secondRow">
				${info.cName}</td>				
			</tr>
			<tr>
				<th class="firstRow">아이 생일</th>
				<td class="secondRow">
				${info.cBirth}
				</td>
		
			</tr>
			<tr>
				<th class="firstRow">보호자 이름</th>
				<td class="secondRow">${info.pName}</td>
			
			</tr>
			<tr>
				<th class="firstRow">보호자 닉네임</th>
				<td class="secondRow">${info.pnickName}
				</td>
				
			</tr>
			<tr>
				<th class="firstRow">이메일</th>
				<td class="secondRow">${info.email}
				</td>
			
			</tr>
			<tr>
				<th class="firstRow">전화번호</th>
				<td class="secondRow">
				${info.phone}
				</td>
			</tr>
			<tr>
				<th class="firstRow">주소</th>
				<td class="secondRow">${info.address}
				</td>
				
			</tr>
			<c:if test="${info.originalProfile!=null }">
			<tr>
				<th class="firstRow">사진</th>
				<td class="secondRow">
				${info.originalProfile}
				</td>
				
			</tr>
			</c:if>

			</table>
			<br>
				<div style="text-align: center;">
				<c:if test="${userType == 'parent'}">
				<a href="update"><img src="../resources/img/account/updatebutton.png"></a>
				
				</c:if>
					<a href="../"><img src="../resources/img/account/tomainbutton.png"></a></div>
			

		

</div>
<!--Add a navar  -->
<nav class="navbar navbar-default navbar-fixed-bottom" style="position: absolute;
bottom:0;
width: 100%;
height: 5%;">
	<footer class="container-fluid bg-4 text-center" >
	  <p>Made By <a href="../">FairyBook.com</a></p> 
	</footer>
</nav>

</body>
</html>