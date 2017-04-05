<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>

<!-- 스크릿샷 테스트  -->
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
<!-- 스트린샷 테스트 -->




<script type="text/javascript">
$(init);

	function init() {
		$('#yo').draggable();
		$('#hiyoko').draggable();
		$('#hansel').draggable();
		$('#gretel').draggable();
		$('#gugugugu').draggable();
		$('#emblem').draggable();

	}
</script>

<style>

#bookcover {
	width: 421px;
	height: 595px;
	padding: 10px;
	border: 2px solid blue;
}


#makemenu {
	margin: 0 auto;
	border: 2px solid red;
}
/* #obj {
	border: 1px solid #aaaaaa;
} */
</style>

</head>
<body>
	<h1> 그냥 돈주고 사면 안되겠니?</h1>
<br>	
<div id="bookcover"><img src="../resources/img/book/titletest.jpg">
	<br>	
	<br>	
	<br>	
	<br>	
<!-- 스크린샷 테스트1 -->
<div id="makemenu">
<table>
<tr>
<td id='obj'><img src="../resources/img/book/yo.jpg" id='yo' width='100' height='100'></td>
<td id='obj'><img src="../resources/img/book/hiyoko.png" id='hiyoko' width='100' height='100'></td>
<td id='obj'><img src="../resources/img/book/hansel.png" id='hansel' width='100' height='100'></td>
<td id='obj'><img src="../resources/img/book/gretel.png" id='gretel' width='100' height='100'></td>
<td id='obj'><img src="../resources/img/book/gugugugu.jpg" id='gugugugu' width='100' height='100'></td>
<td id='obj'><img src="../resources/img/book/emblem.png" id='emblem' width='100' height='100'></td>
</tr>
</table>
</div>
</div>

	<input type="button" value="Take Screenshot Of Div" onclick="capture();" />
<br>


</body>
</html>