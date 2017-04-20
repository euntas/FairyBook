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
			var pageNum = pageflip.options.current;
			var myStoryNum = ${currentStoryNum};
			
			// pageflip.js 페이지에 있는 myStoryNum 변수를 초기화해준다.
			setMyStoryNum(myStoryNum);
			
			//기존 진행 중 씬이 있을 경우
			if( ${firstPageNum != 0}){
				alert('기존 진행중 씬이 있는 경우');
				pageNum = ${firstPageNum};
				
				/* // 다음 씬 번호를 이용해 실제 다음 페이지 번호를 읽어온다.
	        	$.ajax({
    		        url:'getPageNum',
    		        type:'GET',
    		        data: {currentSceneNum: sceneNum},
    		        dataType: 'json',
    		        success: function(pageNum){
    		        	alert(pageNum +  '번 페이지로 이동합니다.');
    		        	// 다음페이지로 이동한다.
    		        	pageflip.flip(pageNum);        		        	
    		        },
    		        error: function(e){
    		            alert('start에서 페이지 번호 읽어오기 실패' + JSON.stringify(e));
    		        }
    		    }); */
    		    
    		    pageflip.flip(pageNum);
				
			}
			else{
				alert('기존 진행중 씬이 없는 경우');				
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
	
	<!-- 아바타 내용 나오는 부분 -->
	<div id="divForAvatar" class="myimage">
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
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene21.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene22.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene23.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene24.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene25.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene26.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene27.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene28.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene29.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene30.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene31.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene32.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene33.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene34.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene35.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene36.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene37.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene38.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene39.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene40.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene41.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene44.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene45.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene46.jpg') no-repeat center center;  background-size: 100%;">
	</div>
	<div class="page" style="background: #0B0B0B url('./../resources/img/scene/scene47.jpg') no-repeat center center;  background-size: 100%;">
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

<!-- Go to www.addthis.com/dashboard to customize your tools --> 
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-58e45cf68c351e8d"></script> 
</body>
</html> 
