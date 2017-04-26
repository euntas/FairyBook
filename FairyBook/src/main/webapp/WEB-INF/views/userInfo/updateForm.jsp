<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>


<title>회원정보수정</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  
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
		.firstRow{
		width:22%;
		}
	</style>
		<style>
	
		
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
	
	th {font-family: 'Jeju Hallasan', serif;}
	td {font-family: 'Jeju Hallasan', serif;}
	</style>
<!--적용 자바스크립트와 스타일  -->
<link rel="stylesheet" href="../resources/css/joinForm.css">
<script>
  $(document).ready(function(){
	$('#userDelete').on('click',function(){
		if(confirm('정말 삭제 하시겠습니까?'))
			location.href='delete';
	});
	$('#updatesubmit').click(function(){
		
		$( "#updateform" ).submit();
	});
	
	});
</script>
<script>
<c:if test="${errorMsg != null}">
alert('${errorMsg}');
</c:if>


$(document).ready(function() {
	$('#updatesubmit').css('cursor', 'pointer');
	$('#userDelete').css('cursor', 'pointer');
	
	
	
	var cBirth = '<c:out value="${update.cBirth}"/>';
	console.log("ready");
	console.log(cBirth);
	var year = cBirth.substring(0,4);
	var month = cBirth.substring(5,7);
	var date = cBirth.substring(8,10);
	$('#cBirthYear').html(year);
	$('#cBirthMonth').html(month);
	$('#cBirthDate').html(date);
	
	var email = '<c:out value="${update.email}"/>';
	var emails = email.split('@');
	
	$('#email').val(emails[0]);
	$('#email2').val(emails[1]);

	if(emails[1]=="naver.com"||emails[1]=="gmail.com"||
			emails[1]=="hanmail.net"||emails[1]=="nate.com"
			||emails[1]=="yahoo.co.kr"||emails[1]=="dreamwiz.com"){
	$('#emailCom').val(emails[1]);
	}else{
		$('#emailCom').val("직접작성");
		$('#email2').attr("readonly", false);
	}
	
	var phone = '<c:out value="${update.phone}"/>';
	var phones = phone.split('-');
	
	$('#phone1').val(phones[0]);
	$('#phone2').val(phones[1]);
	$('#phone3').val(phones[2]);

});


function formSubmit2() {

	var cNick = $('#cnickName').val();
	var ucNick = '<c:out value="${update.cnickName}"/>';
	
	if(cNick=="") {
		$('#checkedcNick').html('닉네임을 입력해주세요.');
		return false;
	}
	
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test(cNick) == true){
	    alert('공백은 사용할 수 없습니다. ');
	    $('#cnickName').val("");	    
	    $('#cnickName').focus();
	    return false;
	}


	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

	if( special_pattern.test(cNick) == true ){
	    alert('특수문자는 사용할 수 없습니다.');
	    $('#cnickName').val("");	    
	    $('#cnickName').focus();
	    return false;
	}
	if(cNick==ucNick){
		$('#checkedcNick').html('변경되지않았습니다.');
		return false;
	}
	if(cNick.length<2||cNick.length>6){
		$('#checkedcNick').html('닉네임은 두글자 이상 여섯글자 이하로 입력해주세요.');
		return false;
	}
	
	$.ajax({
		url : 'cNickCheck',
		type : 'POST',
		data : {
			cNick : cNick
		},
		dataType: 'text',
		success : function(text) {
			if(text=="true"){
				$('#checkedcNick').html('사용 가능한 닉네임입니다.');
				
				
				}else{
					$('#checkedcNick').html('이미 사용중인 닉네임입니다.');	
	
				}
			
		},
		error : function() {
			alert(JSON.stringify(e));
		}
	});
}

function formSubmit3() {

	var pNick = $('#pnickName').val();
	var upNick = '<c:out value="${update.pnickName}"/>';
	
	if(pNick=="") {
		$('#checkedpNick').html('닉네임을 입력해주세요.');
		return false;
	}
	
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test(pNick) == true){
	    alert('공백은 사용할 수 없습니다. ');
	    $('#pnickName').val("");	    
	    $('#pnickName').focus();
	    return false;
	}


	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

	if( special_pattern.test(pNick) == true ){
	    alert('특수문자는 사용할 수 없습니다.');
	    $('#pnickName').val("");	    
	    $('#pnickName').focus();
	    return false;
	}
	

	
	if(pNick.length<2||pNick.length>6){
		$('#checkedpNick').html('닉네임은 두글자 이상 여섯글자 이하로 입력해주세요.');
		return false;
	}
	
	$.ajax({
		url : 'pNickCheck',
		type : 'POST',
		data : {
			pNick : pNick
		},
		dataType: 'text',
		success : function(text) {
			if(text=="true"){
				$('#checkedpNick').html('사용 가능한 닉네임입니다.');
				
				
				}else{
					$('#checkedpNick').html('이미 사용중인 닉네임입니다.');	
				}
			
		},
		error : function() {
			alert(JSON.stringify(e));
		}
	});
	
	
}

function formSubmit4() {

	var pw = $('#password1').val();
	var upw = '<c:out value="${update.password1}"/>';
	
	if(pw=="") {
		$('#checkedcPw1').html('비밀번호를 입력해주세요.');
		return false;
	}
	
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test(pw) == true){
	    alert('공백은 사용할 수 없습니다. ');
	    $('#password1').val("");	    
	    $('#password1').focus();
	    return false;
	}


	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

	if( special_pattern.test(pw) == true ){
	    alert('특수문자는 사용할 수 없습니다.');
	    $('#password1').val("");	    
	    $('#password1').focus();
	    return false;
	}
	
	if(pw==upw){
		$('#checkedcPw1').html('변경되지않았습니다.');
	}
	
	if(pw.length<8||pw.length>13){
		$('#checkedcPw1').html('비밀번호를 8자리 이상 12자리 이하로 입력해주세요.');
		return false;
	}
	$('#checkedcPw1').html('사용가능한 비밀번호입니다.');
	return true;
}

function formSubmit5() {

	var pw = $('#password1').val();
	var pw2 = $('#password1check').val();
	
	if(pw2=="") {
		$('#checkedcPw2').html('확인비밀번호를 입력해주세요.');
		return false;
	}
	
	if(pw!=pw2){
		$('#checkedcPw2').html('비밀번호와 일치하지 않습니다.');
		return false;
	}
	
	$('#checkedcPw2').html('확인 완료!');
	
	return true;
}

function formSubmit6() {
	var cpw = $('#password1').val();
	var pw = $('#password2').val();
	
	if(pw=="") {
		$('#checkedpPw1').html('비밀번호를 입력해주세요.');
		return false;
	}
	
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test(pw) == true){
	    alert('공백은 사용할 수 없습니다. ');
	    $('#password2').val("");	    
	    $('#password2').focus();
	    return false;
	}


	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

	if( special_pattern.test(pw) == true ){
	    alert('특수문자는 사용할 수 없습니다.');
	    $('#password2').val("");	    
	    $('#password2').focus();
	    return false;
	}
	
	if(pw.length<8||pw.length>13){
		$('#checkedpPw1').html('비밀번호를 8자리 이상 12자리 이하로 입력해주세요.');
		return false;
	}
	
	if(cpw==pw){
		$('#checkedpPw1').html('아이용 비밀번호와 다르게 입력해주세요.');
		return false;
	}
	$('#checkedpPw1').html('사용가능한 비밀번호입니다.');
	return true;
}

function formSubmit7() {
	
	
	var pw = $('#password2').val();
	var pw2 = $('#password2check').val();
	
	
	
	if(pw2=="") {
		$('#checkedpPw2').html('확인비밀번호를 입력해주세요.');
		return false;
	}
	
	if(pw!=pw2){
		$('#checkedpPw2').html('비밀번호와 일치하지 않습니다.');
		return false;
	}
	
	$('#checkedpPw2').html('확인완료!');
	return true;
}

function formSubmit8() {
  	var email = $('#email').val();
  	var email2 = $('#email2').val();
	var email3 = $('#emailCom').val();
	
  	if(email=="") {
		$('#checkedEmail').html('이메일 주소를 입력해주세요.');
		return false;
	}
	
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test(email) == true){
	    alert('공백은 사용할 수 없습니다. ');
	    $('#email').val("");	    
	    $('#email').focus();
	    return false;
	}
	
	$('#checkedEmail').html('사용가능');
	return true;
}

function formSubmit9() {
	  
  	var email = $('#email2').val();
  	var email3 = $('#emailCom').val();
 	
	if(email3!="직접선택"){
		$('#email2').val(email3);
	}
	
	if(email3=="직접작성"){
		$('#email2').attr("readonly", false);
		$('#email2').val("");
		$('#email2').focus();
	}
	
	return true;
}

function formSubmit10() {
  
  	var email = $('#email2').val();
  	
	if(email=="") {
		$('#checkedEmail').html('도메인을 입력해주세요.');
		return false;
	}
  
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test(email) == true){
	    alert('공백은 사용할 수 없습니다. ');
	    $('#email2').val("");	    
	    $('#email2').focus();
	    return false;
	}
	
	$('#checkedEmail').html('사용가능');
	return true;
}


</script>
<script>
function formcheck(){
	var emailCom = $('#emailCom').val();
	var phone1 = $('#phone1').val(); 
	var phone2 = $('#phone2').val();
	var phone3 = $('#phone3').val();
	var address = $('#address').val();
	var cNick = $('#cnickName').val();
	var pNick = $('#pnickName').val();
	var cpw = $('#password1').val();
	var pw = $('#password2').val();
	
	if(emailCom=="선택"){
		alert('이메일을 올바르게 입력해주세요.');
		return false;
	}
	
	if(pNick.length<2||pNick.length>6){
		alert('닉네임은 두글자 이상 여섯글자 이하로 입력해주세요.');
		return false;
	}
	

	
	if(cNick.length<2||cNick.length>6){
		alert('닉네임은 두글자 이상 여섯글자 이하로 입력해주세요.');
		return false;
	}
	
	if(phone1=="선택"||phone2.length<3||phone2.length>5||phone3.length!=4){
		alert('전화번호를 올바르게 입력해주세요.');
		return false;
	}
	
	if(isNaN(phone1)||isNaN(phone2)||isNaN(phone3)){
		alert('전화번호를 올바르게 입력해주세요.');
		return false;
	}
	
	if(address==""){
		alert('주소를 입력해주세요.');
		return false;
	}
	
	if(cpw==pw){
		alert('아이용 비밀번호와 다르게 입력해주세요.');
		return false;
	}
	
	return true;
}
</script>

<body data-spy="scroll" data-target=".navbar" data-offset="50" style="background-image: url('../resources/img/account/back4.png'); background-repeat: no-repeat; background-size: cover;">




<!--배너  -->
<nav class="navbar-fixed-top">
<div style="background-image: url('../resources/image/icon/banner.png');width: 100%;height: 100px;">
 <center><a href="../"><img src="../resources/image/icon/bannertitle.png" style="margin-top: 15px;margin-right: 17px"></a></center>
</div>
</nav>


<div id="under">
	<form enctype="multipart/form-data" action="update" method="post"
		onsubmit="return formcheck()" class="form-inline" id="updateform">

<div style="text-align: center; margin: auto;"><img src="../resources/img/account/update.png" style="width: 300px;height: 50px;"></div>
<br>
		<table style="margin: auto; background-color:#B4E5FF; opacity:20%; border-radius:20px; width:46%;">
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;ID</th>
				<td class="secondRow">
				${update.id}
				<input type="hidden" id="id" name="id" value="${update.id}"></td>
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;닉네임</th>
				<td class="secondRow"><input type="text" id="cnickName"
					name="cnickName" style="width: 220px;" 
					value="${update.cnickName }" onkeyup="formSubmit2()"
					class="form-control">
					<div id="checkedcNick"></div></td>
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th rowspan="3" class="firstRow">&nbsp;&nbsp;&nbsp;아이용 비밀번호</th>
				<td class="secondRow">
				<input type="password" id="password1"
				name="password1" value="${update.password1}"
					style="width: 220px;"
					onkeyup="formSubmit4()"
					class="form-control">
				<div id="checkedcPw1"></div></td>
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<td class="secondRow"><input type="password"
					id="password1check" name="password1check" 
					value="${update.password1}" style="width: 220px;"
					onkeyup="formSubmit5()"
					class="form-control">
				<div id="checkedcPw2"></div></td>
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th rowspan="3" class="firstRow">&nbsp;&nbsp;&nbsp;보호자용 비밀번호</th>
				<td class="secondRow"><input type="password" id="password2"
					name="password2" value="${update.password2 }"
					style="width: 220px;"
					onkeyup="formSubmit6()"
					class="form-control">
				<div id="checkedpPw1"></div></td>
				
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<td class="secondRow"><input type="password"
					id="password2check" name="password2check"
					value="${update.password2 }" style="width: 220px;"
					onkeyup="formSubmit7()"
					class="form-control">
				<div id="checkedpPw2"></div></td>
				
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;아이 이름</th>
				<td class="secondRow"><input type="text" id="cName"
					name="cName" 
					value="${update.cName }"
					style="width: 220px;"
					class="form-control"></td>
				
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;아이 생일</th>
				<td class="secondRow">
				<span id="cBirthYear"></span>년 &nbsp; 
				<span id="cBirthMonth"></span>월 &nbsp;
				<span id="cBirthDate"></span>일
				<input type="hidden" id="cBirth" name="cBirth" value="${update.cBirth}">
				</td>
		
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;보호자 이름</th>
				<td class="secondRow"><input type="text" id="pName"
					name="pName" 
					value="${update.pName}" style="width: 220px;"
					class="form-control"></td>
			
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;보호자 닉네임</th>
				<td class="secondRow"><input type="text" id="pnickName"
					name="pnickName" style="width: 220px;" 
					value="${update.pnickName}" onkeyup="formSubmit3()"
					class="form-control">
					<div id="checkedpNick"></div></td>
				
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;이메일</th>
				<td class="secondRow"><input type="text" id="email"
					name="email" style="width: 150px;"
					
					onkeyup="formSubmit8()"
					class="form-control">&nbsp;@&nbsp;
				<input type="text" id="email2"
					name="email2" style="width: 120px;" 
					
					readonly="readonly"
					onkeyup="formSubmit10()"
					class="form-control">&nbsp;
				<select id="emailCom" name="emailCom" onchange="formSubmit9()"
				class="form-control" style="width: 140px;">
				<option selected="selected">선택</option>
						<option>naver.com</option>
						<option>gmail.com</option>
						<option>hanmail.net</option>
						<option>nate.com</option>
						<option>yahoo.co.kr</option>
						<option>dreamwiz.com</option>
						<option>직접작성</option>
				</select>	
				<div id="checkedEmail"></div></td>
			
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;전화번호</th>
				<td class="secondRow"><select id="phone1" name="phone1"
					style="width: 80px;"
					class="form-control">
						<option selected="selected">선택</option>
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
				</select>&nbsp;&nbsp;-&nbsp;&nbsp;<input type="text" id="phone2" name="phone2" style="width: 75px;"
				class="form-control">
					&nbsp;&nbsp;-&nbsp;&nbsp;<input type="text" id="phone3" name="phone3" style="width: 75px;"
					class="form-control"></td>
				
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;주소</th>
				<td class="secondRow"><input type="text" id="address"
					name="address" value="${update.address}" style="width: 450px;"
					class="form-control"></td>
				
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;사진 업로드</th>
				<td class="secondRow"><input type="file" name="upload"
					id="upload" multiple="multiple"></td>
				
			</tr>
			
		</table>
		<br>
		<div style="text-align: center;">
				
				<img src="../resources/img/account/updatebutton.png" id="updatesubmit">
				&nbsp;
				<img src="../resources/img/account/deletebutton.png" id="userDelete">
				&nbsp;
				<a href="../"><img src="../resources/img/account/cancelbutton.png"></a>
					
			</div>
		
		
	</form>
</div>
<!--Add a navar  -->
<nav class="navbar navbar-default navbar-fixed-bottom">
	<footer class="container-fluid bg-4 text-center" 
style="position: absolute;
width: 100%;
height: 100%;">
	  <p>Made By <a href="../">FairyBook.com</a></p> 
	</footer>
	 
</nav>

</body>
</html>