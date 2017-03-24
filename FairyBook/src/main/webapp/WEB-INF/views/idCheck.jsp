<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 확인</title>
<script>
function idSelect(id){
	opener.document.getElementById('id').value = id;//가입폼의 ID입력란에 전달받은 ID입력
	this.window.close();//현재 창 닫기
}
</script>
</head>
<body>
<h1>[ ID 중복 확인 ]</h1>
<form action="idCheck" method="post">
검색할 ID
	<input type="text" id="searchId" name="searchId" value="${searchId}">
	<input type="submit" value="검색">
</form>
<br><br>

<c:if test="${search}">
<c:if test="${checkedGuy==null}">
${whatda}는 사용 가능한 아이디입니다.
<input type = "button" value="사용하기" onclick="idSelect('${whatda}')">
</c:if>
<c:if test="${checkedGuy!=null}">
이미 존재하는 아이디입니다.
</c:if>
</c:if>
</body>
</html>