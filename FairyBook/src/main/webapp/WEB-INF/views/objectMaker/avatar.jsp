<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/avatar.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">
<script src="../resources/js/jquery-3.1.1.min.js"></script>
<script src="../resources/js/jquery-3.1.1.js"></script>
<script src="../resources/js/avatar.js"></script>
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
//			alert(JSON.stringify(e));
		}
	});
}

</script>

<title>아바타 만들기</title>
</head>

<body id="bodytag">
	
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
</body>
</html>