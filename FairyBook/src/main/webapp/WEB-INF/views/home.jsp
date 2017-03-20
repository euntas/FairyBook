<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Fairy Book</title>
</head>
<body>
<input type = 'text' name = 'id' id = 'id'>
<input type = 'password' name = 'password' id = 'password'>
<input type = 'submit' value = '로그인'>
<input type = 'button' value = '회원가입' onclick ="location.href='join'">

<ul>
<li><a href ="storymaker/select"> 동화선택 </a></li>
<li><a href ="storymaker/show"> 동화감상 </a></li>
</ul>

</body>
</html>
