<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>ReadBoard</title>
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
		$('#list').on('click',function(){
			history.go(-1);
		});
		$('#deleteB').on('click',deleteB);
		$('#updateB').on('click',updateB);
	});
	
	function deleteB(){
		if(confirm('삭제하시겠습니까?')){
			location.href="delete?boardnum="+$('#boardnum').val();
		}
	}
	
	function updateB(){
		location.href="update?boardnum="+$('#boardnum').val();
	}
</script>



<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">

<!--####################여기부터  -->

<div class="w3-panel">
<form class="form-horizontal">
<input type="hidden" id="boardnum" value="${board.boardnum}">
	<div class="form-group">
    	<label class="col-sm-2 control-label">제목 </label>
    	<label class="control-label">${board.title}</label>
  	</div>
	<div class="form-group">
    	<label class="col-sm-2 control-label">작성자</label>
    	<label class="control-label">${board.id}</label>
  	</div>
	<div class="form-group">
    	<label class="col-sm-2 control-label">작성일</label>
    	<label class="control-label">${board.inputdate}</label>
  	</div>
	<div class="form-group">
    	<label class="col-sm-2 control-label">조회수</label>
    	<label class="control-label">${board.hit}</label>
  	</div>
    <textarea id="content" class="form-control" style="height:300px" value="${board.content}" readonly="readonly">${board.content}</textarea>
	<div class="form-group w3-margin-top w3-margin-bottom">
    	<label class="col-sm-2 control-label">첨부파일</label>
   		<div class="col-sm-5">
    	<input id="file" type="file">
    	</div>
  	</div>
    <div class="w3-section">
      <a class="w3-button" id="list">목록 </a> 
    <c:if test="${loginUser.id == board.id}">
      <a class="w3-button w3-red w3-right" id="deleteB">삭제  <i class="fa fa-remove"></i></a>
      <a class="w3-button w3-right" id="updateB">수정  <i class="fa fa-paper-plane"></i></a> 
    </c:if>
    </div>   
</form> 
</div>


<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 
