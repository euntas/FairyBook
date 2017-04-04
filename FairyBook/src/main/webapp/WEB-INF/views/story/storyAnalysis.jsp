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
	margin-left: 20%;
	z-index: 0;
}
</style>

<script>
/* 색 결과를 위한 정보 */
//색깔 배열
var colorArray = ['red','blue','orange','purple','green'];
//색깔별 count배열
var countArray=[5,8,3,0,4];
//Morris.donut의 data속성에 집어넣을 값
var data = [];
//count가 0인 것을 제외한 color배열
var existColor = [];
var indexD = 0;
for (var i = 0; i < countArray.length; i++) {
	if (countArray[i] != 0) {
		data[indexD] = {label: colorArray[i],value:countArray[i]};
		existColor[indexD++] = colorArray[i];
	}
}

$(function(){
	clear();
	home(); //처음 열면 home화면 on active
	bringAvatar(); //아바타 불러오기
	$('#all').on('click',home);
	$('#color').on('click',menu1);
	$('#htp').on('click',menu2);
	$('#quiz').on('click',menu3);
})

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
		      	  $('#colorLabel').html(row.label);
		    	  $('#colorSpecific').html('설명설명설명');
		        });
		//맨 처음에 선택될 index 지정
		donut.select(1); 
		$('#colorLabel').html(colorArray[1]);
  	 	$('#colorSpecific').html('설명설명설명');
}

function menu1(){
	clear();
	$('#colorGraph').html('');
	$('#menu1').attr('class','on active');
		 Morris.Donut({
		        element: 'colorGraph',
		        data: data,
		        colors: existColor
		      }).on('click', function (i, row) {  //row-i번째 줄의 {label:..,value:..}
		    	  alert(row.label);
		    	  console.log(i, row);
		        });
	
}

function menu2(){
	clear();
	$('#menu2').attr('class','on active');
}

function menu3(){
	clear();
	$('#menu3').attr('class','on active');
}

//내 아바타 가져오기
function bringAvatar(){
	$.ajax({
		url: ''
	});
}

//활성화 tab페이지 초기화
function clear(){
	$('#home,#menu1,#menu2,#menu3').attr('class','');
	$('#home,#menu1,#menu2,#menu3').attr('class','tab-pane fade');
}
</script>

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	
<!--####################여기부터  -->

<div class="container">
<ul class="nav nav-tabs" style="position: fixed;">
    <li class="active"><a data-toggle="tab" href="#home" id="all">전체</a></li>
    <li><a data-toggle="tab" href="#menu1" id="color">심리-색</a></li>
    <li><a data-toggle="tab" href="#menu2" id="htp">심리-HTP</a></li>
    <li><a data-toggle="tab" href="#menu3" id="quiz">퀴즈</a></li>
  </ul>

  <div class="tab-content" style="padding-top: 40px;">
    <div id="home">
    	<div class="row col-sm-12"><h3>종합 결과</h3><hr></div>
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
	        <div class="panel panel-default" style="height:250px;width: 400px;float:left;">
		      <div class="panel-heading" id="colorLabel"></div>
		      <div class="panel-body" id="colorSpecific"></div>
		    </div>
		  </div>
		  <hr>
		  <div class="row">
		    <div class="col-sm-12">
		    	<h5>심리-HTP</h5>  
		    </div>
		  </div>
		  <hr>
		  <div class="row">
		  	<div id="myAvatar"></div>
		  	<img alt="myAvatar" src="../resources/img/avatar/face/face01.png" id="face">
		  </div>
    </div>
    
    <div id="menu1">
		<div class="row">
		    <div class="col-sm-12">
		    	<h3>심리-색</h3>  
		    </div>
		  </div>
		  <hr>
		  <div class="row">
		    <div class="col-md-4">
		        <div id="colorGraph" style="height: 250px;"></div>
		    </div>
		  </div>
    </div>
    
    <div id="menu2">
      <h3>심리-HTP</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    
    <div id="menu3">
      <h3>퀴즈</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
    </div>
    
  </div>
  
  
</div>




<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 
