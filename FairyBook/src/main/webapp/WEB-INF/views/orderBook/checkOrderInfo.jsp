<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>CheckOrderInfo</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="../resources/js/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--적용 자바스크립트와 스타일  -->
<script>
$(function(){
	$('#confirmOrder').on('click',confirmOrder);
});

function confirmOrder(){
	var form = $('#confirmForm');
	var ordernum = $('.ordernum').toArray();
	for (var i = 0; i < ordernum.length; i++) {
		console.log(ordernum[i].getAttribute('value'));
		$.ajax({
			url:'updateOrder',
			type:'POST',
			data:{ordernum:ordernum[i].getAttribute('value'),currentstate:'confirmedOrder' },
			success: function(){
				$('#confirmForm').submit();
			},
			error: function(e){
				alert(JSON.stringify(e));
			}
		});
	}
	/* $.ajax({
		url:'updateOrder',
		
	}); */
}
</script>


<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	
<!--####################여기부터  -->

<form id="confirmForm" action="confirmOrder" method="post">
<table class="table table-striped table-hover">
<thead><tr>
<th>주문번호</th><th>책표지</th><th>책제목</th><th>가격</th>
</tr></thead>
<c:forEach var="o" items="${orderInfo}">
<input type="hidden" class="ordernum" name="ordernum" value="${o.ordernum}">
<tr>
<td>${o.ordernum}</td>
<td><img width="100px" src="getBookCover?ordernum=${o.ordernum}"></td>
<td>${o.title}</td>
<td>${o.price}</td>
</tr>
</c:forEach>
</table>
<br>

<c:set value="${loginUser}" var="user"></c:set>
<table class="table table-striped table-hover">
<tr>
<td>받는사람</td>
<td><input type="text" name="receiver" value="${user.pName }" width="100%"></td>
</tr>
<tr>
<td>전화번호</td>
<td><input type="text" name="phoneR" value="${user.phone}"></td>
</tr>
<tr>
<td>주소</td>
<td><input type="text" name="addressR" value="${user.address}"></td>
</tr>
</table>
<input type="button" value="주문하기" id="confirmOrder">
</form>




<!--여기까지###########################  -->

</div>

<!--Footer  -->

<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 
