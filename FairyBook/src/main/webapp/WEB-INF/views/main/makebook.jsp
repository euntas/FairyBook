<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>

<!-- 표지 캡쳐 -->
<script>
	function capture() { 
		html2canvas($("#bookcover"), {
			onrendered: function(canvas) { 
				var img = canvas.toDataURL("image/png");
				console.log(img); 
				window.open(img); // 이미지를 윈도우 팝업으로..
			}
		}); 
	} 
	</script>

<script type="text/javascript">
$(document).ready(function(){
	$(init);
});
</script>


<script type="text/javascript">
	function init() {
		$('#yo').draggable();
		$('#hiyoko').draggable();
		$('#hansel').draggable();
		$('#gretel').draggable();
		$('#gugugugu').draggable();
		$('#emblem').draggable();
		$('#title1').draggable();
	}
	
</script>

<style>
#bookcover {
	width: 421px;
	height: 595px;
	border: 1px solid blue;
	background-color: white;
	margin: 10px;
}


#makemenu {
	width: 1200px;
	height: 595px;
	float: left;
}



#table {
	float: right;
	
} 

</style>

</head>
<body>
	<h1> 그냥 돈주고 사면 안되겠니?</h1>
<br>	
<div id="bookcover">
	
<!-- 스크린샷 테스트1 -->
<div id="makemenu">
<table id="table">
<tr>
<td><img src="../resources/img/book/yo.jpg" id='yo' width='100' height='100'></td>
<td><img src="../resources/img/book/hiyoko.png" id='hiyoko' width='100' height='100'></td>
<td><img src="../resources/img/book/hansel.png" id='hansel' width='100' height='100'></td>
<td><img src="../resources/img/book/gretel.png" id='gretel' width='100' height='100'></td>
<td><img src="../resources/img/book/gugugugu.jpg" id='gugugugu' width='100' height='100'></td>
<td><img src="../resources/img/book/emblem.png" id='emblem' width='100' height='100'></td>
<td><img src="../resources/img/book/title1.png" id='title1' width='100' height='100'></td>

</tr>
</table>

</div>
</div>
<br>
	<input type="button" value="표지 미리보기" onclick="capture();" />
<br>


</body>
</html>