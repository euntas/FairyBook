<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.1.1.min.js"></script>
</head>
<body style='text-align: center;'>


<h2>메일 보내기 </h2>
<table>
<tr><th style="width:80px;">수신인</th><td><input type="text" id="receiver" name="receiver" readonly="readonly" value="${emailAddress }" style="width: 280px;"></td></tr>

<tr><th>제 목</th><td><input type="text" id="title" name="title" style="width: 280px;"></td></tr>

<tr><th colspan="2" style="text-align: left;">&nbsp;&nbsp;&nbsp;내 용</tr>
<tr><td colspan="2"><textarea rows="20" cols="50"></textarea></td></tr>

<tr><td colspan="2"><input type="button" value="보내기">&nbsp;<input type="button" value="취소하기" onclick="javascript:window.close()"></td></tr>

</table>
</body>

</html>