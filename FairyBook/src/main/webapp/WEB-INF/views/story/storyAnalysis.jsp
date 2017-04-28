<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">

<!--적용 자바스크립트와 스타일  -->
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
.hanna{
	font-family: 'Hanna', fantasy;
}

.morris-hover{position:absolute;z-index:1000;}.morris-hover.morris-default-style{border-radius:10px;padding:6px;color:#666;background:rgba(255,255,255,0.8);border:solid 2px rgba(230,230,230,0.8);font-family:sans-serif;font-size:12px;text-align:center;}.morris-hover.morris-default-style .morris-hover-row-label{font-weight:bold;margin:0.25em 0;}
.morris-hover.morris-default-style .morris-hover-point{white-space:nowrap;margin:0.1em 0;}

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

.colorLblwhite{
	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
}
a[class*='colorLbl']{
	font-size:120%;
}
#allColorAnalysis{
	width: 700px;
	height: 500px;
	padding: 5%;
	background-color:rgb(255,255,196);
}
#eachColor{
	
}

img[id*='eye']{
	z-index: 4;
}

img[id*='nose']{
	z-index: 4;
}

img[id*='mouth']{
	z-index: 4;
}

img[id*='ear']{
	z-index: 4;
}

img[id*='face']{
	z-index: 3;
}

img[id*='body']{
	z-index: 2;
}

img[id*='hair']{
	z-index: 1;
}

img[id*='chimney']{
	z-index: 4;
}

img[id*='window']{
	z-index: 4;
}

img[id*='roof']{
	z-index: 3;
}

img[id*='wall']{
	z-index: 2;
}

img[id*='door']{
	z-index: 5;
} 
</style>

<script>
var selectionNum = ${selectionNum};
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
	home(); //처음 열면 home화면 on active
	
	$('#all').on('click',home);
	$('#color').on('click',menu1);
	$('#htp1').on('click',menu2);
	$('#htp2').on('click',menu3);
	$('#htp3').on('click',menu4);
	$('#quiz').on('click',menu5);
	
	getETCPattern();
});

function getETCPattern(){
	$.ajax({
		url:'etcPatternAnalysis',
		type:'GET',
		data: {selectionNum: selectionNum}, 
		dataType:'json',
		success:function(result){
			console.log(result);
		},
		error: function(e){
			alert("etc문제임" + "num:" + selectionNum +" " + JSON.stringify(e));
		}
	});
}

function getColorName(){
	$.ajax({
		url:'colorGraph',
		type:'GET',
		data: {selectionNum: selectionNum}, 
		dataType:'json',
		success:function(color){
			colorArray = color.colorName;
			countArray =color.colorCount;
			for (var i = 0; i < countArray.length; i++) {
				if (countArray[i] != 0) {
					data[indexD] = {label: colorArray[i],value:countArray[i],num:i};
					existColor[indexD++] = colorArray[i];
				}
			}//for
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
}


function allColor(){
	var input = "<div id='allColorAnalysis'>";
	input += '<div class="col-md-3">';
	input += '<ul class="nav nav-pills nav-stacked">';
	$.each(colorArray,function(i,c){
		input += '<li><a class="colorLbl'+c+'" data-toggle="pill" onclick="eachColor(\''+i+'\')" style="color:'+c+';">'+c+'</a></li>';
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
		type:'GET',
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
		data: {selectionNum: selectionNum}, 
		dataType: 'json',
		success: showHouse,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

var analysis = new Array();
var houseName = new Array();

function showHouse(house){
	var input = '';
	
	for (var i = 0; i < house.length; i++) {
		input += '<img src="'+house[i].path+'" id="'+house[i].name+'" style="position: absolute;" usemap="#houseMap"/>';
		analysis[i] = house[i].analysis;
		//가져오는 순서 - 지붕, 창문, 굴뚝, 벽, 문
	}
	
	input += '<map name="houseMap">';
	
	$.each(house,function(i,h){
		console.log(h.name);
		if (h.name.indexOf('chimney')!=-1) {
			houseName[i] = '굴뚝';
			input+='<area alt="chimney" shape="rect" coords="163,60,194,85" onclick="housePoint(\''+i+'\')">';
		}
		else if(h.name.indexOf('roof')!=-1){
			houseName[i] = '지붕';
			input+='<area alt="roof" shape="poly" coords="98,92,82,144,130,144,130,92" onclick="housePoint(\''+i+'\')">';
			input+='<area alt="roof" shape="poly" coords="170,92,170,144,242,142,198,92" onclick="housePoint(\''+i+'\')">';
		}
		else if(h.name.indexOf('door01')!=-1){
			houseName[i] = '문';
			input+='<area alt="door" shape="rect" coords="180,253,205,299" onclick="housePoint(\''+i+'\')">';
		}
		else if(h.name.indexOf('door02')!=-1 || h.name.indexOf('door04')!=-1){
			houseName[i] = '문';
			input+='<area alt="door" shape="rect" coords="169,220,209,299" onclick="housePoint(\''+i+'\')">';
		}
		else if(h.name.indexOf('door03')!=-1){
			houseName[i] = '문';
			input+='<area alt="door" shape="rect" coords="161,177,227,299" onclick="housePoint(\''+i+'\')">';
		}
		else if(h.name.indexOf('door05')!=-1){
			houseName[i] = '문';
			input+='<area alt="door" shape="rect" coords="88,220,210,299" onclick="housePoint(\''+i+'\')">';
		}
		else if(h.name.indexOf('window01')!=-1){
			houseName[i] = '창문';
			input+='<area alt="window" shape="rect" coords="88,282,124,210" onclick="housePoint(\''+i+'\')">';
		}
		else if(h.name.indexOf('window02')!=-1){
			houseName[i] = '창문';
			input+='<area alt="window" shape="rect" coords="132,104,168,131" onclick="housePoint(\''+i+'\')">';
		}
		else if(h.name.indexOf('window03')!=-1){
			houseName[i] = '창문';
			input+='<area alt="window" shape="rect" coords="60,182,206,211" onclick="housePoint(\''+i+'\')">';
		}
		else if(h.name.indexOf('window04')!=-1){
			houseName[i] = '창문';
			input+='<area alt="window" shape="rect" coords="77,187,127,211" onclick="housePoint(\''+i+'\')">';
		}
	});
	
	$('#showHouse').html(input);
}


function housePoint(i){
	console.log(name[i]);
	$('#htpLabelH').html(houseName[i]);
	console.log(analysis[i]);
	$('#htpSpecificH').html(analysis[i]);
}

//Tree
function menu3(){ 
	clear();
	$('#menu3').attr('class','on active');
	$.ajax({
		url:'treeAnalysis',
		type:'GET',
		data: {selectionNum: selectionNum}, 
		dataType: 'json',
		success: showTree,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

function showTree(tree){
	var image = '<img src="'+tree.path+'">';
	var analysis = tree.analysis;
	$('#showTree').html(image);
	$('#htpSpecificT').html(analysis);
}

function menu4(){
	clear();
	$('#menu4').attr('class','on active');
	bringAvatar(); //아바타 불러오기
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
		data: {selectionNum: selectionNum}, 
		dataType: 'json',
		success: showAvatar,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}


var avatarName = new Array();;
function showAvatar(r){
   var input = '';
   
   for (var i = 0; i < r.length; i++) {
	   console.log(r[i].name);
		if(i == r.length -1){
      		input += '<img src="'+r[i].path+'" id="'+r[i].name+'" style="position: absolute;" usemap="#002"/>';
		}else{
      		input += '<img src="'+r[i].path+'" id="'+r[i].name+'" style="position: absolute;"/>';
		}
		analysis[i] = r[i].analysis;
   }//for
   
   //항목 누르는 곳 설정
   input += '<map name="002">';
   
   
   
   $.each(r,function(i,a){
		if (a.name.indexOf('ear')!=-1) {
			avatarName[i] = '귀';
			input+='<area alt="ear" shape="rect" coords="38,121,59,158" onclick="avatarPoint(\''+i+'\')">';
			input+='<area alt="ear" shape="rect" coords="241,121,253,160" onclick="avatarPoint(\''+i+'\')">';
		}
		if (a.name.indexOf('face')!=-1) {
			avatarName[i] = '얼굴';
			input+='<area alt="face" shape="poly" coords="72,122,68,142,87,160,120,156,122,136,87,135,84,112" onclick="avatarPoint(\''+i+'\')">';
			input+='<area alt="face" shape="poly" coords="212,106,211,132,177,140,174,154,216,155,232,127" onclick="avatarPoint(\''+i+'\')">';
		}
		if (a.name.indexOf('eye')!=-1) {
			avatarName[i] = '눈';
			input+='<area alt="eye" shape="rect" coords="109,110,122,135" onclick="avatarPoint(\''+i+'\')">';
			input+='<area alt="eye" shape="rect" coords="169,110,190,135" onclick="avatarPoint(\''+i+'\')">';
		}
		if (a.name.indexOf('mouth')!=-1) {
			avatarName[i] = '입';
			input+='<area alt="mouth" shape="rect" coords="115,163,180,177" onclick="avatarPoint(\''+i+'\')">';
		}
		if (a.name.indexOf('nose')!=-1) {
			avatarName[i] = '코';
			input+='<area alt="nose" shape="rect" coords="135,138,153,159" onclick="avatarPoint(\''+i+'\')">';
		}
		if (a.name.indexOf('hair')!=-1) {
			avatarName[i] = '머리';
			input+='<area alt="hair" shape="poly" coords="51,85,104,69,194,67,246,88,218,42,148,17,79,85,46" onclick="avatarPoint(\''+i+'\')">';
		}
	});
   input += '</map>';
   
   $('#showAvatar2').html(input);
}


// 각 항목(머리, 얼굴 등) 눌렀을 때 강조
function avatarPoint(i){
	$('#htpLabelA').html(avatarName[i]);
	$('#htpSpecific4').html('');
	$('#htpSpecific4').html(analysis[i]);
}

//활성화 tab페이지 초기화
function clear(){
	window.scrollTo(0,0);
	$('#home,#menu1,#menu2,#menu3,#menu4,#menu5').attr('class','');
	$('#home,#menu1,#menu2,#menu3,#menu4,#menu5').attr('class','tab-pane fade');
}
	
//퀴즈 가져오기
function getQuiz(){
	
	alert('????????');	
	$.ajax({
		url:'getQuizResult',
		type:'POST',
		data: {selectionNum: selectionNum}, 
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
		input += '<h4 id="quizLabel" class="hanna">'+l.question+'</h4>';
		input += '</header>';
		input += '<div class="w3-container" id="quizSpecific">';
		input += '①'+l.select1;
		input += '<br>②'+l.select2;
		input += '<br>③'+l.select3;
		input += '<br>④'+l.select4;
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

function downloadPDF(){
	
	$.ajax({
		url:'../pdf/analysisToPdf',
		data:{selectionNum:selectionNum},
		success:function(){
			location.href='../pdf/download?selectionnum='+selectionNum;
		},
		fail:function(){
			alert('download fail');
		}
	});
}

</script>

<body data-spy="scroll" data-target=".navbar" data-offset="50" style="height:100%;" class="hanna">
<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	
<!--####################여기부터  -->

<div class="container-fluid">

	<div class="f-nav">
	<ul class="nav nav-pills" id="mainNav">
	    <li class="active"><a data-toggle="pill" href="#home" id="all" class="hanna">전체</a></li>
	    <li><a data-toggle="pill" href="#menu1" id="color" class="hanna">심리-색</a></li>
	    <li><a data-toggle="pill" href="#menu2" id="htp1" class="hanna">심리-HTP-h</a></li>
	    <li><a data-toggle="pill" href="#menu3" id="htp2" class="hanna">심리-HTP-t</a></li>
	    <li><a data-toggle="pill" href="#menu4" id="htp3" class="hanna">심리-HTP-p</a></li>
	    <li><a data-toggle="pill" href="#menu5" id="quiz" class="hanna">퀴즈</a></li>
	  </ul>
	</div>
  <div class="tab-content">
    <div style="padding-top:5%;" id="home">
    	<div  class="row col-sm-12">
    		<img alt="htp" src="../resources/img/htp.png" style="width:100%;height:auto;">
    	</div>
    	<div  class="row col-sm-12">
    		<img alt="explain" src="../resources/img/colorExplain.png" width="100%" height="auto">
    	</div>
    </div>
    
    <!-- COLOR -->
    <div style="padding-top:5%;" id="menu1">
		  <div class="row">
		    <div class="col-sm-12">
		    	<h3 class="hanna">색채 심리 검사</h3>  
		    </div>
		  </div>
		  <hr>
		  <div class="row">
		    <div class="col-md-4" style="width: 500px;">
		        <div id="colorGraph" style="height: 250px;"></div><br>
			  	<center><button class="btn btn-info" onclick="allColor();">다른 색 정보보기</button></center>
		    </div>
	        <div class="panel panel-warning" style="height:400px;width: 400px;float:left;">
		      <div class="panel-heading colorLabel hanna"></div>
		      <div class="panel-body colorSpecific hanna"></div>
		    </div>
		  </div>
		  <br>
		  	
		  <hr>
		  <div class="row" style="width: 500px; padding-left:100px;">
		  	<div id="allColor"></div>
		  </div>
		  <center><button class="btn btn-warning" onclick="location.href='../analysis/counsel'">상담하기</button></center>
		<hr>
    </div>
    
    <!-- HOUSE -->
    <div style="padding-top:5%;" id="menu2">
		<div class="row">
		    <div class="col-sm-12">
		    	<h3 class="hanna">HTP - 외부와의 소통을 말해주는 ‘집’</h3>  
		    </div>
		  </div>
		  <hr>
		  <div class="row">
		  	<div class="col-md-4" style="width: 500px;" id="showHouse">
		    </div>
		  	<div class="panel panel-warning" style="height:250px;width: 400px;float:left;">
		      <div class="panel-heading hanna" id="htpLabelH"></div>
		      <div class="panel-body hanna" id="htpSpecificH"></div>
		    </div>
		  </div>
		   <center>
		   <button class="btn btn-warning" onclick="javascript:downloadPDF();">상담결과저장</button>
		   <button class="btn btn-warning" onclick="location.href='../analysis/counsel'">상담하기</button></center>
		  <hr>
    </div>
    
    <!-- TREE -->
    <div style="padding-top:5%;" id="menu3">
		<div class="row">
		    <div class="col-sm-12">
		    	<h3 class="hanna">HTP - 아이 자신과 마음 상태를 말해주는 ‘나무’</h3>  
		    </div>
		  </div>
		  <hr>
		  <div class="row">
		  	<div class="col-md-4" style="width: 500px;" id="showTree">
		    </div>
		  	<div class="panel panel-warning" style="height:250px;width: 400px;float:left;">
		      <div class="panel-heading hanna" id="htpLabel">Tree</div>
		      <div class="panel-body hanna" id="htpSpecificT"></div>
		    </div>
		  </div>
		  <center>
		  <button class="btn btn-warning" onclick="javascript:downloadPDF();">상담결과저장</button>
		  <button class="btn btn-warning" onclick="location.href='../analysis/counsel'">상담하기</button></center>
		  <hr>
    </div>
    
    <!-- AVATAR -->
    <div style="padding-top:5%;" id="menu4">
		<div class="row">
		    <div class="col-sm-12">
		    	<h3 class="hanna">HTP - 성격이나 감정, 주변 환경에 대해 말해주는 ‘사람’</h3>  
		    </div>
		  </div>
		  <hr>
		  <div class="row">
		  	<div class="col-md-4" style="width: 500px;">
		  		<div id="showAvatar2" class="showAvatar" style="position: relative;"></div>
		    </div>
		  	<div class="panel panel-warning" style="height:250px;width: 400px;float:left;">
		      <div class="panel-heading hanna" id="htpLabelA"></div>
		      <div class="panel-body hanna" id="htpSpecific4"></div>
		    </div>
		  </div>
		  <br>
		  <hr>
		 <center>
		  <button class="btn btn-warning" onclick="javascript:downloadPDF();">상담결과저장</button>&nbsp;&nbsp;
		  <button class="btn btn-warning" onclick="location.href='../analysis/counsel'">상담하기</button></center>
		  <hr>
    </div>
    
    <!--QUIZ  -->
    <div style="padding-top:5%;" id="menu5">
		<div class="row">
		    <div class="col-sm-12">
		    	<h3 class="hanna">QUIZ</h3>  
		    </div>
		  </div>
		  <hr>
		  <div class="card-deck hanna" id="quizPanel"></div>
		  <hr>
    </div>
    
  </div>
  
</div>


<!--여기까지###########################  -->

</div>

<!--Footer  -->
<div style="position: fixed; bottom:0; width:100%; height: auto;">
<c:import url="../main/mainFooter.jsp"></c:import>
</div>

</body>
</html> 