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
  <h1>Fairytale Book</h1>
</div>
</nav>

<div id="under">
<p>[ 회원정보 ]</p>
<p>
	
		<table>
			<tr>
				<td class="firstRow">ID</td>
				<td class="secondRow">
				${info.id}</td>
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
			
			<tr>
				<td colspan="2" style="text-align: center;">
				<c:if test="${userType == 'parent'}">
				<input type="button" value="수정하기"> 
				</c:if>
					<input type="button" value="메인으로"
					onclick="location.href='/fairybook/'"></td>
			</tr>

		</table>
</p>
</div>
</body>
</html>