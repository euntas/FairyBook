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
<style>
/*글씨체  */
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
.hanna{
	font-family: 'Hanna', fantasy;
}
</style>
<script>
$(function(){
	$('#confirmOrder').on('click',confirmOrder);
});

function confirmOrder(){
	var form = $('#confirmForm');
	var ordernum = $('.ordernum').toArray();
	var receiver = $('#receiver').val();
	var addressR = $('#addressR').val();
	var phoneR = $('#phoneR').val();
	var selections = [];
	for (var i = 0; i < ordernum.length; i++) {
		var num = ordernum[i].getAttribute('value');	
		selections.push(num);
		console.log(num);
		$.ajax({
			url:'updateOrder',
			type:'POST',
			data:{ordernum:num,currentstate:'confirmedOrder' },
			success: function(){
			},
			error: function(e){
				alert(JSON.stringify(e));
			}
		});
		$.ajax({
			url: 'confirmOrder',
			type: 'POST',
			data:{ordernum:num, receiver:receiver, phoneR:phoneR, addressR:addressR},
			success: function(){
				
			}, error: function(e){
				alert(JSON.stringify(e));
			}
		});
	}//for

	if (selections.length == 0) {
		alert('구매하실 책을 선택해주세요.');
	}else{
		location.href="confirmOrder";
	}
}
</script>


<body data-spy="scroll" data-target=".navbar" data-offset="50" class="hanna">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	
<!--####################여기부터  -->

<form id="confirmForm">
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
<td><input type="text" id="receiver" name="receiver" value="${user.pName }" width="100%"></td>
</tr>
<tr>
<td>전화번호</td>
<td><input type="text" id="phoneR" name="phoneR" value="${user.phone}"></td>
</tr>
<tr>
<td>주소</td>
<td><input type="text" id="addressR" name="addressR" value="${user.address}"></td>
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
