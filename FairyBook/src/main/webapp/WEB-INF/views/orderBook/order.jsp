<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>Order Book</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="../resources/js/jquery-3.1.1.min.js"></script>
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
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	
<!--####################여기부터  -->

<form>
<table border="1">
<tr>
<c:if test="${order == null}"> <!--책표지 아직 안만들었을때  -->
<td rowspan="4"><img height="400px" alt="cover" src="../resources/img/bookCover/defaultCover.png"></td>
</c:if>
<c:if test="${order != null}"><!--책표지 만들었을때  -->
<td rowspan="4"><img height="400px" alt="cover" src="getBookCover?selectionnum=${selectionnum}"></td>
</c:if>
</tr>
<tr>
<td>제목</td>
<td>${title}</td>
</tr>
<tr>
<td>가격</td>
<td>5000</td>
</tr>
<tr>
<td>수량</td>
<td><input type="text"></td>
</tr>
<tr>
<td><input type="button" value="표지 만들기" 
	onclick="location.href='makeCover?selectionnum=${selectionnum}'"></td>
<td><input type="button" value="주문하기"></td>
</tr>
</table>
</form>



<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 
