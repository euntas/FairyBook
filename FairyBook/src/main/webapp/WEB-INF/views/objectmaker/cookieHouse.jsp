<<<<<<< HEAD
<!-- 과자집 색칠하기 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>과자집 색칠하기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- css 링크--> 
<link rel="stylesheet" type="text/css" href="../resources/css/cookieHouse.css">

<!-- favicon 링크 -->
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">

<!-- jquery 링크 -->
<script src="../resources/js/jquery-3.1.1.js"></script>


<!--적용 자바스크립트와 스타일  -->

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">

<!--####################여기부터  -->
<!-- 만들어진 과자집이 보이는 div 태그 -->
<div id="cookiehouse">
<input type="button" value="초기화" id="resetbtn">

	<!-- 저장버튼 및 초기화버튼이 보이는 div태그 -->
	<div id="saveArea">
		<input type="button" value="저장" id="savebtn">
	</div>

	<!-- 아바타 신체부위 선택하는 대분류 div태그 -->	
	
</div>
	<div id="category">
	<input id="redbtn" class="category" type="button" value="빨강"><input id="orangebtn" class="category" type="button" value="주황"><input id="yellowbtn" class="category" type="button" value="노랑"><input id="greenbtn" class="category" type="button" value="초록"><input id="bluebtn" class="category" type="button" value="파랑"><input id="purplebtn" class="category" type="button" value="보라"><input id="whitebtn" class="category" type="button" value="하양"><input id="blackbtn" class="category" type="button" value="검정">
	</div>
<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>


<!-- Go to www.addthis.com/dashboard to customize your tools --> 
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-58e45cf68c351e8d"></script> 
</body>
</html> 

=======
<!-- 과자집 색칠하기 페이지 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css 링크 -->
<link rel="stylesheet" type="text/css" href="./resources/css/cookieHouse.css">

<!-- favicon 링크 -->
<link rel="shortcut icon" type="image/x-icon" href="./resources/img/favicon.ico">

<!-- jquery 링크 -->
<script src="./resources/js/jquery-3.1.1.js"></script>


<title>색칠하기</title>
</head>
<body>

<!-- 만들어진 아바타가 보이는 div 태그 -->
<div id="avatar">
<input type="button" value="초기화" id="resetbtn">

	<!-- 저장버튼 및 초기화버튼이 보이는 div태그 -->
	<div id="saveArea">
	<input type="button" value="저장" id="savebtn">
	</div>
</div>

<!-- 아바타 신체부위 선택하는 대분류 div태그 -->
<div id="category">
<input id="facebtn" class="category" type="button" value="빨강"><input id="hairbtn" class="category" type="button" value="주황"><input id="eyebtn" class="category" type="button" value="노랑"><input id="nosebtn" class="category" type="button" value="초록"><input id="mouthbtn" class="category" type="button" value="파랑"><input id="earbtn" class="category" type="button" value="보라"><input id="neckbtn" class="category" type="button" value="하양"><input id="bodybtn" class="category" type="button" value="검정">
</div>

</body>
</html>
>>>>>>> refs/remotes/origin/master
