<!-- 아바타만들기 페이지 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css 링크 -->
<link rel="stylesheet" type="text/css" href="./resources/css/avatar.css">

<script src="./resources/js/jquery-3.1.1.js"></script>
<script>
$(document).ready(function(){
	//id가 신체부위인 버튼을 클릭하면 해당 함수 호출
	$('#face').on('click', callFace);
	$('#hair').on('click', callHair);
 	$('#eye').on('click', callEye);
	$('#nose').on('click', callNose);
	$('#mouth').on('click', callMouth);
	$('#ear').on('click', callEar);
	$('#neck').on('click', callNeck);
	$('#body').on('click', callBody);
	$('#skin').on('click', callSkin);
	$('#color').on('click', draw);
});

//얼굴 불러오기
function callFace(){
	$.ajax({
		url: 'callFace',
		type: 'GET',
		dataType: 'json',
		success: detailWithoutColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//헤어 불러오기
function callHair(){
	$.ajax({
		url: 'callHair',
		type: 'GET',
		dataType: 'json',
		success: detailWithColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//눈 불러오기
function callEye(){
	$.ajax({
		url: 'callEye',
		type: 'GET',
		dataType: 'json',
		success: detailWithColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//코 불러오기
function callNose(){
	$.ajax({
		url: 'callNose',
		type: 'GET',
		dataType: 'json',
		success: detailWithoutColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//입 불러오기
function callMouth(){
	$.ajax({
		url: 'callMouth',
		type: 'GET',
		dataType: 'json',
		success: detailWithoutColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//귀 불러오기
function callEar(){
	$.ajax({
		url: 'callEar',
		type: 'GET',
		dataType: 'json',
		success: detailWithoutColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//목 불러오기
function callNeck(){
	$.ajax({
		url: 'callNeck',
		type: 'GET',
		dataType: 'json',
		success: detailWithoutColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//몸 불러오기
function callBody(){
	$.ajax({
		url: 'callBody',
		type: 'GET',
		dataType: 'json',
		success: detailWithColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//피부 불러오기
function callSkin(){
	$.ajax({
		url: 'callSkin',
		type: 'GET',
		dataType: 'json',
		success: detailWithColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//불러온 자료를 디테일 부분에 띄운다(색 선택 부분은 안보여줌)
function detailWithoutColor(resourceList){
	var list = '';
	for(var i in resourceList){
		list += '<img src="'+resourceList[i].path+'" class="items">';
	}
	$('.items').on('click', draw);
	$('#items').html(list);
	$('#color').css('display','none');
	$('#detail').css('width','79%');
}

//불러온 자료를 디테일 부분에 띄운다(색 선택 부분은 보여줌)
function detailWithColor(resourceList){
	var list = '';
	for(var i in resourceList){
		list += '<img src="'+resourceList[i].path+'" class="items">';
	}
	$('.items').on('click', draw);
	$('#items').html(list);
	$('#color').css('display','block');
	$('#detail').css('width','50%');
}


function draw(){
	confirm('그린다요!');
}

</script>


<title>아바타 만들기</title>
</head>
<body>

<!-- 만들어진 아바타가 보이는 div 태그 -->
<div id="avatar">


	<!-- 저장버튼 및 초기화버튼이 보이는 div태그 -->
	<div id="savearea">
	<input type="button" value="저장" id="save">
	</div>
</div>

<!-- 아바타 신체부위 선택하는 대분류 div태그 -->
<div id="category">
<input id="face" class="category" type="button" value="얼굴"><input id="hair" class="category" type="button" value="헤어"><input id="eye" class="category" type="button" value="눈"><input id="nose" class="category" type="button" value="코"><input id="mouth" class="category" type="button" value="입"><input id="ear" class="category" type="button" value="귀"><input id="neck" class="category" type="button" value="목"><input id="body" class="category" type="button" value="몸"><input id="skin" class="category" type="button" value="피부">
</div>

<!-- 실제로 쓸 신체부위 선택하는 소분류 div태그 -->
<div id="detail">
만들 부위를 선택해 주세요
<div id="items">
</div>
</div>

<!-- 색깔 선택하는 div태그 -->
<div id="color">
<input id="red" class="color" type="button"><input id="orange" class="color" type="button"><input id="yellow" class="color" type="button"><br>
<input id="green" class="color" type="button"><input id="blue" class="color" type="button"><input id="purple" class="color" type="button"><br>
<input id="white" class="color" type="button"><input id="gray" class="color" type="button"><input id="black" class="color" type="button">
</div>

</body>
</html>