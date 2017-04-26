<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>


<title>회원가입</title>
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
		width:23%;
		}
	</style>

	

<!--적용 자바스크립트와 스타일  -->
<link rel="stylesheet" href="../resources/css/joinForm.css">
<script>
<c:if test="${errorMsg != null}">
alert('${errorMsg}');
</c:if>


$(document).ready(function() {
	$('#joinsubmit').css('cursor', 'pointer');
	$('#joinsubmit').click(function() {
		  $( "#joinform" ).submit();
	});
});

function formSubmit1() {

	var id = $('#id').val();
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test(id) == true){
	    alert(' 공백은 사용할 수 없습니다. ');
	    $('#id').val("");	    
	    $('#id').focus();
	    return false;
	}


	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

	if( special_pattern.test(id) == true ){
	    alert('특수문자는 사용할 수 없습니다.');
	    $('#id').val("");	    
	    $('#id').focus();
	    return false;
	}

	var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	if( check.test(id) == true ){
	    alert('아이디는 영문자와 숫자로만 입력가능합니다.');
	    $('#id').val("");	    
	    $('#id').focus();
	    return false;
	}
	
	if(id=="") {
		$('#checkedId').html('아이디를 입력해주세요.');
		return false;
	}
	
	if(id.length<4||id.length>10){
		$('#checkedId').html('아이디를 4자 이상 10자이하로 입력해주세요.');
		return false;
	}
	
	
	$.ajax({
		url : 'idCheck',
		type : 'POST',
		data : {
			id : id
		},
		dataType: 'text',
		success : function(text) {
			
			if(text=="true"){
			$('#checkedId').html('사용 가능한 아이디입니다.');
			
			
			}else{
			$('#checkedId').html('이미 가입된 아이디입니다.');	
			}
		},
		error : function() {
			alert(JSON.stringify(e));
		}
	});
}

function formSubmit2() {

	var cNick = $('#cnickName').val();
	
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
	var year = $('#cBirthYear').val();
	var month = $('#cBirthMonth').val();
	var date = $('#cBirthDate').val();
	var address = $('#address').val();
	var cpw = $('#password1').val();
	var pw = $('#password2').val();
	var cNick = $('#cnickName').val();
	var pNick = $('#pnickName').val();
	
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
	
	if(year=="년"||month=="월"||date=="일"){
		alert('생년월일을 올바르게 입력해주세요.');
		return false;
	}
	
	if(isNaN(phone1)||isNaN(phone2)||isNaN(phone3)){
		alert('전화번호를 올바르게 입력해주세요.');
		return false;
	}
	
	if(isNaN(month)||isNaN(date)){
		alert('생년월일을 올바르게 입력해주세요.');
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

<body data-spy="scroll" data-target=".navbar" data-offset="50"  style="background-image: url('../resources/img/account/back4.png'); background-repeat: no-repeat; background-size: cover;">



<!--배너  -->
<!--배너  -->
<nav class="navbar-fixed-top">
<div style="background-image: url('../resources/image/icon/banner.png');width: 100%;height: 100px;">
 <center><a href="../"><img src="../resources/image/icon/bannertitle.png" style="margin-top: 15px;margin-right: 17px"></a></center>
</div>
</nav>


<div id="under">
	<form enctype="multipart/form-data" action="join" method="post"
		onsubmit="return formcheck()" class="form-inline" id="joinform">

		<div style="text-align: center; margin: auto;">
		<img src="../resources/img/account/Join.png" style="width: 150px;height: 50px;"></div>
		<br>
		<table style="margin: auto; background-color:#B4E5FF; opacity:20%; border-radius:20px; width:48%;">
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;ID</th>
				<td class="secondRow"><input type="text" id="id" name="id"
					style="width: 220px;" onkeyup="formSubmit1()" class="form-control">
					<div id="checkedId"></div></td>
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;닉네임</th>
				<td class="secondRow"><input type="text" id="cnickName"
					name="cnickName" style="width: 220px;" onkeyup="formSubmit2()" class="form-control">
					<div id="checkedcNick"></div></td>
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th rowspan="3" class="firstRow">&nbsp;&nbsp;&nbsp;아이용 비밀번호</th>
				<td class="secondRow"><input type="password" id="password1"
					name="password1" style="width: 220px;"
					onkeyup="formSubmit4()" class="form-control">
				<div id="checkedcPw1"></div></td>
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<td class="secondRow"><input type="password"
					id="password1check" name="password1check" style="width: 220px;"
					onkeyup="formSubmit5()" class="form-control">
				<div id="checkedcPw2"></div></td>
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th rowspan="3" class="firstRow">&nbsp;&nbsp;&nbsp;보호자용 비밀번호</th>
				<td class="secondRow"><input type="password" id="password2"
					name="password2" style="width: 220px;"
					onkeyup="formSubmit6()" class="form-control">
				<div id="checkedpPw1"></div></td>
				
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<td class="secondRow"><input type="password"
					id="password2check" name="password2check" style="width: 220px;"
					onkeyup="formSubmit7()" class="form-control">
				<div id="checkedpPw2"></div></td>
				
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;아이 이름</th>
				<td class="secondRow"><input type="text" id="cName"
					name="cName" style="width: 220px;" class="form-control"></td>
				
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;아이 생일</th>
				<td class="secondRow"><select id="cBirthYear" name="cBirthYear">
						<option selected="selected" class="form-control">년</option>
						<c:forEach var="i" begin="2005" end="2017">
							<option>${i}</option>
						</c:forEach>
				</select>년 &nbsp; <select id="cBirthMonth" name="cBirthMonth">
						<option selected="selected" class="form-control">월</option>
						<c:forEach var="i" begin="1" end="12">
							<c:if test="${i<10 }">
								<option>0${i}</option>
							</c:if>
							<c:if test="${i>=10 }">
								<option>${i}</option>
							</c:if>
						</c:forEach>
				</select>월 &nbsp; <select id="cBirthDate" name="cBirthDate">
						<option selected="selected" class="form-control">일</option>
						<c:forEach var="i" begin="1" end="31">
							<c:if test="${i<10 }">
								<option>0${i}</option>
							</c:if>
							<c:if test="${i>=10 }">
								<option>${i}</option>
							</c:if>
						</c:forEach>
				</select>일</td>
		
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;보호자 이름</th>
				<td class="secondRow"><input type="text" id="pName"
					name="pName" style="width: 220px;" class="form-control"></td>
			
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;보호자 닉네임</th>
				<td class="secondRow"><input type="text" id="pnickName"
					name="pnickName" style="width: 220px;" onkeyup="formSubmit3()" class="form-control">
					<div id="checkedpNick"></div></td>
				
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;이메일</th>
				<td class="secondRow" align="left"><input type="text" id="email"
					name="email" style="width: 150px;"
					onkeyup="formSubmit8()" class="form-control">&nbsp;@&nbsp;
				<input type="text" id="email2"
					name="email2" style="width: 120px;" readonly="readonly"
					onkeyup="formSubmit10()" 
					class="form-control">&nbsp;
				<select id="emailCom" name="emailCom" onchange="formSubmit9()" style="width: 140px;"
				class="form-control">
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
					style="width: 80px;" class="form-control">
						<option selected="selected">선택</option>
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
				</select>&nbsp;&nbsp;-&nbsp;&nbsp;<input type="text" id="phone2" name="phone2" style="width: 75px;" class="form-control">
					&nbsp;&nbsp;-&nbsp;&nbsp;<input type="text" id="phone3" name="phone3" style="width: 75px;" class="form-control"></td>
				
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;주소</th>
				<td class="secondRow"><input type="text" id="address"
					name="address" style="width: 450px;" class="form-control"></td>
				
			</tr>
			<tr style="height: 5px;"></tr>
			<tr>
				<th class="firstRow">&nbsp;&nbsp;&nbsp;사진 업로드</th>
				<td class="secondRow"><input type="file" name="upload"
					id="upload" multiple="multiple"></td>
				
			</tr>
			

		</table>
		<br>
		<div style="text-align: center; margin: auto;">
				<img src="../resources/img/account/joinbutton.png" id="joinsubmit">
					&nbsp;<a href="../"><img src="../resources/img/account/cancelbutton.png"></a>
			</div>
	</form>
</div>
<!--Add a navar  -->

<br>
</body>
</html>