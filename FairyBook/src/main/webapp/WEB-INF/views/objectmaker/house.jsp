<!-- 아바타만들기 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css 링크 -->
<link rel="stylesheet" type="text/css" href="./resources/css/house.css">

<!-- jquery 링크 -->
<script src="./resources/js/jquery-3.1.1.js"></script>

<script>
$(document).ready(function(){
	//id가 집 부위인 버튼을 클릭하면 해당 함수 호출
	$('#roofbtn').on('click', callRoof);
	$('#doorbtn').on('click', callDoor);
 	$('#windowbtn').on('click', callWindow);
	$('#chimneybtn').on('click', callChimney);
	$('#yardbtn').on('click', callYard);
	$('#wallbtn').on('click', callWall);
});

//지붕 불러오기
function callRoof(){
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

//문 불러오기
function callDoor(){
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
		list += '<img src="'+resourceList[i].path+'" class="items" num="'+resourceList[i].resourceNum+'" name="'+resourceList[i].name+'">';
	}
	$('#items').html(list);
	$('.items').on('click', draw);
	$('#color').css('display','none');
	$('#detail').css('width','79%');
	
}

//불러온 자료를 디테일 부분에 띄운다(색 선택 부분은 보여줌)
function detailWithColor(resourceList){
	var list = '';
	for(var i in resourceList){
		list += '<img src="'+resourceList[i].path+'" class="items" num="'+resourceList[i].resourceNum+'" name="'+resourceList[i].name+'">';
	}
	$('#items').html(list);
	$('.items').on('click', draw);
	$('#color').css('display','block');
	$('#detail').css('width','50%');
}

//디테일에서 선택하면 아바타가 그려진다
function draw(){
	var avatar = $('#avatar').html();
	var arr = ['face', 'hair', 'eye', 'nose', 'mouth', 'ear', 'neck', 'body', 'skin'];
	for(var i in arr){
		if($(this).attr('name').indexOf(arr[i])!=-1){
			if(avatar.indexOf(arr[i])==-1){
				avatar += '<img src="'+$(this).attr('src')+'" num="'+$(this).attr('num')+'" name="'+$(this).attr('name')+'" id="'+arr[i]+'">';
				$('#avatar').html(avatar);
			}else{
				$('#'+arr[i]).attr('src',$(this).attr('src'));
				$('#'+arr[i]).attr('num',$(this).attr('num'));
				$('#'+arr[i]).attr('name',$(this).attr('name'));
			}
		}
	}
	$('#resetbtn').on('click', reset);

	//모든 디테일을 선택하면 저장버튼을 활성화한다
	var count = 0;
	for(var i in arr){
		if(avatar.indexOf(arr[i])!=-1){
			count += 1;
		}
	}
	if(count == 9){
		$('#savebtn').css('display','block');
		$('#savebtn').on('click',save);
	}
}


//reset버튼을 누르면 그리던 아바타를 초기화한다
function reset(){
	var avatar = '<input type="button" value="초기화" id="reset">';
	$('#avatar').html(avatar);
}

//save버튼을 누르면 완성된 아바타를 DB에 저장한다
function save(){
	var face = $('#face').attr('num');
	var hair = $('#hair').attr('num');
	var eye = $('#eye').attr('num');
	var nose = $('#nose').attr('num');
	var mouth = $('#mouth').attr('num');
	var ear = $('#ear').attr('num');
	var neck = $('#neck').attr('num');
	var body = $('#body').attr('num');
	var skin = $('#skin').attr('num');
	$.ajax({
		url: 'save',
		type: 'POST',
		data: {face:face,hair:hair,eye:eye,nose:nose,mouth:mouth,ear:ear,neck:neck,body:body,skin:skin},
		success: function(){
			alert('Profit!');
		},
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

</script>


<title>집 만들기</title>
</head>
<body>

<!-- 만들어진 집이 보이는 div 태그 -->
<div id="house">
<input type="button" value="초기화" id="resetbtn">

	<!-- 저장버튼 및 초기화버튼이 보이는 div태그 -->
	<div id="saveArea">
	<input type="button" value="저장" id="savebtn">
	</div>
</div>

<!-- 집 부위 선택하는 대분류 div태그 -->
<div id="category">
<input id="roofbtn" class="category" type="button" value="지붕"><input id="doorbtn" class="category" type="button" value="문"><input id="windowbtn" class="category" type="button" value="창문"><input id="chimney" class="category" type="button" value="굴뚝"><input id="yard" class="category" type="button" value="기타"><input id="wallbtn" class="category" type="button" value="벽">
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