<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보호자 닉네임 중복 확인</title>
<script>
function nickSelect(pNick){
	opener.document.getElementById('pNick').value = pNick;//가입폼의 ID입력란에 전달받은 ID입력
	this.window.close();//현재 창 닫기
}
</script>
</head>
<body>
<h1>[ 닉네임 중복 확인 ]</h1>
<form action="pNickCheck" method="post">
검색할 닉네임
	<input type="text" id="searchpNick" name="searchpNick" value="${searchpNick}">
	<input type="submit" value="검색">
</form>
<br><br>

<c:if test="${search}">
<c:if test="${checkedGuy==null}">
${whatda}는 사용 가능한 닉네임입니다.
<input type = "button" value="사용하기" onclick="nickSelect('${whatda}')">
</c:if>
<c:if test="${checkedGuy!=null}">
이미 존재하는 닉네임입니다.
</c:if>
</c:if>
</body>
</html>