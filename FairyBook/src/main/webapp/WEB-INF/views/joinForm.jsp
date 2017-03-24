<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="./resources/css/joinForm.css" rel="stylesheet">
<script type="text/javascript" src="./resources/js/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function() {
	//id가 formButton1인 버튼을 클릭하면 formSubmit1() 함수 실행	
	$('#idCheck').on('click', formSubmit1);
	$('#cNickCheck').on('click', formSubmit2);
	$('#pNickCheck').on('click', formSubmit3);
});

function formSubmit1() {

	var id = $('#id').val();
	
	if(id=="") {
		alert('아이디를 입력해주세요.')
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
			$('#id').val("");
			$('#id').focus();
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
		alert('닉네임을 입력해주세요.')
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
				$('#cnickName').val("");
				$('#cnickName').focus();
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
		alert('아이디를 입력해주세요.')
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
				$('#pnickName').val("");
				$('#pnickName').focus();
				}
			
		},
		error : function() {
			alert(JSON.stringify(e));
		}
	});
}


</script>
</head>
<body>
<form  enctype="multipart/form-data" action="join" method="post" onsubmit="return formcheck">

	<table>
		<tr>
			<td class="firstRow">ID</td>
			<td class="secondRow"><input type="text" id="id"
				name="id" style="width: 220px;">
				<div id="checkedId"></div></td>
			<td><input type="button" value="중복확인" id="idCheck"></td>
		</tr>
		<tr>
			<td class="firstRow">닉네임</td>
			<td class="secondRow"><input type="text" id="cnickName" name="cnickName"
			 style="width: 220px;">
			 <div id="checkedcNick"></div></td>
			<td><input type="button" value="중복확인" id="cNickCheck"></td>
		</tr>
		<tr>
			<td rowspan="2" class="firstRow">아이용 비밀번호</td>
			<td class="secondRow"><input type="password" id="password1"
				name="password1" style="width: 220px;"></td>
			<td></td>
		</tr>
		<tr>
			<td class="secondRow"><input type="password" id="password1check"
				name="password1check" style="width: 220px;"></td>
			<td></td>
		</tr>
		<tr>
			<td rowspan="2" class="firstRow">보호자용 비밀번호</td>
			<td class="secondRow"><input type="password" id="password2"
				name="password2" style="width: 220px;"></td>
			<td></td>
		</tr>
		<tr>
			<td class="secondRow"><input type="password" id="password2check"
				name="password2check" style="width: 220px;"></td>
			<td></td>
		</tr>
		<tr>
			<td class="firstRow">아이 이름</td>
			<td class="secondRow"><input type="text" id="cName" name="cName"
				style="width: 220px;"></td>
			<td></td>
		</tr>
		<tr>
			<td class="firstRow">아이 생일</td>
			<td class="secondRow"><select id="cBirthYear" name="cBirthYear">
					<option selected="selected">년</option>
					<c:forEach var="i" begin="2005" end="2017">
						<option>${i}</option>
					</c:forEach>
					</select>년 &nbsp;
					<select id="cBirthMonth" name="cBirthMonth">
					<option selected="selected">월</option>
					<c:forEach var="i" begin="1" end="12">
						<c:if test="${i<10 }">
							<option>0${i}</option>
						</c:if>
						<c:if test="${i>=10 }">
							<option>${i}</option>
						</c:if>
					</c:forEach>
					</select>월 &nbsp; 
					<select id="cBirthDate" name="cBirthDate">
					<option selected="selected">일</option>
					<c:forEach var="i" begin="1" end="31">
						<c:if test="${i<10 }">
							<option>0${i}</option>
						</c:if>
						<c:if test="${i>=10 }">
							<option>${i}</option>
						</c:if>
					</c:forEach>
			</select>일</td>
			<td></td>
		</tr>
		<tr>
			<td class="firstRow">보호자 이름</td>
			<td class="secondRow"><input type="text" id="pName" name="pName"
				style="width: 220px;"></td>
			<td></td>
		</tr>
		<tr>
			<td class="firstRow">보호자 닉네임</td>
			<td class="secondRow"><input type="text" id="pnickName" name="pnickName"
				 style="width: 220px;">
				 <div id="checkedpNick"></div></td>
			<td><input type="button" value="중복확인" id="pNickCheck"></td>
		</tr>
		<tr>
			<td class="firstRow">이메일</td>
			<td class="secondRow"><input type="text" id="email" name="email"
				style="width: 220px;"></td>
			<td></td>
		</tr>
		<tr>
			<td class="firstRow">전화번호</td>
			<td class="secondRow"><select id="phone1" name="phone1"
				style="width: 70px;">
					<option selected="selected">선택</option>
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
			</select>-<input type="text" id="phone2" name="phone2" style="width: 75px;">
				-<input type="text" id="phone3" name="phone3" style="width: 75px;"></td>
			<td></td>
		</tr>
		<tr>
			<td class="firstRow">주소</td>
			<td class="secondRow">
			<input type="text" id="address" name="address">
			</td>
			<td>
			</td>
		</tr>
		<tr>
			<td class="firstRow">사진 업로드</td>
			<td class="secondRow">
			<input type="file" name="upload" id="upload" multiple="multiple">
			</td>
			<td>
			</td>
		</tr>
		<tr>
			<td colspan="3" style="text-align: center;">
			<input type="submit" value="가입하기">
				<input type="button" value="취소" onclick="location.href='/'"></td>
		</tr>

	</table>
</form>
</body>
</html>