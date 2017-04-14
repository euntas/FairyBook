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
<script type="text/javascript">
$(function(){
	$('#orderCount').val(1);
	$('#countAdd').on('click',countAdd);
	$('#countMinus').on('click',countMinus);
	$('#orderCount').on('change',showCost);
});

function countAdd(){
	var count=parseInt($('#orderCount').val()); 
	var newcount = count+1;
	if (newcount >100) {
		alert('100개 이하만 가능');
		return;
	}
	$('#orderCount').val(newcount);
	showCost();
}
function countMinus(){
	var count=parseInt($('#orderCount').val());
	var newcount = count-1;
	if(newcount < 1){
		alert('1개 이상 선택해주세요.');
		return;
	}
	$('#orderCount').val(count-1);
	showCost();
}
function showCost(){
	var count = $('#orderCount').val();
	if (isNaN(count)) {
		alert('숫자만 입력해주세요.');
		$('#orderCount').val(1);
		return;
	}
	count = parseInt(count);
	if (count >100) {
		alert('100개 이하만 가능');
		$('#orderCount').val(1);
		return;
	}
	if(count < 1){
		alert('1개 이상 선택해주세요.');
		$('#orderCount').val(1);
		return;
	}
	console.log(count);
	var cost = parseInt($('#bookCost').html());
	console.log(cost);
	$('#expectedCost').html("총  " + count*cost);
}
function updateOrder(state){
	console.log(state);
	var ordernum = $('#ordernum').val();
	var cost = $('#bookCost').html();
	var count = $('#orderCount').val();
	$.ajax({
		url:'updateOrder'
		,type: 'POST'
		,data: {ordernum: ordernum, cost: cost, count: count, currentstate:state}
		,success: function(){
			
		}
		,error:function(e){
			alert(JSON.stringify(e));
		}
	}); 
	
}
</script>


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
<c:if test="${order.bookcover == 'default'}"> <!--책표지 아직 안만들었을때  -->
<td rowspan="4"><img height="400px" alt="cover" src="../resources/img/bookCover/defaultCover.png"></td>
</c:if>
<c:if test="${order.bookcover != 'default'}"><!--책표지 만들었을때  -->
<input type="hidden" id="ordernum" value="${order.ordernum}">
<td rowspan="4"><img height="400px" alt="cover" src="getBookCover?ordernum=${order.ordernum}"></td>
</c:if>
</tr>
<tr>
<td>제목</td>
<td>${title}</td>
</tr>
<tr>
<td>가격</td>
<td><span id="bookCost">5000</span></td>
</tr>
<tr>
<td>수량</td>
<td>
<span class="glyphicon glyphicon-plus-sign" id="countAdd"></span>
<input id="orderCount" type="text" style="width:30px;">
<span class="glyphicon glyphicon-minus-sign" id="countMinus"></span>
<span id="expectedCost"></span>
</td>
</tr>
<tr>
<td><input type="button" value="표지 만들기" 
	onclick="location.href='makeCover?ordernum=${order.ordernum}'"></td>
<td>
<input type="button" value="장바구니" onclick="updateOrder('addToCart')">
<input type="button" value="주문하기" id="updateOrder('makeOrder')">
</td>
</tr>
</table>
</form>


<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 
