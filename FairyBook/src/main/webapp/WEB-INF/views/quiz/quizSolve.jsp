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
	
	function getQuizList(quizList){
		
		 var input='<table>';
		$.each(quizList, function(i,b){
			input+='<tr class="select">';
			input+='<td>'+b.question+'</td>';
			input+='</tr>';
			input+='<tr>';
			input+='<td>①</td>';
			input+='<td>'+b.select1+'</td>';
			input+='</tr>';
			input+='<tr>';
			input+='<td>②</td>';
			input+='<td>'+b.select2+'</td>';
			input+='</tr>';
			input+='<tr>';
			input+='<td>③</td>';
			input+='<td>'+b.select3+'</td>';
			input+='</tr>';
			input+='<tr>';
			input+='<td>④</td>';
			input+='<td>'+b.select4+'</td>';
			input+='</tr>';
			input+='<tr>';
			input+='<td>정답:</td>';
			input+='<td>'+b.answer+'</td>';
			input+='</tr>';
			input+='<tr>';
			input+='<td>-----------------------</td>';

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
<table border='1'>
<c:forEach var="list" items="${selectionList }">
<tr>
<td><a href="javascript:select('${list.selectionNum }');">회차별 퀴즈문제</a></td>
</tr>
</c:forEach>
</table>

<!--여기까지###########################  -->

<div id='quizda'></div>


</div>


<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 
