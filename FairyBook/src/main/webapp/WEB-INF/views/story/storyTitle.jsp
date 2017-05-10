<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>동화표지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">

<!--적용 자바스크립트와 스타일  -->
<script>
/* $(document).ready(function(){
	//myselection 테스트용
	  $.ajax({
	        url:'insertMySelection',
	        type:'GET',
	        dataType:'json',
	        success: function(){
	        	alert('myselection 생성');
	        	 $.ajax({
	 		        url:'getSelectionNum',
	 		        type:'GET',
	 		        dataType:'json',
	 		        success: function(){
	 		        	alert('getSelectionNum 가져오기');
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
	//여기까지 하고 끝낼거야?
	
	//getSelectionNum 테스트용
		
	
	
	
}); */

</script>

<script>
	$(function(){
		$('#start').on('click',function(){
			location.href='storyStart?storyNum='+$('#storyNum').val();
		})
	})
</script>

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:15%;;margin-top: 7%;">

<!--####################여기부터  -->

<!--선택한 동화의  storyNum  -->
<input type="hidden" id="storyNum" value="${currentStoryNum}">

<div class="text-center">
<c:if test="${currentStoryNum == 1}">
<img alt="title" src="./../resources/image/hansel.jpg" style="height:500px;"><br><br>
</c:if>
<c:if test="${currentStoryNum == 2}">
<img alt="title" src="./../resources/image/snowwhitetitle.jpg" style="height:500px;"><br><br>
</c:if>
<button type="button" class="btn btn-primary btn-lg" id="start">Start</button>
</div>

<!--여기까지###########################  -->

</div>
<br><br>
<div style="position: fixed;
bottom:0;
width: 100%;
height: auto;">
<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>
</div>
</body>
</html> 
