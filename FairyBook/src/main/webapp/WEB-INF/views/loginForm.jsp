<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Bootstrap Theme Simply Me</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
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
	
	<script>
		$(function(){
			//login버튼 이벤트
			$('#login').on('click',function(){
				location.href="login";
			});
			//home버튼 이벤트
			$('#home').on('click',function(){
				location.href = "../fairybook";
			});
		});
	</script>
</head>
<body class="container-fluid bg-1 text-center">

<div class="container-fluid bg-1 text-center">
  <h3>Who Am I?</h3>
  <img src="resources/image/pc.jpg" alt="img" class="img-responsive img-circle" style="display:inline"><br><br> <!--circle image  -->
  <!-- 아이디,패스워드 입력란 -->
   <center>
   <div class="input-group col-xs-4">
    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    <input id="id" type="text" class="form-control" name="id" placeholder="id">
  </div>
  <div class="input-group col-xs-4">
    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
    <input id="password" type="password" class="form-control" name="password" placeholder="Password">
  </div><br>
  </center>
  <!--버튼 및 링크  -->
  <button type="button" id="login" class="btn btn-success">LOGIN</button>
  <button type="button" id="home" class="btn btn-warning">HOME</button>
  <p><b><a href="....">ID/패스워드 찾기</a></b> 
  <b><a href="....">회원가입</a></b></p>
</div>


<!--Add a navar  -->
<nav class="navbar navbar-default navbar-fixed-bottom">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="#">Me</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">WHO</a></li>
        <li><a href="#">WHAT</a></li>
        <li><a href="#">WHERE</a></li>
      </ul>
    </div>
  </div>
	<footer class="container-fluid bg-4 text-center">
	  <p>Made By <a href="203.233.196.122:8888/fairybook">FairyBook.com</a></p> 
	</footer>
</nav>


</body>
</html>