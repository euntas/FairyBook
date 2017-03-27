<!-- 아바타만들기 페이지 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- favicon 링크 -->
<link rel="shortcut icon" type="image/x-icon" href="./resources/img/favicon.ico">

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
		url: 'callRoof',
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
		url: 'callDoor',
		type: 'GET',
		dataType: 'json',
		success: detailWithColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//창문 불러오기
function callWindow(){
	$.ajax({
		url: 'callWindow',
		type: 'GET',
		dataType: 'json',
		success: detailWithColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//굴뚝 불러오기
function callChimney(){
	$.ajax({
		url: 'callChimney',
		type: 'GET',
		dataType: 'json',
		success: detailWithoutColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//마당 불러오기
function callYard(){
	$.ajax({
		url: 'callYard',
		type: 'GET',
		dataType: 'json',
		success: detailWithoutColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//벽 불러오기
function callWall(){
	$.ajax({
		url: 'callWall',
		type: 'GET',
		dataType: 'json',
		success: detailWithoutColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}


//불러온 자료를 디테일 부분에 띄운다(색 선택 부분은 안보여줌)
function detailWithoutColor(resourceList){
	var list = '';
	for(var i in resourceList){
		list += '<img src="'+resourceList[i].path+'" class="items" num="'+resourceList[i].resourceNum+'" name="'+resourceList[i].name+'" id="'+resourceList[i].resourceNum+'">';
	}
	$('#items').html(list);
	$('.items').on('click', draw);
	$('#color').css('display','none');
	$('#detail').css('width','79%');
	
	checkSelection();
	
}

//불러온 자료를 디테일 부분에 띄운다(색 선택 부분은 보여줌)
function detailWithColor(resourceList){
	var list = '';
	for(var i in resourceList){
		list += '<img src="'+resourceList[i].path+'" class="items" num="'+resourceList[i].resourceNum+'" name="'+resourceList[i].name+'" id="'+resourceList[i].resourceNum+'">';
	}
	$('#items').html(list);
	$('.items').on('click', draw);
	$('#color').css('display','block');
	$('#detail').css('width','50%');
	
	checkSelection();
}

//디테일에서 선택하면 아바타가 그려진다
function draw(){
	var house = $('#house').html();
	var arr = ['roof', 'door', 'window', 'chimney', 'yard', 'wall'];
	for(var i in arr){
		if($(this).attr('name').indexOf(arr[i])!=-1){
			if(house.indexOf(arr[i])==-1){
				house += '<img src="'+$(this).attr('src')+'" num="'+$(this).attr('num')+'" name="'+$(this).attr('name')+'" id="'+arr[i]+'">';
				$('#house').html(house);
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
		if(house.indexOf(arr[i])!=-1){
			count += 1;
		}
	}
	if(count == 6){
		$('#savebtn').css('display','block');
		$('#savebtn').on('click',save);
	}
	
	checkSelection();
}


//내가 선택한 이미지를 강조해준다
function checkSelection(){
	var house = $('#house').html();
	var arr = ['roof', 'door', 'window', 'chimney', 'yard', 'wall'];
	//일단 전체에 아무것도 없게 만들고
	$('#items img').css('border','none');
	for(var i in arr){
		//위의 부위가 하우스 영역에 그려져있을때
		if(house.indexOf(arr[i])!=-1){
			//해당 부위의 넘버를 가져와서
			var myselection = $('#'+arr[i]).attr('num');
			//그놈꺼 빨갛게
			$('#'+myselection).css('border','2px solid red');
		}
	}
}


//reset버튼을 누르면 그리던 집을 초기화한다
function reset(){
	var house = '<input type="button" value="초기화" id="reset">';
	$('#house').html(house);
}

//save버튼을 누르면 완성된 집을 DB에 저장한다
function save(){
	var roof = $('#roof').attr('num');
	var door = $('#door').attr('num');
	var window = $('#window').attr('num');
	var chimney = $('#chimney').attr('num');
	var yard = $('#yard').attr('num');
	var wall = $('#wall').attr('num');
	$.ajax({
		url: 'saveHouse',
		type: 'POST',
		data: {roof:roof,door:door,window:window,chimney:chimney,yard:yard,wall:wall,},
		success: function(){
			alert('저장완료!');
			location.href='story/storyTest'
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
<input id="roofbtn" class="category" type="button" value="지붕"><input id="doorbtn" class="category" type="button" value="문"><input id="windowbtn" class="category" type="button" value="창문"><input id="chimneybtn" class="category" type="button" value="굴뚝"><input id="yardbtn" class="category" type="button" value="마당"><input id="wallbtn" class="category" type="button" value="벽">
</div>

<!-- 실제로 쓸 부위 선택하는 소분류 div태그 -->
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