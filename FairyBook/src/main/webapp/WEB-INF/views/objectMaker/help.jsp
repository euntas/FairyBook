<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>help</title>
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">
<script src="../resources/js/jquery-3.1.1.min.js"></script>
<script>
var whosYourDaddy = window.opener.whoAreYou();
var avatarPath =  "../resources/img/util/avatarHelp.jpg";
var housePath = "../resources/img/util/houseHelp.jpg";
var etcPath = "../resources/img/util/etcHelp.jpg";

$(document).ready(function(){
	if(whosYourDaddy == 'avatar'){
		$("#help").attr("src", avatarPath);
	}else if(whosYourDaddy == 'house'){
		$("#help").attr("src", housePath);
	}else if(whosYourDaddy == 'etc'){
		$("#help").attr("src", etcPath);
	}
})

</script>
<style>
img{
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
<img id="help" alt="help" src="">
</body>
</html>