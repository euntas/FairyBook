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

#allColorAnalysis{
	width: 700px;
	height: 500px;
	padding: 10%;
	background-color:rgb(255,255,196);
}
img[id*='face']{
	z-index: -1;
}
img[id*='body']{
	z-index: -2;
}
img[id*='hair']{
	z-index: -3;
}
img[id*='roof']{
	z-index: -1;
}
img[id*='wall']{
	z-index: -2;
}
area{
display:block;border:1px solid black;
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
});

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
		input += '<li><a data-toggle="pill" onclick="eachColor(\''+i+'\')">'+c+'</a></li>';
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

function showHouse(house){
	var input = '';
	
	for (var i = 0; i < house.length; i++) {
		if(i == house.length -1){
			input += '<img src="'+house[i].path+'" id="'+house[i].name+'" style="position: absolute;" usemap="#houseMap"/>';
		}else{
			input += '<img src="'+house[i].path+'" id="'+house[i].name+'" style="position: absolute;"/>';
		}
		analysis[i] = house[i].analysis;
		//가져오는 순서 - 지붕, 창문, 굴뚝, 벽, 문
	}
	
	input += '<map name="houseMap">';
	
	for (var i = 0; i < house.length; i++) {
		var strName = house[i].name;
		if(strName.indexOf('roof') != -1){
			input += '<area shape="poly" coords="97,83,50,175,250,175,200,87" onclick="housePoint(\'' + i + '\')" target="_blank">';
		}
		if(strName.indexOf('wall') != -1){
			input += '<area shape="rect" coords="50,154,75,300" onclick="housePoint(\'' + i + '\')" target="_blank">';
			input += '<area shape="rect" coords="214,146,245,300" onclick="housePoint(\'' + i + '\')" target="_blank">';
		} 
		if(strName.indexOf('chimney') != -1){
	         input += '<area shape="rect" coords="162,60,196,88" onclick="housePoint(\'' + i + '\')" target="_blank">';
		}
		if(strName.indexOf('door01') != -1){
			input += '<area shape="rect" coords="180,252,208,300" onclick="housePoint(\'' + i + '\')" target="_blank">';
		}
		if(strName.indexOf('door02') != -1 || strName.indexOf('door04') != -1){
			input += '<area shape="rect" coords="165,218,211,300" onclick="housePoint(\'' + i + '\')" target="_blank">';
		}
		if(strName.indexOf('door03') != -1){
			input += '<area shape="rect" coords="157,175,230,300" onclick="housePoint(\'' + i + '\')" target="_blank">';
		}
		if(strName.indexOf('door05') != -1){
			input += '<area shape="rect" coords="84,217,215,300" onclick="housePoint(\'' + i + '\')" target="_blank">';
		}
		if(strName.indexOf('window01') != -1){
			input += '<area shape="rect" coords="130,177,172,212" onclick="housePoint(\'' + i + '\')" target="_blank">';
		}
		if(strName.indexOf('window02') != -1){
			input += '<area shape="rect" coords="130,102,170,133" onclick="housePoint(\'' + i + '\')" target="_blank">';
		}
		if(strName.indexOf('window03') != -1){
			input += '<area shape="rect" coords="57,181,210,215" onclick="housePoint(\'' + i + '\')" target="_blank">';
		}
		if(strName.indexOf('window04') != -1){
			input += '<area shape="rect" coords="74,181,131,212" onclick="housePoint(\'' + i + '\')" target="_blank">';
		}
	}//for
	
	$('#showHouse').html(input);
}

function housePoint(i){
	console.log(analysis[i]);
	alert(analysis[i]);
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


function showAvatar(r){
   var input = '';
   
   for (var i = 0; i < r.length; i++) {
		if(i == r.length -1){
      		input += '<img src="'+r[i].path+'" id="'+r[i].name+'" style="position: absolute;" usemap="#002"/>';
		}else{
      		input += '<img src="'+r[i].path+'" id="'+r[i].name+'" style="position: absolute;"/>';
		}
		analysis[i] = r[i].analysis;
   }//for
   
   //항목 누르는 곳 설정
   input += '<map name="002">';
   
   for(var j=0; j<r.length; j++){
      var strName = r[j].name;
      if(strName.indexOf('hair') != -1){
         input += '<area shape="rect" coords="80,40,220,70" onclick="point(\'' + j + '\')" target="_blank">';
      }
      if(strName.indexOf('face') != -1){
         input += '<area shape="poly" coords="83,136,104,141,98,160" onclick="point(\'' + j + '\')" target="_blank">';
         input += '<area shape="poly" coords="190,142,218,142,204,161" onclick="point(\'' + j + '\')" target="_blank">';
      }
      if(strName.indexOf('eye') != -1){
         input += '<area shape="rect" coords="102,104,126,124" onclick="point(\'' + j + '\')" target="_blank">';
         input += '<area shape="rect" coords="167,104,201,124" onclick="point(\'' + j + '\')" target="_blank">';
      }
      if(strName.indexOf('nose') != -1){
         input += '<area shape="rect" coords="141,138,160,155" onclick="point(\'' + j + '\')" target="_blank">';
      }
      if(strName.indexOf('mouth') != -1){
         input += '<area shape="rect" coords="123,172,172,187" onclick="point(\'' + j + '\')" target="_blank">';
      }
      if(strName.indexOf('ear') != -1){
    	  input += '<area shape="rect" coords="48,131,66,162" onclick="point(\'' + j + '\')" target="_blank">';
          input += '<area shape="rect" coords="241,131,250,162" onclick="point(\'' + j + '\')" target="_blank">';
      }
      if(strName.indexOf('body') != -1){
    	  input += '<area shape="rect" coords="129,223,172,268" onclick="point(\'' + j + '\')" target="_blank">';
      }
      
   }//for
   input += '</map>';
   
   $('#showAvatar2').html(input);
}

//활성화 tab페이지 초기화
function clear(){
	window.scrollTo(0,0);
	$('#home,#menu1,#menu2,#menu3,#menu4,#menu5').attr('class','');
	$('#home,#menu1,#menu2,#menu3,#menu4,#menu5').attr('class','tab-pane fade');
}

// 각 항목(머리, 얼굴 등) 눌렀을 때 강조
function point(i){
	console.log(analysis[i]);
	alert(analysis[i]);
	$('#htpSpecific4').html('');
	$('#htpSpecific4').html(analysis[i]);
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

</script>

<body data-spy="scroll" data-target=".navbar" data-offset="50" style="height:100%;">

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
    </div>
    
    <!-- COLOR -->
    <div style="padding-top:5%;" id="menu1">
		  <div class="row">
		    <div class="col-sm-12">
		    	<h3 class="hanna">심리-색</h3>  
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
		  <center><button onclick="location.href='../analysis/counsel'">상담하기</button></center>
		<hr>
    </div>
    
    <!-- HOUSE -->
    <div style="padding-top:5%;" id="menu2">
		<div class="row">
		    <div class="col-sm-12">
		    	<h3 class="hanna">심리-HTP-h 외부와의 소통을 말해주는 ‘집’</h3>  
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
		   <center><button onclick="location.href='../analysis/counsel'">상담하기</button></center>
		  <hr>
    </div>
    
    <!-- TREE -->
    <div style="padding-top:5%;" id="menu3">
		<div class="row">
		    <div class="col-sm-12">
		    	<h3 class="hanna">심리-HTP-t 아이 자신과 마음 상태를 말해주는 ‘나무’</h3>  
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
		  <center><button onclick="location.href='../analysis/counsel'">상담하기</button></center>
		  <hr>
    </div>
    
    <!-- AVATAR -->
    <div style="padding-top:5%;" id="menu4">
		<div class="row">
		    <div class="col-sm-12">
		    	<h3 class="hanna">심리-HTP-p 성격이나 감정, 주변 환경에 대해 말해주는 ‘사람’</h3>  
		    </div>
		  </div>
		  <hr>
		  <div class="row">
		  	<div class="col-md-4" style="width: 500px;">
		  		<div id="showAvatar2" class="showAvatar" style="position: relative;"></div>
		    </div>
		  	<div class="panel panel-warning" style="height:250px;width: 400px;float:left;">
		      <div class="panel-heading hanna" id="htpLabel">htp</div>
		      <div class="panel-body hanna" id="htpSpecific4"></div>
		    </div>
		  </div>
		  <center><button onclick="location.href='../analysis/counsel'">상담하기</button></center>
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
<div style="position: absolute;width: 100%;height: 30%;">
<c:import url="../main/mainFooter.jsp"></c:import>
</div>

</body>
</html> 
