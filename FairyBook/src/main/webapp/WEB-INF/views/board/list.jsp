<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>BoardList</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--적용 자바스크립트와 스타일  -->
<script>
	$(function(){
		bring();
	});
	
	function bring(){
		$.ajax({
			url:'list',
			type: 'GET',
			dataType: 'json',
			success: output,
			error: function(e){
				alert(JSON.stringify(e));
			}
		});
	}
	
	function output(list){
		var input='<table class="table table-striped table-hover">';
		input+='<thead><tr>';
		input+='<td>글번호</td><td>제목</td><td>작성자</td><td>조회수</td><td>작성일</td>';
		input+='</tr></thead>';
		
		$.each(list, function(i,b){
			input+='<tr>';
			input+='<td>'+b.boardnum+'</td>';
			input+='<td>'+b.title+'</td>';
			input+='<td>'+b.id+'</td>';
			input+='<td>'+b.hit+'</td>';
			input+='<td>'+b.inputdate+'</td>';
			input+='</tr>';
		});
		$('#list').html(input);
	}
</script>

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">

<!--####################여기부터  -->
<div class="container">
<div id="list"></div>
<a href="board" class="btn btn-default">글쓰기</a>
<!--페이지 이동 버튼  -->
<div class="text-center">
	<ul class="pagination">
		<li><a href="">1</a></li>
		<li><a href="">2</a></li>
		<li><a href="">3</a></li>
		<li><a href="">4</a></li>
		<li><a href="">5</a></li>
	</ul>
</div>
</div>



<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 

