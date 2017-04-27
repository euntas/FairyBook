<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>아바타 만들기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/css/avatar.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">
<script src="../resources/js/jquery-3.1.1.min.js"></script>
<script src="../resources/js/jquery-3.1.1.js"></script>
<script src="../resources/js/avatar.js"></script>

<!--적용 자바스크립트와 스타일  -->
<script>

//save버튼을 누르면 완성된 아바타를 DB에 저장한다
function save(){
	var face = $('#face').attr('num');
	var hair = $('#hair').attr('num');
	var eye = $('#eye').attr('num');
	var nose = $('#nose').attr('num');
	var mouth = $('#mouth').attr('num');
	var ear = $('#ear').attr('num');
	var body = $('#body').attr('num');
	var hairColor = $('#hair').attr('name').split('Color')[1];
	var eyeColor = $('#eye').attr('name').split('Color')[1];
	var bodyColor = $('#body').attr('name').split('Color')[1];
	
	var arr = ['Black', 'Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Purple','White','Gray'];
		for(var i in arr){
			if(hairColor == arr[i]){
				hairColor = i;
			}
			if(eyeColor == arr[i]){
				eyeColor = i;
			}
			if(bodyColor == arr[i]){
				bodyColor = i;
			}
		}
		
	$.ajax({
		url: 'saveAvatar',
		type: 'POST',
		async: false,
		data: {face:face,hair:hair,eye:eye,nose:nose,mouth:mouth,ear:ear,body:body,hairColor:hairColor,eyeColor:eyeColor,bodyColor:bodyColor},
		success: function(){
			alert('저장 완료!');
			location.href='house';
		},
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}
</script>



<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:220px;">
<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	
<!-- 만들어진 아바타가 보이는 div 태그 -->
<div id="avatar">
<input type="button" id="resetbtn">

	<!-- 저장버튼 및 초기화버튼이 보이는 div태그 -->
	<div id="saveArea">
	<input type="button" id="savebtn">
	</div>
</div>

<!-- 아바타 신체부위 선택하는 대분류 div태그 -->
<div id="category">
<input id="facebtn" class="category" type="button"><input id="hairbtn" class="category" type="button"><input id="eyebtn" class="category" type="button"><input id="nosebtn" class="category" type="button"><input id="mouthbtn" class="category" type="button"><input id="earbtn" class="category" type="button"><input id="bodybtn" class="category" type="button">
</div>

<!-- 실제로 쓸 신체부위 선택하는 소분류 div태그 -->
<div id="detail">
<img src="../resources/img/util/selectbtn.png">
	<span id="color">
	</span>
	
	<br>
	<!-- 색깔 선택하는 span태그 -->
	<span id="items">
	</span>
	
</div>
<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 