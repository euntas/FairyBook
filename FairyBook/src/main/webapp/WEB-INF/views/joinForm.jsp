<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="./resources/css/joinForm.css" rel="stylesheet">
</head>
<body>
<table>
<tr><td class="firstRow">ID</td><td class="secondRow"><input type="text" id="userId" name="userId" style="width: 220px;"></td><td><input type="button" value="중복확인"></td></tr>
<tr><td class="firstRow">닉네임</td><td class="secondRow"><input type="text" id="cNick" name="cNick" style="width: 220px;"></td><td><input type="button" value="중복확인"></td></tr>
<tr><td rowspan="2" class="firstRow">아이용 비밀번호</td><td class="secondRow"><input type="password" id="cPw1" name="cPw1" style="width: 220px;"></td><td></td></tr>
<tr><td class="secondRow"><input type="password" id="cPw2" name="cPw2" style="width: 220px;"></td><td></td></tr>
<tr><td rowspan="2" class="firstRow">보호자용 비밀번호</td><td class="secondRow"><input type="password" id="pPw1" name="pPw1" style="width: 220px;"></td><td></td></tr>
<tr><td class="secondRow"><input type="password" id="pPw2" name="pPw2" style="width: 220px;"></td><td></td></tr>
<tr><td class="firstRow">아이 이름</td><td class="secondRow"><input type="text" id="cName" name="cName" style="width: 220px;"></td><td></td></tr>
<tr><td class="firstRow">아이 생일</td><td class="secondRow"><select id="cBirthYear">
<option selected="selected">년</option>
<c:forEach var="i" begin="2005" end="2017"><option>${i}</option></c:forEach>
</select>년 &nbsp; 
<select id="cBirthMonth"><option selected="selected">월</option>
<c:forEach var="i" begin="1" end="12"><option>${i}</option></c:forEach>
</select>월 &nbsp;
<select id="cBirthDate"><option selected="selected">일</option>
<c:forEach var="i" begin="1" end="31"><option>${i}</option></c:forEach>
</select>일</td><td></td></tr>
<tr><td class="secondRow"></td>
<td class="secondRow">
<input type="radio" name="cBirthCal" value="solar">양력 &nbsp;
<input type="radio" name="cBirthCal" value="lunar">음력
</td><td></td></tr>
<tr><td class="firstRow">보호자 이름</td><td class="secondRow"><input type="text" id="pName" name="pName" style="width: 220px;"></td><td></td></tr>
<tr><td class="firstRow">보호자 생일</td><td class="secondRow"><select id="pBirthYear">
<option selected="selected">년</option>
<c:forEach var="i" begin="1960" end="1998"><option>${i}</option></c:forEach>
</select>년 &nbsp; 
<select id="pBirthMonth"><option selected="selected">월</option>
<c:forEach var="i" begin="1" end="12"><option>${i}</option></c:forEach>
</select>월 &nbsp;
<select id="pBirthDate"><option selected="selected">일</option>
<c:forEach var="i" begin="1" end="31"><option>${i}</option></c:forEach>
</select>일
</td><td></td></tr>
<tr><td class="secondRow"></td>
<td class="secondRow">
<input type="radio" name="pBirthCal" value="solar">양력 &nbsp;
<input type="radio" name="pBirthCal" value="lunar">음력
</td><td></td></tr>
<tr><td class="firstRow">보호자 닉네임</td><td class="secondRow"><input type="text" id="pNick" name="pNick" style="width: 220px;"></td><td></td></tr>
<tr><td class="firstRow">이메일</td><td class="secondRow"><input type="text" id="email" name="email" style="width: 220px;"></td><td></td></tr>
<tr><td class="firstRow">전화번호</td><td class="secondRow">
<select id="phone1" name="phone1" style="width: 70px;">
<option selected="selected">선택</option>
<option>010</option>
<option>011</option>
<option>016</option>
<option>017</option>
<option>018</option>
<option>019</option>
</select>-<input type="text" id="phone2" name="phone2" style="width: 75px;">
-<input type="text" id="phone3" name="phone3" style="width: 75px;"></td>
<td></td></tr>
<tr><td class="firstRow">주소</td><td class="secondRow"><input type="text" id="address" name="address"></td><td></td></tr>
<tr><td class="firstRow">사진 업로드</td><td class="secondRow"><input type="file" name="upload" id="upload"></td><td></td></tr>
<tr><td colspan="3" style="text-align: center;"><input type="button" value="아바타 제작으로"><input type="button" value="취소"></td></tr>

</table>
</body>
</html>