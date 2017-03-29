<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>FairyBook</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--적용 자바스크립트와 스타일  -->

<!-- 로켓페이지플립 사용 위한 파일 css -->
<link rel="stylesheet" href="./../resources/css/demo.css">
<link rel="stylesheet" href="./../resources/css/pageflip.css">

<script>
		$(document).ready(function(){
			// 가장 처음 씬과 문제를 가져온다.
			init();
		});
		
		function init(){
		    $.ajax({
		        url:'sceneLoading',
		        type:'GET',
		        data: {storyNum: 0, sceneNum: pageflip.options.current},
		        dataType:'json',
		        success: function(scene){
		        	currentScene = scene;
					alert('씬번호: ' + currentScene.sceneNum);	

					//selectiondetail 테스트용
					 $.ajax({
					        url:'saveSD',
					        type:'GET',
					        data: {sceneNum: pageflip.options.current},
					        dataType:'json',
					        success: function(){
					        	alert('selectionDetail 생성');
					        },
					        error: function(e){
					            alert(JSON.stringify(e));
					        }
					    });
					//여기까지

					
					// selectionDetail에 첫번째 페이지를 인서트해주기.

		        },
		        error: function(e){
		            alert(JSON.stringify(e));
		        }
		    });
		    
		    quizLoading();

		}

</script>

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">

<!--####################여기부터  -->

<div class="pageflip">
	<!-- 질문 버튼 나오는 부분 -->
	<div id="divForQuizBtn" class="fixed2">
	</div>

	<!-- 실제 질문 내용 나오는 부분 -->
	<div id="divForQuiz" class="fixed">
	</div>
	
	<!-- 책 내용 부분 -->
	<div class="page page-current" style="background: #209657 url('./../resources/img/scene/scene01.jpg') no-repeat center center; background-size: 100%;">
	</div>
	<div class="page" style="background: #0387A5 url('./../resources/img/scene/scene04.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #A5C8CB url('./../resources/img/scene/scene05.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene06.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene07.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene08.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene09.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene10.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene11.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene12.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene13.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene14.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene15.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene16.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene17.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene18.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene45.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene46.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #82BDC4 url('./../resources/img/5.jpg') no-repeat center center">
	</div>
</div>


<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>


<!-- 로켓페이지플립 사용 위한 파일 js -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="./../resources/js/pageflip.js"></script>
<script src="./../resources/js/demo.js"></script>

<!-- 다음 버튼 활성화/비활성화 -->
<script>
</script>
</body>
</html> 
