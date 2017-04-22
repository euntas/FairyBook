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
		/*게시글  */
		$('#list').on('click',function(){
			location.href="backToList";
		});
		$('#deleteB').on('click',deleteB);
		$('#updateB').on('click',updateB);
		
		/* 리플 */
		replyList();
		$('#replyInsert').on('click',replyInsert);
	});
	
	//게시글 삭제
	function deleteB(){
		if(confirm('삭제하시겠습니까?')){
			location.href="delete?boardnum="+$('#pboardnum').val();
		}
	}
	
	//게시글 수정
	function updateB(){
		location.href="update?boardnum="+$('#pboardnum').val();
	}
	
	//리플 작성
	function replyInsert(){
		var text = $('#replyText').val();
		replyCheck(text);
		var id = $('#rid').val();
		var boardnum = $('#rboardnum').val();
		$.ajax({
			url:'replyWrite',
			type:'POST',
			data: {text:text,id:id,boardnum:boardnum},
			success: replyList,
			error: function(e){
				alert(JSON.stringify(e));
			}
		});
	}
	//리플 검사
	function replyCheck(t){
		if (t.length == 0) {
			alert('댓글을 입력해주세요.');
		}
	}
	
	//리플 리스트 가져오기
	function replyList(){
		var text = $('#replyText').val('');
		var num = $('#pboardnum').val();
		$.ajax({
			url: 'replyList',
			type: 'GET',
			data: {boardnum: num},
			dataType:'json',
			success: replyOutput,
			error: function(e){
				alert(JSON.stringify(e));
			}
		});
	}
	
	//리플 리스트 성공시 아웃풋
	function replyOutput(reply){
		$('#replyList').html('');
		var input = '<table class="table">';
		var loginId = '${loginUser.id}';
		$.each(reply,function(i,r){
			input += '<tr class="warning">';
			input += '<td width="10%" style="text-align:center;">'+r.id+'</td>';
			input += '<td width="60%">'+r.text+'</td>';
			input += '<td>'+r.inputdate+'</td>';
			if (loginId == r.id) {
				input+='<td><button type="buton" class="btn btn-warning btn-xs replyUpdate" num="'+r.replynum+'">수정';
				input+='<button type="buton" class="btn btn-danger btn-xs replyDelete" num="'+r.replynum+'">삭제</td>';
			}
			input += '</tr>'
		});
		input+='</table>';
		$('#replyList').html(input);
		$('.replyUpdate').on('click',replyUpdate);
		$('.replyDelete').on('click',replyDelete);
	}
	
	//리플 삭제
	function replyDelete(){
		var rnum = $(this).attr('num');
		console.log(rnum);
		var loginId = '${loginUser.id}';
		if(confirm('댓글을 삭제하시겠습니까?')){
			$.ajax({
				url:'replydelete',
				type:'GET',
				data:{replynum:rnum,id:loginId},
				success: replyList,
				error: function(e){
					alert(JSON.stringify(e));
				}
			});
		}
		console.log(rnum);
	}
	//리플 수정
	function replyUpdate(){
		var rnum = $(this).attr('num');
		console.log('rnum:'+rnum);
		var bnum = $('#pboardnum').val();
		console.log(bnum);
		$.ajax({
			url: 'replyList',
			type: 'GET',
			data: {boardnum: bnum},
			dataType:'json',
			success: function(reply){
				$('#replyList').html('');
				var input = '<table class="table">';
				var loginId = '${loginUser.id}';
				$.each(reply,function(i,r){
					input += '<tr class="warning">';
					input += '<td width="10%" style="text-align:center;">'+r.id+'</td>';
					if(rnum != r.replynum){
						input += '<td width="60%">'+r.text+'</td>';
						input += '<td>'+r.inputdate+'</td>';
					}else{
						input += '<td width="60%"><input type="text" value="'+r.text+'" id="newtext'+r.replynum+'"></td>';
						input += '<td>'+r.inputdate+'</td>';
						input+='<td><button type="buton" class="btn btn-success btn-xs updateOk" num="'+r.replynum+'">확인';
						input+='<button type="buton" class="btn btn-danger btn-xs updateCancel" num="'+r.replynum+'">취소</td>';
					}
					input += '</tr>'
				});
				input+='</table>';
				$('#replyList').html(input);
				$('.updateOk').on('click',updateOk);
				$('.updateCancel').on('click',updateCancel);
			},
			error: function(e){
				alert(JSON.stringify(e));
			}
		});
	}
	
	//수정 확인
	function updateOk(){
		var rnum = $(this).attr('num');
		var text = $('#newtext'+rnum).val();
		replyCheck(text);
		var loginId = '${loginUser.id}';
		console.log(rnum+text+loginId);
		$.ajax({
			url:'replyUpdate',
			type:'POST',
			data: {id:loginId,replynum:rnum,text:text},
			success: replyList,
			error: function(e){
				alert(JSON.stringify(e));
			}
		});
	}
	//수정취소
	function updateCancel(){
		replyList();
	}
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
<input type="hidden" id="pboardnum" value="${board.boardnum}">
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
    <div class="w3-section">
      <a class="w3-button" id="list">목록 </a> 
    <c:if test="${loginUser.id == board.id}">
      <a class="w3-button w3-red w3-right" id="deleteB">삭제  <i class="fa fa-remove"></i></a>
      <a class="w3-button w3-right" id="updateB">수정  <i class="fa fa-paper-plane"></i></a> 
    </c:if>
    </div>   
</form> 
<br>



<!-- reply -->
<center>
	<!-- 댓글작성 -->
    <input type="hidden" id="rid" value="${loginUser.id}">
    <input type="hidden" name="boardnum" id="rboardnum" value="${board.boardnum}">
    <div class="input-group col-sm-10">
	    <input type="text" class="form-control" placeholder="댓글을 입력하세요" name="text" id="replyText">
	    <div class="input-group-btn">
	      <button class="btn btn-info" type="button" id="replyInsert">
			입력
	      </button>
	    </div>
	  </div>
	  <br>
<!-- 댓글목록 -->   
	<span id="replyList" style="width:50%"></span> 
    
    
    
</center>


</div>


<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 
