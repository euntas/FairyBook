<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="./resources/css/joinForm.css" rel="stylesheet">
<script>
<c:if test="${errorMsg != null}">
alert('${errorMsg}');
</c:if>

//ID 중복확인 창 열기
function idcheckOpen() {
	window.open('idCheck','brandnewshit','top=200,left=400,width=300,height=225');//open메소드 파라미터 세개 들어감
}
function cNickCheckOpen() {
	window.open('cNickCheck','brandnewshit','top=200,left=400,width=300,height=225');//open메소드 파라미터 세개 들어감
}
function pNickCheckOpen() {
	window.open('pNickCheck','brandnewshit','top=200,left=400,width=300,height=225');//open메소드 파라미터 세개 들어감
}
</script>
</head>
<body>
<form  enctype="multipart/form-data" action="join" method="post">
	<table>
		<tr>
			<td class="firstRow">ID</td>
			<td class="secondRow"><input type="text" id="userId"
				name="userId" readonly="readonly" style="width: 220px;"></td>
			<td><input type="button" value="중복확인" id="idCheck" onclick="idcheckOpen()"></td>
		</tr>
		<tr>
			<td class="firstRow">닉네임</td>
			<td class="secondRow"><input type="text" id="cNick" name="cNick"
				 readonly="readonly" style="width: 220px;"></td>
			<td><input type="button" value="중복확인" id="cNickCheck" onclick="cNickCheckOpen()"></td>
		</tr>
		<tr>
			<td rowspan="2" class="firstRow">아이용 비밀번호</td>
			<td class="secondRow"><input type="password" id="cPw1"
				name="cPw1" style="width: 220px;"></td>
			<td></td>
		</tr>
		<tr>
			<td class="secondRow"><input type="password" id="cPw2"
				name="cPw2" style="width: 220px;"></td>
			<td></td>
		</tr>
		<tr>
			<td rowspan="2" class="firstRow">보호자용 비밀번호</td>
			<td class="secondRow"><input type="password" id="pPw1"
				name="pPw1" style="width: 220px;"></td>
			<td></td>
		</tr>
		<tr>
			<td class="secondRow"><input type="password" id="pPw2"
				name="pPw2" style="width: 220px;"></td>
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
			<td class="secondRow"><input type="text" id="pNick" name="pNick"
				 readonly="readonly" style="width: 220px;"></td>
			<td><input type="button" value="중복확인" id="pNickCheck" onclick="pNickCheckOpen()"></td>
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
			<input type="submit" value="아바타 제작으로" >
				<input type="button" value="취소" onclick="location.href="></td>
		</tr>

	</table>
	</form>
</body>
</html>