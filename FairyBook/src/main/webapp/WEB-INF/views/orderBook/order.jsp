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
<style>
/*글씨체  */
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
.hanna{
	font-family: 'Hanna', fantasy;
}
.dropdown-content{
	display: none;
    position: absolute;
    background-color: #f9f9f9;
    width: 500px;
    height: 500px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding: 12px 16px;
    z-index: 1;
}
</style>

<script type="text/javascript">
$(function(){
	$('#orderCount').val(1);
	$('#countAdd').on('click',countAdd);
	$('#countMinus').on('click',countMinus);
	$('#orderCount').on('change',showCost);
	
	if ($('.cover').attr('isDefault')=='default') {
		$('.cover').attr('src','../resources/img/bookCover/defaultCover.png');
	}else{
		$('.cover').attr('src','getBookCover?ordernum='+${order.ordernum});
	}

	$('.dropdown').on('click',lastBookCover);
});

//예전 표지 선택하기 눌렀을때 dropdown창 띄우기
function lastBookCover(){
	var selectionnum = ${order.selectionnum};
	$('.dropdown-content').css('display','block');
	$.ajax({
		url:'getLastBookCover',
		type:'GET',
		data: {selectionnum: selectionnum},
		dataType: 'json',
		success: showDropdown,
		error:function(e){
			alert(JSON.stringify(e));
		}
	});
}

//dropdown창에 표지 이미지 띄우기
function showDropdown(bookCovers){
	var input='<table class="table table-striped table-hover">';
	input += '<tr><td colspan="3" style="text-align:right;">';
	input += '<span class="glyphicon glyphicon-remove" id="cancelShow"></span></td></tr>';
	$.each(bookCovers,function(i,b){
		if ((i+1)%3 == 1) {
			input += '<tr>';
		}
		input += '<td><img width="100px" src="getBookCover?ordernum='+b+'" myordernum="'+b+'" onclick="selectCover('+b+')"></td>';
		if ((i+1)%3 == 0) {
			input += '</tr>';
		}
	});
	$('.dropdown-content').html(input);
	$('#cancelShow').on('click',function(){
		$('.dropdown-content').css('display','none');
	});
}

//예전 표지 중에 표지 선택하기
function selectCover(ordernum){
	var myordernum=$('#ordernum').val();
	console.log(myordernum);
	console.log('bbbb');
	$.ajax({
		url:'setCover',
		type: 'POST',
		data: {myordernum: myordernum, coverordernum: ordernum},
		success: function(){
			$('.cover').attr('src','getBookCover?ordernum='+ordernum);
			$('.cover').attr('isDefault','getBookCover?ordernum='+ordernum);
		},
		error:function(e){
			alert(JSON.stringify(e));
		}
	});
}

//+버튼 눌렀을때 수량 늘리기
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

//-그림 눌렀을 때 수량 줄여주기
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

//수량 변화했을 때 예상가격 변경
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
	$('#expectedCost').html("<br>총  " + count*cost);
}

//장바구니 또는 주문하기 버튼 눌렀을 때
function updateOrder(state){ //addToCart,makeOrder,thumbnail
	if ($('.cover').attr('isDefault') == 'default') {
		alert('표지를 만들어주세요');
		return;
	}
	console.log(state);
	var ordernum = $('#ordernum').val();
	if (state != 'thumbnail') {
		var cost = $('#bookCost').html();
		var count = $('#orderCount').val();
		var totalcost = parseInt(cost)*parseInt(count);
	}
	$.ajax({
		url:'updateOrder'
		,type: 'POST'
		,data: {ordernum: ordernum, price: totalcost, currentstate:state}
		,success: function(){
		}
		,error:function(e){
			alert(JSON.stringify(e));
		}
	}); 
	if (state == 'addToCart') {
		if (confirm('장바구니로 가시겠습니까?')){
			location.href="orderCart";
		}else{
			$('#formOrder').submit();
		}
	}else if(state == 'makeOrder'){
		$.ajax({
			url: 'updateOrder',
			type:'POST',
			data: {ordernum: ordernum, price: totalcost,currentstate:state},
			success: function(){
				$('#confirmList').attr('value',ordernum);
				$('#confirmOrderForm').submit();
			},
			error: function(e){
				alert(JSON.stringify(e));
			}
		}); 
	}else{
		location.href="../menu/storyPlay";
	}
}
</script>


<body data-spy="scroll" data-target=".navbar" data-offset="50" style="height: 100%;" class="hanna">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	
<!--####################여기부터  -->

<form style="margin: 5%;">
<input type="hidden" id="ordernum" value="${order.ordernum}">
<table class="table" style="width: 80%">
<tr class="warning">
<td colspan="3" class="hanna" style="text-align:center;height:50px;font-size: 20px;">${order.title}</td>
</tr>
<tr>
<td rowspan="3" style="width:50%;text-align:right;">
	<center><img class="cover img-thumbnail" isDefault="${order.bookcover}" height="60%" alt="cover" src="getBookCover?ordernum=${order.ordernum}"></center>
</td>
</tr>
<c:if test="${userType == 'parent'}">
<tr>
<td>가격</td>
<td><span id="bookCost">5000</span></td>
</tr>
<tr>
<td>수량</td>
<td>
<span class="glyphicon glyphicon-minus-sign" id="countMinus"></span>
<input id="orderCount" type="text" style="width:30px;">
<span class="glyphicon glyphicon-plus-sign" id="countAdd"></span>
<span id="expectedCost"></span>
</td>
<td></td>
</tr>
</c:if>
<c:if test="${userType == 'child' }">
<tr></tr><tr></tr>
</c:if>
<tr style="text-align:center;">
<td>
<button type="button" class="btn btn-primary" onclick="location.href='makeCover?ordernum=${order.ordernum}'">표지 만들기</button>
<button type="button" class="btn btn-default dropdown">예전 표지 가져오기</button>
<button type="button" class="btn btn-warning" onclick="updateOrder('thumbnail')">저장하기</button>
<span class="dropdown-content"></span>
</td>
<c:if test="${userType == 'parent'}">
<td>
<button type="button" class="btn btn-warning" onclick="updateOrder('addToCart')">장바구니에 담기</button>
<button type="button" class="btn btn-danger" onclick="updateOrder('makeOrder')">주문하기</button>
</td>
</c:if>
</tr>
</table>
</form>

<!--장바구니로 안 갔을때 넘어가는 폼  -->
<form id="formOrder" action="order" method="post">
<input type="hidden" id="selectionnum" name="selectionnum" value="${order.selectionnum}">
</form>

<!--주문하기 눌렀을때 넘어가는 폼  -->
<form id="confirmOrderForm" action="checkOrderInfo" method="post">
<input type="hidden" id="confirmList" name="confirmList">
</form>
<!--여기까지###########################  -->

</div>

<!--Footer  -->
<div style="position: absolute;
bottom:0;
width: 100%;
height: 30%;">
<c:import url="../main/mainFooter.jsp"></c:import>
</div>

</body>
</html> 
