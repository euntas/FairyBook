<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table style="height:auto; width:500px; text-align: center; margin:auto; border: 1px black solid;">
<tr><td style="text-align: center; margin:auto; border: 1px black solid;">
<div onclick="document.getElementById('notyet').style.display=(document.getElementById('notyet').style.display=='none')?'block':'none';" style="cursor: pointer; margin: 0 auto; width: 100%; text-align: center;">2017년 3월 13일에 문의하신 내용입니다. <span style="color: red;">미열람</span></div><div id="notyet" style="display: none; width: 100%;">
아직 열람되지 않았습니다.</div>
</td></tr>
<tr><td style="text-align: center; margin:auto; border: 1px black solid;">
<div onclick="document.getElementById('ing').style.display=(document.getElementById('ing').style.display=='none')?'block':'none';" style="cursor: pointer; margin: 0 auto; width: 100%; text-align: center;">2017년 3월 13일에 문의하신 내용입니다. <span style="color: yellow;">상담진행중</span></div><div id="ing" style="display: none; width: 100%;">
상담이 이루어지는 중입니다.</div>
</td></tr>
<tr><td style="text-align: center; margin:auto; border: 1px black solid;">
<div onclick="document.getElementById('complete').style.display=(document.getElementById('complete').style.display=='none')?'block':'none';" style="cursor: pointer; margin: 0 auto; width: 100%; text-align: center;">2017년 3월 13일에 문의하신 내용입니다. <span style="color: green;">확인</span> </div><div id="complete" style="display: none; width: 100%;">
걱정이 많으시겠군요. 자체상담결과를 본 결과 결과적으로<br> 
가쁜 숨결과 아동심리문제의 해결과 아무런 관계가 없는 것이<br> 
이번 상담의 결과 입니다.<br> 
내원해서 치료하는 것을 권유드리는 바입니다.<br> 

우리들병원 아동심리 전문의 박결과 (010-2312-2312)</div>
</td></tr>

</table>
</body>
</html>