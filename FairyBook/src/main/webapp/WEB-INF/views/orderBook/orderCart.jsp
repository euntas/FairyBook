<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>Order Cart</title>
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
	cartList();
});

function cartList(){
	$.ajax({
		url:'cartList',
		type:'GET',
		dataType:'json',
		success: printCartList,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

function printCartList(orders){
	var input='<table class="table table-striped table-hover">';
	input+='<thead><tr>';
	input+='<th>확인</th><th>주문번호</th><th>책표지</th><th>책제목</th><th>가격</th>';
	input+='</tr></thead>';
	$.each(orders,function(i,o){
		input += '<tr>';
		input += '<td><input type="checkbox" class="selectionCart" price="'+o.price+'" value="'+o.ordernum+'"></td>';
		input += '<td>'+o.ordernum+'</td>';
		input += '<td><img width="100px" src="getBookCover?ordernum='+o.ordernum+'"></td>';
		input += '<td>'+o.title+'</td>';
		input += '<td>'+o.price+'(수량: '+(o.price/5000)+')'+'</td>';
		input += '</tr>';
	});
	$('#cartList').html(input);
}

function orderSelections(){
	var s = $('.selectionCart');
	var selections = [];
	for (var i = 0; i < s.length; i++) {
		if (s[i].checked) {
			selections.push(s[i].getAttribute('value'));
			$.ajax({
				url: 'updateOrder',
				type:'POST',
				data: {ordernum: s[i].value, price: s[i].getAttribute('price')},
				success: function(){
				},
				error: function(e){
					alert(JSON.stringify(e));
				}
			}); 
		}
	}//for
	if (selections.length == 0) {
		alert('구매하실 책을 선택해주세요.');
	}else{
		$('#confirmList').attr('value',selections);
		$('#confirmOrderForm').submit();
	}
}

function deleteSelections(){
	if (!confirm('삭제하시겠습니까?')) {
		return;
	}
	var s = $('.selectionCart');
	var selections = [];
	for (var i = 0; i < s.length; i++) {
		if (s[i].checked) {
			$.ajax({
				url: 'deleteOrder',
				type:'POST',
				data: {ordernum: s[i].value},
				success: function(){
					cartList();
				},
				error: function(e){
					alert(JSON.stringify(e));
				}
			});
		}
	}//for
}
</script>

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	
<!--####################여기부터  -->

<img src="../resources/image/orderCart.png">  <hr>
<div id="cartList"></div>
<input type="button" value="삭제" onclick="deleteSelections()">
<input type="button" value="주문하기" onclick="orderSelections()">

<form id="confirmOrderForm" action="checkOrderInfo" method="post">
<input type="hidden" id="confirmList" name="confirmList">
</form>

<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 
