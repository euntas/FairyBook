<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 연결</title>
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
	var hospital = "<table><tr><th style='width:70px;'>지역</th><th style='width:150px;'>병원명</th><th>담당의사</th><th style='width:150px;'>연락처</th><th style='width:240px;'>이메일</th></tr>";
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
				hospital += "<tr><td style='text-align:center;'>"+data[i].country+"</td>";
				hospital += "<td id='selectedhosp'>"+data[i].hospital+"</td>";
				hospital += "<td style='text-align:center;'>"+data[i].doctor+"</td>";
				hospital += "<td style='text-align:center;'>"+data[i].phoneNum+"</td>";
				hospital += "<td>"+data[i].email+"</td></tr>";
			}
			$('#hospital').html(hospital);
			map(region);
		}
		,
		error : function() {
			alert(JSON.stringify(e));
		}
	});
}

function selectChange1(){
	
	var country = $('#country').val();
	var hospital = "<table><tr><th style='width:70px;'>지역</th><th style='width:150px;'>병원명</th><th>담당의사</th><th style='width:150px;'>연락처</th><th style='width:240px;'>이메일</th></tr>";
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
				hospital += "<td>"+data.email+"</td></tr>";
			
			$('#hospital').html(hospital);
			map2(country);
		}
		,
		error : function() {
			alert(JSON.stringify(e));
		}
	});
}



	
</script>
</head>
<body>
<h1>[상담 연결]</h1>
<p>지역을 선택하세요.</p>
<span><select id="region">
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
</select></span><br>
<div id="hospital" style="height:200px; width:auto;">
</div>
<div id="map" style="width:500px;height:400px;">


</div>
</body>
</html>