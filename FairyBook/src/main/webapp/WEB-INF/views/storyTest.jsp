<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>동화 진행 화면 - test</title>
	<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- 로켓페이지플립 사용 위한 파일 -->
	<link rel="stylesheet" href="./../resources/css/demo.css">
	<link rel="stylesheet" href="./../resources/css/pageflip.css">

	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0, minimal-ui">
	
	<script src="./../resources/js/jquery-3.1.1.js"></script>
	
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
	<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><style>
	html,body,h1,h2,h3,h4,h5 {font-family: "RobotoDraft", "Roboto", sans-serif;}
	.w3-bar-block .w3-bar-item{padding:16px}
	.bg-1 { 
		    background-color: rgb(0,147,205); /* Green */
		    color: #ffffff;
		    text-align:center;
			}
	.bg-2 { 
			    background-color: rgb(255,255,70); /* yellow */
			    color: rgb(0,76,112);
			    padding-top: 20px;
			    padding-bottom: 20px;
			    font-variant: small-caps;
			    letter-spacing: 5px;
			}
	img{
		display: -webkit-flex;
	     display: flex; /* 플렉스박스로 지정 */
	     -webkit-align-items: center;
	     align-items: center; /* 세로 중앙정렬 */
	  	-webkit-justify-content: center;
	     justify-content: center; /* 가로 중앙정렬 */
	}
	.navbar-nav li a:hover {
			    color: #1abc9c !important;
			}
	#under{
		padding-top:100px;
	}
	.bg-4 { 
			    background-color: #2f2f2f;
			    color: #ffffff;
			}
	</style>

	<script>
		$(document).ready(function(){

			var currentScene, currentQuiz;
			
			init();
		});
		
		
		function init(){
		    $.ajax({
		        url:'sceneLoading',
		        type:'GET',
		        data: {storyNum: 0, sceneNum: pageflip.options.current},
		        dataType:'json',
		        success: outputForScene,
		        error: function(e){
		        //    alert(JSON.stringify(e));
		        }
		    });
		    
		    $.ajax({
		        url:'quizLoading',
		        type:'GET',
		        dataType:'json',
		        data: {storyNum: 0, sceneNum: pageflip.options.current},
		        success: outputForQuiz,
		        error: function(e){
		         //   alert(JSON.stringify(e));
		        }
		    });
		}
		
		function outputForScene(scene){
			currentScene = scene;
			//alert('씬번호: ' + currentScene.sceneNum);					
		}
		
		function outputForQuiz(quiz){
			currentQuiz = quiz;
			//alert('퀴즈 : ' + currentQuiz.quizNum );
			
			$.ajax({
		        url:'quizValidCheck',
		        type:'GET',
		        dataType:'json',
		        data: {storyNum: ${ currentStoryNum}, sceneNum: pageflip.options.current },
		        success: outputForQuizValidCheck,
		        error: function(e){
		           // alert(JSON.stringify(e));
		        }
		    }); 
		}
		
		function outputForQuizValidCheck(check){
			//alert('check ' + check);
			if(check == 0){
				//alert('이 씬에서 퀴즈는 없습니다.');
			}
			
			else if(check == 1){
				//alert('퀴즈를 활성화 합니다.');
				
				var str = currentQuiz.question +"<br><br>";
				str += "<myselection selnum='1'>" + currentQuiz.select1 + "</myselection><br>";
				str += "<myselection selnum='2'>" + currentQuiz.select2 + "</myselection><br>";
				str += "<myselection selnum='3'>" + currentQuiz.select3 + "</myselection><br>";
				str += "<myselection selnum='4'>" + currentQuiz.select4 + "</myselection><br>";
				
				$("#divForQuiz").html(str); 
				
				$("myselection").click(function(){
					
					if($(this).attr('selnum') == '1'){
						//alert("1번을 선택했습니다.");
					}
					else if($(this).attr('selnum') == '2'){
			        	//alert("2번을 선택했습니다.");
					}
					else if($(this).attr('selnum') == '3'){
			        	//alert("3번을 선택했습니다.");
					}
					else if($(this).attr('selnum') == '4'){
			        	//alert("4번을 선택했습니다.");
					}
					
					$.ajax({
				        url:'getNextSceneNum',
				        type:'GET',
				        data: {currentSceneNum: pageflip.options.current, answerNum: $(this).attr('selnum')},
				        dataType: 'json',
				        success: function(nextSceneNum){
				        //	alert('다음은 ' + nextSceneNum + '번 페이지로 이동합니다.');
							pageflip.flip(nextSceneNum);
							
							$.ajax({
						        url:'quizLoading',
						        type:'GET',
						        dataType:'json',
						        data: {storyNum: 0, sceneNum: nextSceneNum},
						        success: outputForQuiz,
						        error: function(e){
						         //   alert(JSON.stringify(e));
						        }
						    });
							
							
				        },
				        error: function(e){
				          //  alert(JSON.stringify(e));
				        }
				    });
			    }); 
			}
		}
	</script>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--배너  -->
<nav class="navbar-fixed-top">
<div class="container-fluid bg-2 text-center">
  <h1>Fairytale Book</h1>
</div>
</nav>

<div id="under">
<!-- Side Navigation -->
<!--로그인하지 않았을 때  -->
<c:if test="${session.id == null }">
<nav class="w3-sidebar w3-bar-block w3-collapse w3-white w3-animate-left w3-card-2" style="z-index:3;width:220px;" id="mySidebar">
  <div class="container-fluid bg-1">
  <h3>Who Am I?</h3>
  <center><img src="./../resources/image/yo.jpg" alt="img" style="width: 150px;" class="img-responsive img-circle" style="display:inline-block;"></center><br><!--circle image  -->
  <button type="button" id="login" class="btn btn-success">LOGIN</button>
  <button type="button" id="join" class="btn btn-warning">JOIN</button>
  <br><br>
  </div>
  <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu" 
  class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align" onclick="document.getElementById('id01').style.display='block'">New Message <i class="w3-padding-left fa fa-pencil"></i></a>
  
  <a href="../menu/storySelect" class="w3-bar-item w3-button"><i class="fa fa-paper-plane w3-padding-right"></i>동화선택</a>
  <a href="#" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>동화감상</a>
</nav>
</c:if>

<!-- Modal that pops up when you click on "New Message" -->
<div id="id01" class="w3-modal" style="z-index:4">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-padding w3-red">
       <span onclick="document.getElementById('id01').style.display='none'"
       class="w3-button w3-red w3-right w3-xxlarge"><i class="fa fa-remove"></i></span>
      <h2>Send Mail</h2>
    </div>
    <div class="w3-panel">
      <label>To</label>
      <input class="w3-input w3-border w3-margin-bottom" type="text">
      <label>From</label>
      <input class="w3-input w3-border w3-margin-bottom" type="text">
      <label>Subject</label>
      <input class="w3-input w3-border w3-margin-bottom" type="text">
      <input class="w3-input w3-border w3-margin-bottom" style="height:150px" placeholder="What's on your mind?">
      <div class="w3-section">
        <a class="w3-button w3-red" onclick="document.getElementById('id01').style.display='none'">Cancel  <i class="fa fa-remove"></i></a>
        <a class="w3-button w3-right" onclick="document.getElementById('id01').style.display='none'">Send  <i class="fa fa-paper-plane"></i></a> 
      </div>    
    </div>
  </div>
</div>

<!-- Overlay effect when opening the side navigation on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="Close Sidemenu" id="myOverlay"></div>

<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	<div class="pageflip">
		<!-- 질문 나오는 부분 -->
		<div id="divForQuiz" class="fixed">
		</div>
		
		<!-- 책 내용 부분 -->
		<div class="page page-current" style="background: #209657 url('./../resources/img/scene/scene01.jpg') no-repeat center center; background-size: 100%;">
		</div>
		<div class="page" style="background: #0387A5 url('./../resources/img/scene/scene04.jpg') no-repeat center center;  background-size: 100%;">
		</div>
		<div class="page" style="background: #A5C8CB url('./../resources/img/scene/scene05.jpg') no-repeat center center;  background-size: 100%;">
		</div>
		<div class="page" id="eunjipage" style="background: #0B0B0B url('./../resources/img/scene/scene06.jpg') no-repeat center center;  background-size: 100%;">
		</div>
		<div class="page" style="background: #82BDC4 url('./../resources/img/5.jpg') no-repeat center center">
		</div>
	</div>
</div>
</div>

<footer class="container-fluid bg-4 text-center">
  <p>Made By <a href=".././">FairyBook.com</a></p> 
</footer>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="./../resources/js/pageflip.js"></script>
<script src="./../resources/js/demo.js"></script>

</body>
</html>