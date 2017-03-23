<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>동화 진행 화면 - test</title>
	<link rel="stylesheet" href="./../resources/css/demo.css">
	<link rel="stylesheet" href="./../resources/css/pageflip.css">

	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0, minimal-ui">
	
	<script src="./../resources/js/jquery-3.1.1.js"></script>
	<script>
		$(document).ready(function(){
			
			$("myselection").click(function(){
			
				if($("myselection").attr('selnum') == '1'){
					$('#eunjipage').attr("class", "page page-current");
					alert("1번을 선택했습니다.");
				}
				else if($("myselection").attr('selnum') == '2'){
		        	alert("2번을 선택했습니다.");
				}
				else if($("myselection").attr('selnum') == '3'){
		        	alert("3번을 선택했습니다.");
				}
				else if($("myselection").attr('selnum') == '4'){
		        	alert("4번을 선택했습니다.");
				}
		    });
			
			
			init();
			eunjifunc();
			
		});
		
		function init(){
		    $.ajax({
		        url:'sceneLoading',
		        type:'GET',
		        data: {storyNum: 0, sceneNum:0},
		        dataType:'json',
		        success: output,
		        error: function(e){
		            alert(JSON.stringify(e));
		        }
		    });
		}
		
		function output(list){
			$.each(list, function(i, item){
				if(i == 0){
					alert(item.sceneNum);					
				}
				else{
					alert(item.question);
					
					
					/* var str = $('.pageflip').html();
					str += '<div class="page" style="background: #209657 url(\'./../resources/img/scene/';
					str += 'scene05.jpg';
					str += '\') no-repeat center center; background-size: 100%;"></div>';
					
					str += '<div class="page" style="background: #209657 url(\'./../resources/img/scene/';
					str += 'scene06.jpg';
					str += '\') no-repeat center center; background-size: 100%;"></div>';
					
					alert(str);
					
					$('.pageflip').html(str);  */
				}
			});
		}
	</script>
</head>
<body>

<div class="mycontainer">
	
<nav>
  <ul>
    <li><a href="../">홈으로</a></li>
    <li><a href="storyTest">동화진행 - test</a></li>
  </ul>
</nav>

<article>	
	<div class="pageflip">
		<!-- 질문 나오는 부분 -->
		<div class="fixed">
				asdfsdf ${quiz.question } <br><br>	
				<myselection selnum="1">11111 ${quiz.select1 }</my><br>
				<myselection selnum="2">${quiz.select2 }</my><br>
				<myselection selnum="3">${quiz.select3 }</my><br>
				<myselection selnum="4">${quiz.select4 }</my><br>
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

	<div class= "container">
		created by FairyBook
	</div>
</article>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="./../resources/js/pageflip.js"></script>
<script src="./../resources/js/demo.js"></script>

</div>
</body>
</html>