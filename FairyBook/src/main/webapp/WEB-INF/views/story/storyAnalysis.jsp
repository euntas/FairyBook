<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>StoryAnalysis</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.0/morris.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--적용 자바스크립트와 스타일  -->
<style>
.morris-hover{position:absolute;z-index:1000}.morris-hover.morris-default-style{border-radius:10px;padding:6px;color:#666;background:rgba(255,255,255,0.8);border:solid 2px rgba(230,230,230,0.8);font-family:sans-serif;font-size:12px;text-align:center}.morris-hover.morris-default-style .morris-hover-row-label{font-weight:bold;margin:0.25em 0}
.morris-hover.morris-default-style .morris-hover-point{white-space:nowrap;margin:0.1em 0}

#face{
	left: 20%;
	margin-left: 10%;
	z-index: 0;
}
#mainNav {
  overflow: hidden;
  background-color: #333;
  width: 200%;
}
#mainNav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}
.f-nav {
	z-index:9999; 
	position:fixed; 
	width:100%;
}

#allColorAnalysis{
	width: 700px;
	height: 500px;
	padding: 10%;
	background-color:rgb(255,255,196);
}
</style>

<script>
/* 색 결과를 위한 정보 */
//색깔 이름 배열
var colorArray = [];
//색깔별 count배열
var countArray=[];
//Morris.donut의 data속성에 집어넣을 값
var data = [];
//count가 0인 것을 제외한 color배열
var existColor = [];
var indexD = 0;




$(function(){
	getColorName();
	clear();
	//home(); //처음 열면 home화면 on active
	bringAvatar(); //아바타 불러오기
	$('#all').on('click',home);
	$('#color').on('click',menu1);
	$('#htp1').on('click',menu2);
	$('#htp2').on('click',menu3);
	$('#htp3').on('click',menu4);
	$('#quiz').on('click',menu5);
})

function getColorName(){
	
	$.ajax({
		url:'colorGraph',
		type:'GET',
		data: {selectionNum: ${selectionNum}}, 
		dataType:'json',
		success:function(color){
			colorArray = color.colorName;
			countArray =color.colorCount;
			for (var i = 0; i < countArray.length; i++) {
				if (countArray[i] != 0) {
					data[indexD] = {label: colorArray[i],value:countArray[i],num:i};
					existColor[indexD++] = colorArray[i];
				}
			}
			home();
		},
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
		
}

function home(){
	clear();
	$('#home').attr('class','on active');
	$('#colorGraphH').html('');
		var donut =  Morris.Donut({
		        element: 'colorGraphH', //id
		        data: data,
		        hideHover: 'auto',
		        colors: existColor //set colors for each bar
		      }).on('click', function (i, row) {  //click했을 때 row-i번째 줄의 {label:..,value:..}
		      	  $('.colorLabel').html(row.label);
		    	  $('.colorSpecific').html(getAnalysis(row.num));
		        });
		//맨 처음에 선택될 index 지정
		donut.select(1); 
		$('.colorLabel').html(existColor[1]);
  	 	$('.colorSpecific').html(getAnalysis(data[1].num));
}


function allColor(){
	var input = "<div id='allColorAnalysis'>";
	input += '<div class="col-md-3">';
	input += '<ul class="nav nav-pills nav-stacked">';
	$.each(colorArray,function(i,c){
		input += '<li><a data-toggle="pill" onclick="eachColor(';
		input += "'"+i+"'";
		input += ')">'+c+'</a></li>';
	});
 	input += '</ul></div>';
 	input += '<div class="tab-content">';
    input += '<span id="eachColor"></span>';
 	input += '</div>';
 	input += '</div>';
	
	
	
	$('#allColor').html(input);
}

function eachColor(i){
	var a = getAnalysis(i);
	console.log(a);
	$('#eachColor').html(getAnalysis(i));
}
function getAnalysis(i){
	return $.ajax({
		url:'colorAnalysis',
		data: {colornum:i},
		dataType:'text',
		error: function(e){
			alert(JSON.stringify(e));
		},
		async: false
	}).responseText; 
	
}

function menu1(){
	clear();
	$('#colorGraph').html('');
	$('#menu1').attr('class','on active');
	var donut = Morris.Donut({
		        element: 'colorGraph',
		        data: data,
		        colors: existColor
		      }).on('click', function (i, row) {  //row-i번째 줄의 {label:..,value:..}
		    	  $('.colorLabel').html(row.label);
		    	  $('.colorSpecific').html(getAnalysis(row.num));
		        });
		//맨 처음에 선택될 index 지정
			donut.select(1); 
			$('.colorLabel').html(existColor[1]);
			$('.colorSpecific').html(getAnalysis(data[1].num));
}

function menu2(){
	clear();
	$('#menu2').attr('class','on active');
	$.ajax({
		url: 'houseAnalysis',
		type: 'GET',
		data: {selectionNum: ${selectionNum}}, 
		dataType: 'json',
		success: showHouse,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

function showHouse(house){
	var img = "";
	$.each(house,function(i,h){
		img += '<img src="'+h.path+'"/>';
	});
	
	$('#showHouse').html(img);
}

function menu3(){
	clear();
	$('#menu3').attr('class','on active');
}

function menu4(){
	clear();
	$('#menu4').attr('class','on active');
}

function menu5(){
	clear();
	$('#menu5').attr('class','on active');
	getQuiz();
}

//내 아바타 가져오기
function bringAvatar(){
	$.ajax({
		url: 'avatarAnalysis',
		type: 'GET',
		data: {selectionNum: ${selectionNum}}, 
		dataType: 'json',
		success: showAvatar,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

function showAvatar(r){
	var input = '';
	var analysis = '';
	
	for (var i = 0; i < r.length; i++) {
		console.log(r[i].path);
		console.log(r[i].name.substring(0,3));
		input += '<img src="'+r[i].path+'" style="position: absolute;" usemap="#002"/>';
		analysis += r[i].analysis+'<br>';
	}
	
	/*아바타 심리 결과를 위한 정보*/
	// 아바타 항목 위치 좌표 정보. 배열 순서는 다음과 같다. (얼굴 , 코, 입 ...)
	 var avatarArray = ['12,15,285,58', '24,134,269,263'];
	
	//항목 누르는 곳 설정
	input += '<map name="002">';
	
	for( var j=0; j<r.length; j++){
		var strName = r[j].name;
		if(strName.indexOf('hair') != -1){
			input += '<area shape="rect" coords="12,15,285,58" onclick="point(\'' + r[j].analysis + '\')" target="_blank">';
		}
		
		if(strName.indexOf('face') != -1){
			input += '<area shape="poly" coords="68,151,121,154,118,193,85,206,145,255" onclick="point(\'' + r[j].analysis + '\')" target="_blank">';
			input += '<area shape="poly" coords="177,151,238,144,164,257,217,185,172,184" onclick="point(\'' + r[j].analysis + '\')" target="_blank">';
		}
		
		if(strName.indexOf('eye') != -1){
			input += '<area shape="rect" coords="80,139,108,168" onclick="point(\'' + r[j].analysis + '\')" target="_blank">';
			input += '<area shape="rect" coords="195,137,219,169" onclick="point(\'' + r[j].analysis + '\')" target="_blank">';
		}
				
		if(strName.indexOf('nose') != -1){
			input += '<area shape="rect" coords="127,146,165,186" onclick="point(\'' + r[j].analysis + '\')" target="_blank">';
		}
		
		if(strName.indexOf('mouth') != -1){
			input += '<area shape="rect" coords="96,200,198,241" onclick="point(\'' + r[j].analysis + '\')" target="_blank">';
		}
		
		if(strName.indexOf('ear') != -1){
			input += '<area shape="rect" coords="5,151,48,215" onclick="point(\'' + r[j].analysis + '\')" target="_blank">';
			input += '<area shape="rect" coords="253,148,280,210" onclick="point(\'' + r[j].analysis + '\')" target="_blank">';
		}
		
		if(strName.indexOf('body') != -1){
			
		}
		
	}
	
	input += '</map>';
	
	$('.showAvatar').html(input);
	$('#htpSpecific').html(analysis);
	
	// 디폴트로 텍스트 란에는 얼굴 설명을 넣어 놓는다.
	//$('#htpSpecific4').html(r[0].analysis);
}

//활성화 tab페이지 초기화
function clear(){
	window.scrollTo(0,0);
	$('#home,#menu1,#menu2,#menu3,#menu4,#menu5').attr('class','');
	$('#home,#menu1,#menu2,#menu3,#menu4,#menu5').attr('class','tab-pane fade');
}

// 각 항목(머리, 얼굴 등) 눌렀을 때 강조
function point(analysis){
	$('#htpSpecific4').html(analysis);
}
	
//퀴즈 가져오기
function getQuiz(){
	alert('????????');	
	$.ajax({
		url:'getQuizResult',
		type:'POST',
		data: {selectionNum: ${selectionNum}}, 
		dataType: 'json',
		success: showQuiz,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//화면에 quiz뿌려주기
function showQuiz(list){
	var input = "";
	$.each(list,function(i,l){
		input += '<div style="padding:5px;height:250px;width: 400px;float:left;">';
		input += '<div class="w3-card-2">';/*  style="height:250px;width: 400px;float:left;" */
		input += '<header class="w3-container w3-light-blue">';
		input += '<h4 id="quizLabel">'+l.question+'</h4>';
		input += '</header>';
		input += '<div class="w3-container" id="quizSpecific">';
		input += l.select1;
		input += '<br>'+l.select2;
		input += '<br>'+l.select3;
		input += '<br>'+l.select4;
		input += '</div>';
		input += '<footer class="w3-container w3-light-grey">';
		if (l.myanswer == l.answer) {
			input += '<span style="color:blue;">선택한 답:'+l.myanswer+'</span><br>';
		}else{
			input += '<span style="color:red;">선택한 답:'+l.myanswer+'</span><br>';
		}
		input += '정답:'+l.answer+'</footer>';
		input += '</div>';
		input += '</div>';
	});
	
	$('#quizPanel').html(input);
}


// =======================================


</script>

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	
<!--####################여기부터  -->

<div class="container-fluid">
<div class="f-nav">
<ul class="nav nav-pills" id="mainNav">
    <li class="active"><a data-toggle="pill" href="#home" id="all">전체</a></li>
    <li><a data-toggle="pill" href="#menu1" id="color">심리-색</a></li>
    <li><a data-toggle="pill" href="#menu2" id="htp1">심리-HTP-h</a></li>
    <li><a data-toggle="pill" href="#menu3" id="htp2">심리-HTP-t</a></li>
    <li><a data-toggle="pill" href="#menu4" id="htp3">심리-HTP-p</a></li>
    <li><a data-toggle="pill" href="#menu5" id="quiz">퀴즈</a></li>
  </ul>
</div>
  <div class="tab-content">
    <div id="home">
    	<div class="row col-sm-12"><h3>종합 결과</h3><hr></div>
    	<!-- 색 -->
		  <div class="row">
		    <div class="col-sm-12">
		    	<h5>심리-색</h5>  
		    </div>
		  </div>
		  <hr>
		  <div class="row">
		    <div class="col-md-4" style="width: 500px;">
		        <div id="colorGraphH" style="height: 250px;"></div>
		    </div>
	        <div class="panel panel-warning" style="height:250px;width: 400px;float:left;">
		      <div class="panel-heading colorLabel"></div>
		      <div class="panel-body colorSpecific"></div>
		    </div>
		  </div>
		  <hr>
		  <!-- htp -->
		  <div class="row">
		    <div class="col-sm-12">
		    	<h5>심리-HTP</h5>  
		    </div>
		  </div>
		  <hr>
		  <div class="row">
		  	<div class="col-md-4" style="width: 500px;">
		  		<div id="showAvatar1" class="showAvatar" style="position: relative;"></div>
		    </div>
		  	<div class="panel panel-warning" style="padding: 10px;width: 400px;float:left;">
		      <div class="panel-heading" id="htpLabel">htp</div>
		      <div class="panel-body" id="htpSpecific"></div>
		    </div>
		  </div>
		  <hr>
		  <!-- quiz -->
		  <div class="row">
		    <div class="col-sm-12">
		    	<h5>QUIZ</h5>  
		    </div>
		  </div>
		  <hr>
		  <div class="row">
		  	<div class="col-md-4" style="width: 500px;">
		    </div>
		  	<div class="panel panel-warning" style="height:250px;width: 400px;float:left;">
		      <div class="panel-heading" id="quizLabel">문제</div>
		      <div class="panel-body" id="quizSpecific">답</div>
		    </div>
		  </div>
		  <hr>
    </div>
    
    <div id="menu1">
		<div class="row">
		    <div class="col-sm-12">
		    	<h5>심리-색</h5>  
		    </div>
		  </div>
		  <hr>
		  <div class="row">
		    <div class="col-md-4" style="width: 500px;">
		        <div id="colorGraph" style="height: 250px;"></div>
		    </div>
	        <div class="panel panel-warning" style="height:400px;width: 400px;float:left;">
		      <div class="panel-heading colorLabel"></div>
		      <div class="panel-body colorSpecific"></div>
		    </div>
		  </div>
		  <br>
		  <div style="width: 900px; height: 50px; padding: 20px; border: 1px solid black;">
		  	색채검사는 ....................................................
		  </div>
		  <hr>
		  <div class="row" style="width: 500px; padding-left:100px;">
		  	<button class="btn-default" onclick="allColor();">다른 색 정보보기</button>
		  	<div id="allColor"></div>
		  </div>
    </div>
    
    <div id="menu2">
      <h3>심리-HTP-h</h3>
		<div class="row">
		    <div class="col-sm-12">
		    	<h5>심리-HTP-h</h5>  
		    </div>
		  </div>
		  <hr>
		  <div class="row">
		  	<div class="col-md-4" style="width: 500px;" id="showHouse">
		    </div>
		  	<div class="panel panel-warning" style="height:250px;width: 400px;float:left;">
		      <div class="panel-heading" id="htpLabel">htp</div>
		      <div class="panel-body" id="htpSpecificH"></div>
		    </div>
		  </div>
		  <hr>
    </div>
    
    <div id="menu3">
      <h3>심리-HTP-t</h3>
		<div class="row">
		    <div class="col-sm-12">
		    	<h5>심리-HTP-t</h5>  
		    </div>
		  </div>
		  <hr>
		  <div class="row">
		  	<div class="col-md-4" style="width: 500px;">
		  		<img alt="myAvatar" src="../resources/img/avatar/face/face01.png" id="face">
		    </div>
		  	<div class="panel panel-warning" style="height:250px;width: 400px;float:left;">
		      <div class="panel-heading" id="htpLabel">htp</div>
		      <div class="panel-body" id="htpSpecific"></div>
		    </div>
		  </div>
		  <hr>
    </div>
    
    <div id="menu4">
      <h3>심리-HTP-p</h3>
		<div class="row">
		    <div class="col-sm-12">
		    	<h5>심리-HTP-p</h5>  
		    </div>
		  </div>
		  <hr>
		  <div class="row">
		  	<div class="col-md-4" style="width: 500px;">
		  		<div id="showAvatar2" class="showAvatar" style="position: relative;"></div>
		    </div>
		  	<div class="panel panel-warning" style="height:250px;width: 400px;float:left;">
		      <div class="panel-heading" id="htpLabel">htp</div>
		      <div class="panel-body" id="htpSpecific4"></div>
		    </div>
		  </div>
		  <hr>
    </div>
    
    <div id="menu5">
      <h3>퀴즈</h3>
		<div class="row">
		    <div class="col-sm-12">
		    	<h5>QUIZ</h5>  
		    </div>
		  </div>
		  <hr>
		  <div class="card-deck" id="quizPanel"></div>
		  <hr>
    </div>
    
  </div>
  
  
  
  
</div>


<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 
