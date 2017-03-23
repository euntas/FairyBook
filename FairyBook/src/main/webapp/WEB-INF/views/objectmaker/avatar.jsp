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

<!-- jquery 링크 -->
<script src="./resources/js/jquery-3.1.1.js"></script>

<!-- 페이지 캡쳐 및 저장 링크 -->
<script src="/common/js/html2canvas.js"></script>

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
	$('#skinbtn').on('click', callSkin);
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
	$('#reset').on('click', reset);
}

//reset버튼을 누르면 그리던 아바타를 초기화한다
function reset(){
	var avatar = '<input type="button" value="초기화" id="reset">';
	$('#avatar').html(avatar);
}

function capture() {
    html2canvas($(".container"), {
          onrendered: function(canvas) {
            //document.body.appendChild(canvas);
            //alert(canvas.toDataURL("image/png"));
            $("#imgSrc").val(canvas.toDataURL("image/png"));
            $.ajax({
                type: "post",
                data : $("form").serialize(),
                url: "/imageCreate.ajax",
                error: function(a, b, c){        
                    alert("fail!!");
                },
                success: function (data) {
                    try{
                        
                    }catch(e){                
                        alert('server Error!!');
                    }
                }
            });
          }
    });
</script>


<title>아바타 만들기</title>
</head>
<body>

<!-- 만들어진 아바타가 보이는 div 태그 -->
<div id="avatar">
<input type="button" value="초기화" id="reset">

	<!-- 저장버튼 및 초기화버튼이 보이는 div태그 -->
	<div id="saveArea">
	<input type="button" value="저장" id="save">
	</div>
</div>

<!-- 아바타 신체부위 선택하는 대분류 div태그 -->
<div id="category">
<input id="facebtn" class="category" type="button" value="얼굴"><input id="hairbtn" class="category" type="button" value="헤어"><input id="eyebtn" class="category" type="button" value="눈"><input id="nosebtn" class="category" type="button" value="코"><input id="mouthbtn" class="category" type="button" value="입"><input id="earbtn" class="category" type="button" value="귀"><input id="neckbtn" class="category" type="button" value="목"><input id="bodybtn" class="category" type="button" value="몸"><input id="skinbtn" class="category" type="button" value="피부">
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

<input type="hidden" name="imgsrc" id="imgsrc" />

</body>
</html>