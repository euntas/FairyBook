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
	</style>
<!--적용 자바스크립트와 스타일  -->
<link rel="stylesheet" href="../resources/css/joinForm.css">

<title>joinComplete</title>

<body data-spy="scroll" data-target=".navbar" data-offset="50">



<!--배너  -->
<nav class="navbar-fixed-top">
<div class="container-fluid bg-2 text-center" style="background-image: url('../resources/image/icon/banner.png');height: 102px">
 <a href="../"><img src="../resources/image/icon/bannertitle.png"></a>
</div>
</nav>



<div id="under" style="text-align: center; margin: auto;">
<img src="../resources/image/yo.jpg">
<h1 style="font-family: fantasy; ">FAIRY BOOK</h1>
<h2 style="font-family: fantasy; font-stretch: inherit;">가입을 환영합니다.</h2>
<p>
	<a href="login"><img src="../resources/img/account/loginbutton.png"></a>
	&nbsp;
	<a href="../"><img src="../resources/img/account/tomainbutton.png"></a>
</p>
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