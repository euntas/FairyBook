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
		bringList(1); //처음엔 page : 1
	});
	
	//게시판 목록 불러오기
	function bringList(page){
		$.ajax({
			url:'list',
			type: 'GET',
			data: {page: page},
			dataType: 'json',
			success: listOutput,
			error: function(e){
				alert(JSON.stringify(e));
			}
		});
	}
	
	//게시판 목록 불러온 결과
	function listOutput(result){
		var list = result.list;
		var input='<table class="table table-striped table-hover">';
		input+='<thead><tr>';
		input+='<td>글번호</td><td>제목</td><td>작성자</td><td>조회수</td><td>작성일</td>';
		input+='</tr></thead>';
		$.each(list, function(i,b){
			input+='<tr class="select" num="'+b.boardnum+'">';
			input+='<td>'+b.boardnum+'</td>';
			input+='<td>'+b.title+'</td>';
			input+='<td>'+b.id+'</td>';
			input+='<td>'+b.hit+'</td>';
			input+='<td>'+b.inputdate+'</td>';
			input+='</tr>';
		});
		
		//page버튼 만들기
		pageOutput(result.pn);
		$('#list').html(input);
		$('.select').on('click',readBoard);
	}
	
	function readBoard(){
		var boardnum = parseInt($(this).attr('num'));
		location.href="read?boardnum="+boardnum;
	}
	
	//페이지 불러온 결과
	function pageOutput(pn){
		var startPage = pn.startPageGroup;
		var endPage = pn.endPageGroup;
		var totalPage = pn.totalPageCount;
		var currentPage = pn.currentPage;
		console.log(typeof currentPage);
		console.log(currentPage);
		var input = '<ul class="pagination">';
		input += '<li id="previousGroup" num="'+currentPage+'"><a>&lt;&lt;</a></li>';
		input += '<li id="previousPage" num="'+currentPage+'"><a>&lt;</a></li>';
		for (var i =startPage; i <= endPage; i++) {
			if (i == currentPage) {
				input += '<li class="pageNum" num="'+i+'"><a style="font-weight: bold;color: black;">'+i+'</a></li>';
			}else{
				input += '<li class="pageNum" num="'+i+'"><a>'+i+'</a></li>';
			}
		}
		input += '<li id="nextPage" num="'+currentPage+'" total="'+totalPage+'"><a>&gt;</a></li>';
		input += '<li id="nextGroup" num="'+currentPage+'"  total="'+totalPage+'"><a>&gt;&gt;</a></li>';
		input += '</ul>';
		$('#pageBtns').html(input);
		
		$('li.pageNum').on('click',pageMove);
		$('#previousGroup').on('click',previousGroup);
		$('#previousPage').on('click',previousPage);
		$('#nextGroup').on('click',nextGroup);
		$('#nextPage').on('click',nextPage);
	}
	
	//페이지 이동
	function pageMove(){
		var page = parseInt($(this).attr('num'));
		bringList(page);
	}
	
	function previousGroup(){
		var page = parseInt($(this).attr('num'));
		if (page <= 5) 
			alert('마지막입니다.');
		else
			bringList(page-5);
	}
	
	function previousPage(){
		var page = parseInt($(this).attr('num'));
		console.log(page);
		console.log(typeof page);
		if (page <= 1) 
			alert('마지막입니다.');
		else
			bringList(page-1);
	}
	
	function nextGroup(){
		var page = parseInt($(this).attr('num'));
		var total = parseInt($(this).attr('total'));
		if (page > total-5) 
			alert('마지막입니다.');
		else
			bringList(page+5);
	}
	
	function nextPage(){
		var page = parseInt($(this).attr('num'));
		var total = parseInt($(this).attr('total'));
		if (page >= total) 
			alert('마지막입니다.');
		else
			bringList(page+1);
	}
</script>

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">

<!--####################여기부터  -->
<div class="container">
	<h3>[게시판]</h3>
	
	<!--게시판 들어올 div  -->
	<div id="list"></div>
	
	<!--글쓰기 버튼  -->
	<a href="board" class="btn btn-default">글쓰기</a>
	
	<!--페이지 이동 버튼  -->
	<div id="pageBtns" class="text-center"></div>
</div>

<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 

