<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>FairyBook</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="../resources/js/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--적용 자바스크립트와 스타일  -->

<script>

	// 회차 번호에 해당하는 퀴즈 불러오기
	function select(selectionNum){
		alert(selectionNum); 
		$.ajax({
			url:'quiz',
			type: 'GET',
			data: {selectionNum: selectionNum},
			dataType: 'json',
			success: getQuizList,
			error:function(e){
				alert(JSON.stringify(e));
			}
		}); 
	}
	
	//정답 판독
	function selection(answer, sele, i){
		if (answer != sele) {
			alert("정답은 " + answer+"입니다.");
			$('#answerda' + i).html("정답: " + answer); 
			$('#answerda'+ i).css('background-color','#ff8566');
		};
	
		if (answer == sele) {
			alert("정답입니다.");
			$('#answerda' + i).html("정답: " + answer); 
			$('#answerda'+ i).css('background-color','#99ff66');
		};
	}
	
	//퀴즈 출력
	function getQuizList(quizList){
		
		 var input='<table>';
		$.each(quizList, function(i,b){
			input+='<tr class="select">';
			input+='<td style="background-color: #ccffff" width="800"><font size="5">'+b.question+'</font></td>';
			input+='</tr>';
			input+='<tr>';
			input+='<td><a href="javascript:selection(\''+b.answer+'\', '+ "1," + i +');"> ① '+'<font size="4">' +b.select1+'</font>'+'</a></td>';
			input+='</tr>';
			input+='<tr>';
			input+='<td><a href="javascript:selection(\''+b.answer+'\', '+ "2," +i+');"> ② '+'<font size="4">' +b.select2+'</font>'+'</a></td>';
			input+='</tr>';
			input+='<tr>';
			input+='<td><a href="javascript:selection(\''+b.answer+'\', '+ "3," +i+');"> ③ '+'<font size="4">' +b.select3+'</font>'+'</a></td>';
			input+='</tr> ';
			input+='<tr>';
			input+='<td><a href="javascript:selection(\''+b.answer+'\', '+ "4," +i+');"> ④ '+'<font size="4">' +b.select4+'</font>'+'</a></td>';
			input+='</tr>';
			input+='<tr>';
			input+='<td><span id="'+ 'answerda' + i +'"></span></td>';
			input+='</tr>';
		});
	$('#quizda').html(input); 
	}
	

</script>



<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	
<!--####################여기부터  -->


<!-- 회차 선택 메뉴 -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
          <p class="navbar-brand">회차를 선택해 주세요</p>
    </div>
    <ul class="nav navbar-nav">
    <c:forEach var="list" items="${selectionList}" varStatus="status">
      <li><a href="javascript:select('${list.selectionNum}');">${status.count}회차</a></li>
      </c:forEach>
    </ul>
  </div>
</nav>


<div id='quizda'></div>

<!--여기까지###########################  -->
</div>


<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 
