<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">
 <style>
	  .bg-1 { 
	    background-color: #1abc9c; /* Green */
	    color: #ffffff;
	    margin-top: 8%;
		}
		
		.container-fluid {//패딩
		    padding-top: 50px;
		    padding-bottom: 50px;
		}
		.navbar {
		    padding-top: 15px;
		    padding-bottom: 15px;
		    border: 0;
		    border-radius: 0;
		    margin-bottom: 0;
		    font-size: 12px;
		    letter-spacing: 5px;
		}
		
		.navbar-nav li a:hover {
		    color: #1abc9c !important;
		}
		.bg-4 { 
		    background-color: #2f2f2f;
		    color: #ffffff;
		}
	</style>
<!--적용 자바스크립트와 스타일  -->
<link rel="stylesheet" href="../resources/css/joinForm.css">
<script>
$(document).ready(function() {
	$('#findId').on('click', findId);
	$('#findPW').on('click', findPW);
});

function findId() {
	var email = $('#toFindId').val();
	
	$.ajax({
		url : 'findId',
		type : 'POST',
		data : {
			email : email
		},
		dataType: 'text',
		success : function(text) {
			
			if(text.length==0){
				alert('입력하신 내용으로는 회원정보가 존재하지 않습니다.');
			}
				else{
				alert('귀하의 아이디는 '+text+'입니다.');
			}
		},
		error : function() {
			alert(JSON.stringify(e));
		}
	});
}

function findPW(){
	var id = $('#myId').val();
	var email = $('#toFindPW').val();
	
	$.ajax({
		url : '../analysis/findPW',
		type : 'POST',
		data : {
			id : id,
			email : email
		},
		dataType: 'text',
		success : function(text) {
			
			if(text.length==0){
				alert('입력하신 내용으로는 회원정보가 존재하지 않습니다.');
			}
				else{
				alert('귀하의 이메일로 비밀번호가 전송되었습니다.');
			}
		},
		error : function() {
			alert(JSON.stringify(e));
		}
	});
}



</script>

<title>ID/비밀번호 찾기</title>

<body data-spy="scroll" data-target=".navbar" data-offset="50">



<nav class="navbar-fixed-top">
<div style="background-image: url('../resources/image/icon/banner.png');width: 100%;height: 100px;">
 <center><a href="../"><img src="../resources/image/icon/bannertitle.png" style="margin-top: 15px;margin-right: 17px"></a></center>
</div>
</nav>



<div id="under" style="text-align: center; margin: auto;">
<div style="text-align: center; margin: auto;"><img src="../resources/img/account/findInfo.png" style="width: 300px;height: 50px;"></div>
<br>
<p>1. 아이디 찾기 (이메일과 매치되는 아이디를 바로 알려드립니다.)</p>
<table style="margin: auto;">
<tr>
<th style="text-align: left; width: 180px;">가입시 입력한 이메일</th>
<td><input type="text" id="toFindId" class="form-control" style="width: 250px;"></td>
</tr>
<tr style="height: 10px;"></tr>
<tr><td colspan="2" style="text-align: right;">
<input type="button" value="아이디 찾기" id="findId" class="btn btn-success"></td>
</tr>
</table>
<br>
<p>2. 비밀번호 찾기 (이메일로 비밀번호가 전송됩니다.)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<table style="margin:auto;">
<tr>
<th style="text-align: left; width: 180px;">아이디</th>
<td><input type="text" id="myId" class="form-control" style="width: 250px;"></td>
</tr>
<tr style="height: 3px;"></tr>
<tr>
<th style="text-align: left; width: 180px;">가입시 입력한 이메일</th>
<td><input type="text" id="toFindPW"  class="form-control" style="width:250px;"></td>
</tr>
<tr style="height: 10px;"></tr>
<tr><td colspan="2" style="text-align: right;">
<input type="button" value="비밀번호 찾기" id="findPW" class="btn btn-success"></td></tr>
</table>
<br>
<div class="alert alert-info">
<img src="../resources/image/warn.png" width="25px" height="25px">&nbsp;&nbsp;  위 방법으로 아이디 또는 비밀번호 찾기가 잘 되지 않을 경우 <strong>fairybook@gmail.com</strong> 으로 이메일을 보내주시면 운영진이 도와드리겠습니다.
</div>
<a href="../"><img src="../resources/img/account/tomainbutton.png"></a>&nbsp;
<a href="login"><img src="../resources/img/account/loginbutton.png"></a>
</div>
<!--Add a navar  -->
<nav class="navbar navbar-default navbar-fixed-bottom">
	<footer class="container-fluid bg-4 text-center" 
style="position: absolute;
width: 100%;
height: auto;">
	  <p>Made By <a href="../">FairyBook.com</a></p> 
	</footer>
</nav>
</body>
</html>