<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담메일보내기</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../resources/js/jquery-3.1.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('#send').on('click', sendMail123);
	});

	function sendMail123() {

		var receiver = $('#receiver').val();
		var title = $('#title').val();
		var content = $('#content').val();
		var fileValue = $("#file").val().split("\\");
		var fileName = fileValue[fileValue.length-1];
	
	
		$.ajax({
			url : 'sendMail',
			type : 'POST',
			data : {
				receiver : receiver,
				title : title,
				content : content,
				fileName : fileName
			},
			success : function(data) {
				alert('전송되었습니다.');

				window.open("about:blank","_self").close();
			},
			error : function(e) {
				alert(JSON.stringify(e));
			}
		});
		
	}
	
</script>
</head>
<body style='text-align: center; background-color: #ffff80;'>
<form action="sendMail" id="mailForm" method="post" enctype="multipart/form-data">
<br>
	<table style="margin: auto;">
		<tr>
			<th style="width: 80px;">수신인</th>
			<td><input type="text" id="receiver" name="receiver"
				readonly="readonly" value="${emailAddress }" style="width: 280px;"
				class="form-control"></td>
		</tr>

		<tr>
			<th>제&nbsp;&nbsp;&nbsp;목</th>
			<td><input type="text" id="title" name="title"
				style="width: 280px;"
				class="form-control"></td>
		</tr>
		
		<tr>
			<th colspan="2" style="text-align: left; height: 30px;">내&nbsp;&nbsp;&nbsp; 용
			
		</tr>
		<tr>
			<td colspan="2"><textarea rows="18" cols="50" id="content" class="form-control"></textarea></td>
		</tr>
		<tr style="height: 10px;"></tr>
		<tr>
		 <th>파일</th><td><input type="file" id="file"></td>
		</tr>
		<tr style="height: 10px;"></tr>
		<tr>
			<td colspan="2" style="height: 50px;"><input type="button" value="보내기" id="send" class="btn btn-info">&nbsp;<input
				type="button" value="취소하기" onclick="javascript:window.close()" class="btn btn-warning"></td>
		</tr>

	</table>
</form>
</body>

</html>