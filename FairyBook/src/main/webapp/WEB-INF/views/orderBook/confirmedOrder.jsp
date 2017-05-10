<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>Confirmed Order</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="../resources/js/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">
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
	$.ajax({
		url:'confirmedList',
		type:'POST',
		dataType: 'json',
		success: printList,
		error: function(e){
			console.log(JSON.stringify(e));
		}
	}); 
});

function printList(list){
	var input='<table class="table">';
	input+='<thead><tr>';
	input+='<th>주문번호</th><th>책표지</th><th colspan="2">주문정보</th>';
	input+='</tr></thead>';
	if (list == '') {
		input += '<tr><td colspan="4" class="text-center">주문 내역이 없습니다.</td></tr>';
	}else{
		$.each(list,function(i,o){
			input += '<tr>';
			input += '<td rowspan="2">'+o.ordernum+'</td>';
			input += '<td rowspan="2"><img width="100px" src="getBookCover?ordernum='+o.ordernum+'"></td>';
			input += '<td>책제목:'+o.title+'</td>';
			input += '<td>수취인: '+o.receiver+'</td>';
			input += '</tr><tr>'
			input += '<td>주소: '+o.address+'</td>';
			input += '<td>전화번호: '+o.phone+'</td>';
			input += '</tr>';
		});
	}
	$('#cList').html(input);
}
</script>

<body data-spy="scroll" data-target=".navbar" data-offset="50" style="height: 100%;" class="hanna">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	
<!--####################여기부터  -->
<img src="../resources/image/confirmorder.png">  <hr>
<div id="cList"></div>



<!--여기까지###########################  -->

</div>

<!--Footer  -->
<br><br>
<div style="position: fixed;
bottom:0;
width: 100%;
height: auto;">
<c:import url="../main/mainFooter.jsp"></c:import>
</div>
</body>
</html> 
