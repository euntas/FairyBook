<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>BoardList</title>
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
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">

<!--####################여기부터  -->
<div class="container">
<table class="table table-striped table-hover">
	<thead>
	<tr>
		<td>글번호</td>
		<td>제목</td>
		<td>닉네임</td>
		<td>조회수</td>
		<td>작성일</td>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td>1</td>
		<td>sample</td>
		<td>라이언맘</td>
		<td>0</td>
		<td>오늘</td>
	</tr>
	<tr>
		<td>2</td>
		<td>sample</td>
		<td>라이언맘</td>
		<td>0</td>
		<td>오늘</td>
	</tr>
	<tr>
		<td>3</td>
		<td>sample</td>
		<td>라이언맘</td>
		<td>0</td>
		<td>오늘</td>
	</tr>
	</tbody>
</table>
</div>



<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 

