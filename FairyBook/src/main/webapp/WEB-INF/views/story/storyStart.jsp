<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>FairyBook</title>
<meta charset="UTF-8">
<script src="../resources/js/jquery-3.1.1.js"></script>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

적용 자바스크립트와 스타일 -->

<!-- 로켓페이지플립 사용 위한 파일 css -->
<link rel="stylesheet" href="./../resources/css/demo.css">
<link rel="stylesheet" href="./../resources/css/pageflip.css">
 
 <!-- 로켓페이지플립 사용 위한 파일 js -->
<script src="./../resources/js/pageflip.js"></script>
<script src="./../resources/js/demo.js"></script>

<script>
		$(document).ready(function(){
			
			var myWidth = $(window).width();
			var myHeight = $(window).height();
			console.log("width : " + myWidth +" , height : " + myHeight);
			
			//$("#storyStartBody").css("width", myWidth);
			$("#storyStartBody").css("height", myHeight);
			$(".pageflip").css("height", myHeight);
			
			// 가장 처음 씬과 문제를 가져온다.
			var pageNum = pageflip.options.current;
			var myStoryNum = ${currentStoryNum};
			var mySelectionNum =${myselectionNum};
			
			// pageflip.js 페이지에 있는 myStoryNum 변수를 초기화해준다.
			setMyStoryNum(myStoryNum, mySelectionNum);
			
			//기존 진행 중 씬이 있을 경우
			if( ${firstPageNum != 0}){
				console.log('기존 진행중 씬이 있는 경우');
				pageNum = ${firstPageNum};
    		    pageflip.flip(pageNum);
				
			}
			else{
				console.log('기존 진행중 씬이 없는 경우');				
				init(${currentStoryNum}, pageNum);
			}
		});
		
		function init(storyNo, pageNo){
		    $.ajax({
		        url:'sceneLoading',
		        type:'GET',
		        data: {storyNum: storyNo, pageNum: pageNo},
		        dataType:'json',
		        success: function(scene){
		        	currentScene = scene;
					//alert('씬번호: ' + currentScene.sceneNum);
					
					// 첫번째 씬 일 때
					if(pageNo == 0){
						//selectiondetail 테스트용
					// selectionDetail에 첫번째 페이지를 인서트해주기.
						 $.ajax({
						        url:'saveSD',
						        type:'GET',
						        data: {pageNum: pageflip.options.current},
						        dataType:'json',
						        success: function(){
						        },
						        error: function(e){
						        	alert('init 함수 안의 sceneLoadig 안의 success  안의 saveSD 의 실패 ㅎㅎ....');
						            alert(JSON.stringify(e));
						        }
						    });
					    	
						quizLoading();
						
					}

		        },
		        error: function(e){
		            alert(JSON.stringify(e));
		        }
		    });
		    

		}
		

</script>

<body id="storyStartBody">
<%-- <body data-spy="scroll" data-target=".navbar" data-offset="50" >

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;"> --%>

<!--####################여기부터  -->



<!--여기까지###########################  -->





<div class="pageflip">
	<!-- 메인으로 이동 버튼 나오는 부분 -->
	<div id="divForHome">
		<a href="../" >
			<img alt="메인으로..." src="./../resources/img/util/backhome.png" style="top: 70%; right: 50%;">
		</a>
	</div>

	<!-- 질문 버튼 나오는 부분 -->
	<div id="divForQuizBtn" class="fixed2">
	</div>

	<!-- 실제 질문 내용 나오는 부분 -->
	<div id="divForQuiz" class="fixed">
	</div>
	
	<!-- 아바타 그림 나오는 부분 -->
	<div id="showAvatar" class="showAvatar" style="position: absolute; height: 200px; width: 200px; top: 68%;"></div>
	
	<!-- 아바타 내용 나오는 부분 -->
	<div id="divForAvatar" class="myimage">
	</div>
	
	<!-- 책 내용 부분 -->
	
	<!-- 헨젤과 그레텔 -->
	<c:if test="${currentStoryNum == 1}">
		<div class="page page-current" style="background: #209657 url('./../resources/img/scene/scene01.jpg') no-repeat center center; background-size: 100% 90%;">
		</div>
		<c:forEach var="i" begin="4" end="9">		
			<div class="page" style="background: #A5C8CB url('./../resources/img/scene/scene0${i}.jpg') no-repeat center center;  background-size: 100% 90%;">
			</div>
		</c:forEach>
		<c:forEach var="i" begin="10" end="49">		
			<div class="page" style="background: #A5C8CB url('./../resources/img/scene/scene${i}.jpg') no-repeat center center;  background-size: 100% 90%;">
			</div>
		</c:forEach>
	</c:if>
	
	<!-- 백설공주 -->
	<c:if test="${currentStoryNum == 2}">
		<div class="page page-current" style="background: #209657 url('./../resources/img/sceneWhite/scene01.jpg') no-repeat center center; background-size: 100% 90%;">
		</div>
		<c:forEach var="i" begin="2" end="9">		
			<div class="page" style="background: #0387A5 url('./../resources/img/sceneWhite/scene0${i}.jpg') no-repeat center center;  background-size: 100% 90%;">
			</div>
		</c:forEach>
		<c:forEach var="i" begin="10" end="26">		
			<div class="page" style="background: #0387A5 url('./../resources/img/sceneWhite/scene${i}.jpg') no-repeat center center;  background-size: 100% 90%;">
			</div>
		</c:forEach>
	</c:if>
</div>

<!-- 로켓페이지플립 사용 위한 파일 js -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="./../resources/js/pageflip.js"></script>
<script src="./../resources/js/demo.js"></script> 

<!-- 다음 버튼 활성화/비활성화 -->
<script>
</script>



<!-- Go to www.addthis.com/dashboard to customize your tools --> 
<!-- <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-58e45cf68c351e8d"></script>  -->

<%-- <div style="position: absolute;
bottom:0;
width: 100%;
height: auto;">
<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>
</div> --%>

</body>
</html> 
