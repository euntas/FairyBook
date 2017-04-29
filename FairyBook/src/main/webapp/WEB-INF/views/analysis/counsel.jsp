<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>상담 연결</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">
<!--적용 자바스크립트와 스타일  -->
<link rel="stylesheet" href="../resources/css/joinForm.css">
<script src="../resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d1ca5afd82e10d2f847ea34d2c399b10">
</script>
<script type="text/javascript" src="../resources/js/map.js"></script>
<script>
$(document).ready(function(){
	$('#region').on('change', selectChange);
	$('#country').on('change', selectChange1);
	
});

function selectChange(){
	
	
	var region = $('#region').val();
	var opt = "<option value=''>--선택--";
	var hospital = "<table style='margin:auto;' class='table table-striped'><tr><th style='width:150px; text-align:center;'>지역</th><th style='width:250px; text-align:center;'>병원명</th><th style='width:200px; text-align:center;'>담당의사</th><th style='width:200px; text-align:center;'>연락처</th><th style='width:350px; text-align:center;'>이메일</th></tr>";
	var input;
	$.ajax({
		url : 'counsel',
		type : 'POST',
		data : {
			region : region
		},
		dataType : 'JSON',
		success : function(data) {
			
			for(var i=0;i<data.length;i++){
				opt += "<option value="+data[i].country+">"+data[i].country+"</option>";
			}
			$('#country').html(opt);
			
			for(var i=0;i<data.length;i++){
				
			
			 	input = "'"+data[i].email+"'";
			 	console.log(input);
				hospital += "<tr><td style='text-align:center;'>"+data[i].country+"</td>";
				hospital += "<td id='selectedhosp' >"+data[i].hospital+"</a></td>";
				hospital += "<td style='text-align:center;'>"+data[i].doctor+"</td>";
				hospital += "<td style='text-align:center;'>"+data[i].phoneNum+"</td>";
				hospital += "<td>"+data[i].email+"&nbsp;<a href='javascript:void(0)' onclick='sendMail123(13579)'><img src='../resources/image/mail.png' style='width:25px; height:20px;'></a></td></tr>";
				hospital = hospital.replace(/13579/gi, '"' + data[i].email + '"');
			
			
			}
			$('#hospital').html(hospital);
			map(region);
		}
		,
		error : function(e) {
			alert(JSON.stringify(e));
		}
	});
}

function selectChange1(){
	
	var country = $('#country').val();
	var hospital = "<table style='margin:auto;' class='table table-striped'><tr><th style='width:150px; text-align:center;'>지역</th><th style='width:250px; text-align:center;'>병원명</th><th style='width:200px; text-align:center;'>담당의사</th><th style='width:200px; text-align:center;'>연락처</th><th style='width:350px; text-align:center;'>이메일</th></tr>";
	$.ajax({
		url : 'counsel1',
		type : 'POST',
		data : {
			country : country
		},
		dataType : 'JSON',
		success : function(data) {
			    hospital += "<tr><td style='text-align:center;'>"+data.country+"</td>";
				hospital += "<td>"+data.hospital+"</td>";
				hospital += "<td style='text-align:center;'>"+data.doctor+"</td>";
				hospital += "<td style='text-align:center;'>"+data.phoneNum+"</td>";
				hospital += "<td>"+data.email+"&nbsp;<a href='javascript:void(0)' onclick='sendMail123(13579)'><img src='../resources/image/mail.png' style='width:25px; height:20px;'></a></td></tr>";
				hospital = hospital.replace(/13579/gi, '"' + data.email + '"');
			
				
			$('#hospital').html(hospital);
			map2(country);
		}
		,
		error : function(e) {
			alert(JSON.stringify(e));
		}
	});
}


function sendMail123(email){
	

	
			window.open('sendMail?email='+email,"sendMail", "top=200,left=400,width=430,height=590");
		
}

</script>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">



<!--배너  -->
<nav class="navbar-fixed-top">
<div class="container-fluid bg-2 text-center">
  <a href='../'><img src="../resources/image/title.PNG"></a>
</div>
</nav>

<div id="under">
<div id="container">

<div style="text-align: center; margin: auto;"><img src="../resources/img/account/connection.png" style="width: 150px;height: 50px;"></div>
<br>
<p style="text-align: center;">지역을 선택하세요.</p>
<span><div style="text-align:center; margin:auto;">
<select id="region">
<option value="">--지역 선택--</option>
	<option value="서울">서울</option>
	<option value="경기인천">경기인천</option>
	<option value="강원">강원</option>
	<option value="충청">충청</option>
	<option value="전라">전라</option>
	<option value="경상">경상</option>
	<option value="제주">제주</option>
</select>&nbsp;
<select id="country">
<option value="">--선택--
</select></div></span>
<br>
<div style="text-align: center;"><input type="button" value="메인으로"
					onclick="location.href='/fairybook/'" class="btn btn-info">
					</div>
<br>
<div id="hospital" style="height:auto; width:auto;">
</div>
<br>
<div id="map" style="width:500px;height:300px; margin: auto;">



</div>
</div>
</div>
</body>
</html>