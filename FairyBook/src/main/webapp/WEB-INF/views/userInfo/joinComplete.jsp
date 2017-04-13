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

<!--적용 자바스크립트와 스타일  -->
<link rel="stylesheet" href="../resources/css/joinForm.css">

<title>joinComplete</title>

<body data-spy="scroll" data-target=".navbar" data-offset="50">



<!--배너  -->
<nav class="navbar-fixed-top">
<div class="container-fluid bg-2 text-center">
  <h1 onclick="location.href='/fairybook/'"
  style="cursor: pointer;">Fairytale Book</h1>
</div>
</nav>

<div id="under" style="text-align: center; margin: auto;">
<img src="../resources/image/yo.jpg">
<h1 style="font-family: fantasy; ">FAIRY BOOK</h2>
<h2 style="font-family: fantasy; font-stretch: inherit;">가입을 환영합니다.</h2>
<p>
	<input type="button" value="로그인" onclick="location.href='login'" class="btn btn-info"> &nbsp;
	<input type="button" value="메인으로" onclick="location.href='/fairybook/'" class="btn btn-info">

</p>
</div>
</body>
</html>