<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>UpdateForm</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--적용 자바스크립트와 스타일  -->
<script src="//cloud.tinymce.com/stable/tinymce.min.js"></script>
<script>
tinyMCE.init({ 
	selector: "textarea"
});
</script>
<script>
	$(function(){
		$('#cancel').on('click',function(){
			history.go(-1);
		});		
		$('#send').on('click',function(){
			tinyMCE.triggerSave();
			var id = $('#id').val();
			var boardnum = $('#boardnum').val();
			var title = $('#title').val();
			var content = tinyMCE.get("content").getContent();
			console.log(content);
			if (title.length == 0) {
				alert('제목을 입력하세요.');
				return;
			}
			if(content.length == 0){
				alert('내용을 입력하세요.');
				return;
			}
			$.ajax({
				url:'update',
				type:'post',
				data: {title:title, content:content,id:id,boardnum:boardnum},
				success: function(){
					location.href="read?boardnum="+$('#boardnum').val();
				},
				error: function(e){
					alert(JSON.stringify(e));
				}
			});
		});
	});
</script>

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
<!--####################여기부터  -->

<div class="w3-panel">
<form class="form-horizontal">
	<div class="form-group">
    	<label class="col-sm-2 control-label">글번호</label>
    <div class="col-sm-8">
    	<label class="col-sm-1 control-label">${board.boardnum}</label>
    	<input class="form-control" id="boardnum" type="hidden" value="${board.boardnum}">
    	<input class="form-control" id="id" type="hidden" value="${board.id}">
    </div>
  	</div>
	<div class="form-group">
    	<label class="col-sm-2 control-label">Title</label>
    <div class="col-sm-8">
    	<input class="form-control" id="title" type="text" value="${board.title}">
    </div>
  	</div>
    <textarea id="content" class="form-control" style="height:300px">${board.content}</textarea>
	<div class="form-group w3-margin-top w3-margin-bottom">
    	<label class="col-sm-2 control-label">첨부파일</label>
   		<div class="col-sm-5">
    	<input id="file" type="file">
    	</div>
  	</div>
    <div class="w3-section">
      <a class="w3-button w3-red" id="cancel">Cancel  <i class="fa fa-remove"></i></a>
      <a class="w3-button w3-right" id="send">Send  <i class="fa fa-paper-plane"></i></a> 
    </div>   
</form> 
</div>


<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 