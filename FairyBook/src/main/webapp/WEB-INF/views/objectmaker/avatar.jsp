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

<!-- favicon 링크 -->
<link rel="shortcut icon" type="image/x-icon" href="./resources/img/favicon.ico">

<!-- jquery 링크 -->
<script src="./resources/js/jquery-3.1.1.js"></script>
<script src="./resources/js/html2canvas.js"></script>

<script>
$(document).ready(function(){
	//id가 신체부위인 버튼을 클릭하면 해당 함수 호출
	$('#facebtn').on('click', callFace);
	$('#hairbtn').on('click', callHair);
 	$('#eyebtn').on('click', callEye);
	$('#nosebtn').on('click', callNose);
	$('#mouthbtn').on('click', callMouth);
	$('#earbtn').on('click', callEar);
	$('#neckbtn').on('click', callNeck);
	$('#bodybtn').on('click', callBody);
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


//불러온 자료를 디테일 부분에 띄운다(색 선택 부분은 안보여줌)
function detailWithoutColor(resourceList){
	var list = '';
	var color =''
	for(var i in resourceList){
		list += '<img src="'+resourceList[i].path+'" class="items" num="'+resourceList[i].resourceNum+'" name="'+resourceList[i].name+'" id="'+resourceList[i].resourceNum+'">';
	}
	$('#items').html(list);
	$('#color').html(color);
	$('.items').on('click', draw);
	$('#color').css('display','none');
	$('#detail').css('width','79%');
	
	checkSelection();
}

//불러온 자료를 디테일 부분에 띄운다(색 선택 부분은 보여줌)
function detailWithColor(resourceList){
	var list = '';
	var color =''
	for(var i in resourceList){
		list += '<img src="'+resourceList[i].path+'" class="items" num="'+resourceList[i].resourceNum+'" name="'+resourceList[i].name+'" id="'+resourceList[i].resourceNum+'">';
	}
	$('#items').html(list);
	$('#color').html(color);
	$('.items').on('click', draw);
	$('#color').css('display','block');
	$('#detail').css('width','50%');
	
	checkSelection();
}

//칼라 버튼을 눌렀을 때
function colorbtn(){
	var fullName = $(this).attr('id');
	var name = $(this).attr('id').split('Color')[0];
	var color = $(this).attr('id').split('Color')[1];
	
	$.ajax({
		url: 'callColor',
		type: 'GET',
		data: {name:name, color:color},
		dataType: 'text',
		success: function(str){
			$('#'+name.slice(0, -2)).attr('src', str);
			$('#'+name.slice(0, -2)).attr('name', fullName);
		},
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}


//디테일에서 선택하면 아바타가 그려진다
function draw(){
	var avatar = $('#avatar').html();
	var arr = ['face', 'nose', 'mouth', 'ear', 'neck', 'hair','eye','body'];
	var colorObject = ['hair','eye','body'];
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
	var color = '';
	for(var i in colorObject){
		if($(this).attr('name').indexOf(colorObject[i])!=-1){
			color += '<input id="'+$(this).attr('name')+'ColorRed" class="color" type="button" style="background-color: red;">';
			color += '<input id="'+$(this).attr('name')+'ColorOrange" class="color" type="button" style="background-color: orange;">';
			color += '<input id="'+$(this).attr('name')+'ColorYellow" class="color" type="button" style="background-color: yellow;"><br>';
			color += '<input id="'+$(this).attr('name')+'ColorGreen" class="color" type="button" style="background-color: green;">';
			color += '<input id="'+$(this).attr('name')+'ColorBlue" class="color" type="button" style="background-color: blue;">';
			color += '<input id="'+$(this).attr('name')+'ColorPurple" class="color" type="button" style="background-color: purple;"><br>';
			color += '<input id="'+$(this).attr('name')+'ColorWhite" class="color" type="button" style="background-color: white;">';
			color += '<input id="'+$(this).attr('name')+'ColorGray" class="color" type="button" style="background-color: gray;">';
			color += '<input id="'+$(this).attr('name')+'ColorBlack" class="color" type="button" style="background-color: black;">';
		}
	}
	$('#color').html(color);
	$('#resetbtn').on('click', reset);
	$('.color').on('click', colorbtn);
	
	//모든 디테일을 선택하면 저장버튼을 활성화한다
	var count = 0;
	for(var i in arr){
		if(avatar.indexOf(arr[i])!=-1){
			count += 1;
		}
	}
	if(count == 8){
		$('#savebtn').css('display','block');
		$('#savebtn').on('click',save);
	}
	checkSelection();
}

//내가 선택한 이미지를 강조해준다
function checkSelection(){
	var avatar = $('#avatar').html();
	var arr = ['face', 'hair', 'eye', 'nose', 'mouth', 'ear', 'neck', 'body'];
	//일단 전체에 아무것도 없게 만들고
	$('#items img').css('border','none');
	for(var i in arr){
		//위의 부위가 아바타 영역에 그려져있을때
		if(avatar.indexOf(arr[i])!=-1){
			//해당 부위의 넘버를 가져와서
			var myselection = $('#'+arr[i]).attr('num');
			//그놈꺼 빨갛게
			$('#'+myselection).css('border','2px solid red');
			
		}
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
		data: {face:face,hair:hair,eye:eye,nose:nose,mouth:mouth,ear:ear,neck:neck,body:body,hairColor:hairColor,eyeColor:eyeColor,bodyColor:bodyColor},
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


<title>아바타 만들기</title>
</head>
<body>

<!-- 만들어진 아바타가 보이는 div 태그 -->
<div id="avatar">
<input type="button" value="초기화" id="resetbtn">

	<!-- 저장버튼 및 초기화버튼이 보이는 div태그 -->
	<div id="saveArea">
	<input type="button" value="저장" id="savebtn">
	</div>
</div>

<!-- 아바타 신체부위 선택하는 대분류 div태그 -->
<div id="category">
<input id="facebtn" class="category" type="button" value="얼굴"><input id="hairbtn" class="category" type="button" value="헤어"><input id="eyebtn" class="category" type="button" value="눈"><input id="nosebtn" class="category" type="button" value="코"><input id="mouthbtn" class="category" type="button" value="입"><input id="earbtn" class="category" type="button" value="귀"><input id="neckbtn" class="category" type="button" value="목"><input id="bodybtn" class="category" type="button" value="몸">
</div>

<!-- 실제로 쓸 신체부위 선택하는 소분류 div태그 -->
<div id="detail">
만들 부위를 선택해 주세요
	<div id="items">
	</div>
</div>

<!-- 색깔 선택하는 div태그 -->
<div id="color">

</div>

<div id="test"></div>

</body>
</html>