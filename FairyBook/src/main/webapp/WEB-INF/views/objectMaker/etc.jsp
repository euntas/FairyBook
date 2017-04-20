<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>색칠하기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/css/etc.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">
<script src="../resources/js/jquery-3.1.1.min.js"></script>
<script src="../resources/js/jquery-3.1.1.js"></script>

<!--적용 자바스크립트와 스타일  -->

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:220px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>

<!-- 만들어진 기타요소가 보이는 div 태그 -->
<div id="etc">

<input type="button" value="초기화" id="resetbtn">

	<!-- 저장버튼 및 초기화버튼이 보이는 div태그 -->
	<div id="saveArea">
	<input type="button" value="저장" id="savebtn">
	</div>
</div>

<!-- 색깔 선택하는 div태그 -->
<div id="category">
<input id="Red" class="category" type="button" value="빨강"><input id="Orange" class="category" type="button" value="주황"><input id="Yellow" class="category" type="button" value="노랑"><input id="Green" class="category" type="button" value="초록"><input id="Blue" class="category" type="button" value="파랑"><input id="Purple" class="category" type="button" value="보라"><input id="White" class="category" type="button" value="하양"><input id="Gray" class="category" type="button" value="회색"><input id="Black" class="category" type="button" value="검정">
</div>

<script>
$(document).ready(function(){
	$('#Red').on('click', colorbtn);
	$('#Orange').on('click', colorbtn);
 	$('#Yellow').on('click', colorbtn);
	$('#Green').on('click', colorbtn);
	$('#Blue').on('click', colorbtn);
	$('#Purple').on('click', colorbtn);
	$('#White').on('click', colorbtn);
	$('#Gray').on('click', colorbtn);
	$('#Black').on('click', colorbtn);
	$('#etc').css('background-image','url("../resources/img/etc/background${storyNum}.jpg")');
	draw();
});
var currentObject;
var resetValue;

// storyNum에 따라 해당하는 객체를 그린다
function draw(){
	var etc = $('#etc').html();
	var etcList = new Array();
	
	<c:forEach items="${etcList}" var="item">
		etcList.push("${item.path}");
	</c:forEach>
	
	etc += '<img src="'+etcList[0]+'" id="selection0">';
	
	// 색 선택 안했을시 디폴트 값 7
	for(var i = 1 ; i< etcList.length ; i++){
		if(i == etcList.length -1){
			etc += '<img src="'+etcList[i]+'" id="selection'+i+'" class="selection" num="7" usemap="#001">';
		}else{
			etc += '<img src="'+etcList[i]+'" id="selection'+i+'" class="selection" num="7">';			
		}
	}
	
	// 젤리 누르는 곳 좌표값 
	etc += '<map name="001">';
	etc += '<area shape="rect" coords="327,153,372,200" onclick="point(1)" target="_blank">';
	etc += '<area shape="rect" coords="378,125,423,170" onclick="point(2)" target="_blank">';
	etc += '<area shape="rect" coords="431,97,475,144" onclick="point(3)" target="_blank">';
	etc += '<area shape="rect" coords="352,205,397,252" onclick="point(4)" target="_blank">';
	etc += '<area shape="rect" coords="404,180,450,226" onclick="point(5)" target="_blank">';
	etc += '<area shape="rect" coords="456,151,502,197" onclick="point(6)" target="_blank">';
	etc += '<area shape="rect" coords="387,258,433,307" onclick="point(7)" target="_blank">';
	etc += '<area shape="rect" coords="439,232,484,278" onclick="point(8)" target="_blank">';
	etc += '<area shape="rect" coords="490,208,536,254" onclick="point(9)" target="_blank">';
	etc += '<area shape="rect" coords="413,314,458,360" onclick="point(10)" target="_blank">';
	etc += '<area shape="rect" coords="464,285,510,331" onclick="point(11)" target="_blank">';
	etc += '<area shape="rect" coords="517,259,563,305" onclick="point(12)" target="_blank">';
	etc += '</map>';
	
	$('#etc').html(etc);
	$('#resetbtn').on('click', reset);
	$('#savebtn').on('click', save);
	resetValue = $('#etc').html();
}

// 각 젤리 눌렀을 때 강조
function point(i){
	var etc = $('#etc').html();
	var etcList = new Array();
	<c:forEach items="${etcList}" var="item">
		etcList.push("${item.path}");
	</c:forEach>
	if(etc.indexOf('currentObject')==-1){
		etc += '<img src="'+etcList[i].substring(0, etcList[i].length-4)+'Select.png" id="currentObject" class="selection" num="'+i+'">';
		$('#etc').html(etc);
		$('#resetbtn').on('click', reset);
		$('#savebtn').on('click', save);
	}else{
		$('#currentObject').attr('src',etcList[i].substring(0, etcList[1].length-4)+'Select.png');
		$('#currentObject').attr('num', i);
	}
}

// 색 선택 버튼 눌렀을 때
function colorbtn(){
	var etc = $('#etc').html();
	var currentNum = $('#currentObject').attr('num');
	var storyNum = ${storyNum};
	var color = $(this).attr('id');
	var colorNum = ['Black', 'Red', 'Oragne', 'Yellow', 'Green', 'Blue', 'Purple', 'White', 'Gray'];	
	
	if(etc.indexOf('currentObject')==-1){
		alert('색칠할 대상을 먼저 선택해 주세요!');
		return;
	}

	$.ajax({
		url: 'callETCColor',
		type: 'GET',
		data: {storyNum:storyNum, currentNum:currentNum, color:color},
		dataType: 'text',
		success: function(str){
			$('#selection'+currentNum).attr('src', str);
			$('#selection'+currentNum).attr('num', colorNum.indexOf(color));
		},
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//reset버튼을 누르면 초기화한다
function reset(){
	$('#etc').html(resetValue);
	$('#resetbtn').on('click', reset);
	$('#savebtn').on('click', save);
}

//save버튼을 누르면 저장한다
function save(){
	var colors = new Array();
	var check = 0;
	var selectionNum = ${selectionNum};
	for(var i=1; i<13; i++){
		colors.push($('#selection'+i).attr('num'));
		if($('#selection'+i).attr('num')==7){
			check += 1;
		}
	}
	if(check >= 6){
		if(confirm('색칠하지 않은 젤리가 많습니다! 그래도 저장하시겠습니까?')){
			$.ajax({
				url: 'saveETC',
				type: 'POST',
				data:
				{selectionNum: selectionNum,
				selection1Color:colors[0],
				selection2Color:colors[1],
				selection3Color:colors[2],
				selection4Color:colors[3],
				selection5Color:colors[4],
				selection6Color:colors[5],
				selection7Color:colors[6],
				selection8Color:colors[7],
				selection9Color:colors[8],
				selection10Color:colors[9],
				selection11Color:colors[10],
				selection12Color:colors[11]
				},
				success: function(){
					$.ajax({
				        url:'../story/saveSD',
				        type:'GET',
				        data: {pageNum: 13},
				        dataType:'json',
				        success: function(){
				        	location.href='../story/storyStart?storyNum=1';
				        },
				        error: function(e){
				        	alert("플립 실패 들어옴");
				            alert(JSON.stringify(e));
				        }
				    });
					
				},
				error: function(e){
					alert(JSON.stringify(e));
				}
			});
		}
		else{
			return;
		}
	}else{
		if(confirm('확실합니까?')){
			$.ajax({
				url: 'saveETC',
				type: 'POST',
				data:
				{selectionNum: selectionNum,
				selection1Color:colors[0],
				selection2Color:colors[1],
				selection3Color:colors[2],
				selection4Color:colors[3],
				selection5Color:colors[4],
				selection6Color:colors[5],
				selection7Color:colors[6],
				selection8Color:colors[7],
				selection9Color:colors[8],
				selection10Color:colors[9],
				selection11Color:colors[10],
				selection12Color:colors[11]
				},
				success: function(){
					 $.ajax({
		                  url:'../story/saveSD',
		                  type:'GET',
		                  data: {pageNum: 13, answerNum: 1},
		                  dataType: 'json',
		                  success: function(){
		                     location.href='../story/storyStart?storyNum=1';
		                  },
		                  error: function(e){
		                      alert(JSON.stringify(e));
		                  }
		              });
				},
				error: function(e){
					alert(JSON.stringify(e));
				}
			});
		}
		else{
			return;
		}
	}
}

</script>

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 
