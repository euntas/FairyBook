<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Board List</title>
</head>
<body>
<c:import url="../home.jsp"></c:import>

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

</body>
</html>