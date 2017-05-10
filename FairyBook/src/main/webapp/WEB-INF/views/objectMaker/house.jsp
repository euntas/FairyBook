<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>집 만들기</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/house.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">
<script src="../resources/js/jquery-3.1.1.min.js"></script>
<script src="../resources/js/jquery-3.1.1.js"></script>
<script src="../resources/js/house.js"></script>
<link rel="stylesheet" href="../resources/css/alertify.core.css" />
<link rel="stylesheet" href="../resources/css/alertify.default.css" id="toggleCSS" />
<script src="../resources/js/alertify.min.js"></script>

<!--적용 자바스크립트와 스타일  -->
<script>

//save버튼을 누르면 완성된 집을 DB에 저장한다
function save(){
	var roof = $('#roof').attr('num');
	var door = $('#door').attr('num');
	var window = $('#window').attr('num');
	var chimney = $('#chimney').attr('num');
	var yard = $('#yard').attr('num');
	var wall = $('#wall').attr('num');
	var roofColor = $('#roof').attr('name').split('Color')[1];
	var wallColor = $('#wall').attr('name').split('Color')[1];
	
	var arr = ['Black', 'Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Purple','White','Gray'];
	for(var i in arr){
		if(roofColor == arr[i]){
			roofColor = i;
		}
		if(wallColor == arr[i]){
			wallColor = i;
		}
	}
	if(roofColor == null){
		roofColor = 0;
	}
	if(wallColor == null){
		wallColor = 0;
	}
	
	alertify.confirm('저장하시겠습니까?', function(e){
		if(e){
			$.ajax({
				url: 'saveHouse',
				type: 'POST',
				data: {roof:roof,door:door,window:window,chimney:chimney,yard:yard,wall:wall,roofColor:roofColor,wallColor:wallColor},
				success: function(){
					$.ajax({
		              url:'../story/saveSD',
		              type:'GET',
		              async: false,
		              data: {pageNum: 1},
		              dataType:'json',
		              success: function(){
		                 location.href='../story/storyStart?storyNum=' + ${currentStoryNum};
		              },
		              error: function(e){
						//alert("플립 실패 들어옴");
		               // alert(JSON.stringify(e)); 
		              }
		          });
				},
				error: function(e){
				//	alert(JSON.stringify(e));
				}
			});	
		}
	});
}
</script>


<body id="bodytag">

<!-- 만들어진 집이 보이는 div 태그 -->
<div id="house">
<input type="button" id="resetbtn">

	<!-- 저장버튼 및 초기화버튼이 보이는 div태그 -->
	<div id="saveArea">
	<input type="button" id="savebtn">
	<input type="button" id="helpbtn">
	</div>
</div>

<!-- 집 부위 선택하는 대분류 div태그 -->
<div id="category">
<input id="wallbtn" class="category" type="button"><input id="roofbtn" class="category" type="button"><input id="doorbtn" class="category" type="button"><input id="windowbtn" class="category" type="button"><input id="chimneybtn" class="category" type="button"><input id="yardbtn" class="category" type="button">
</div>

<!-- 실제로 쓸 부위 선택하는 소분류 div태그 -->
<div id="detail">
<img src="../resources/img/util/selectbtn.png">
	<span id="color">
	</span>

	<br>
	<!-- 색깔 선택하는 span태그 -->
	<span id="items">
	</span>
</div>
</body>
</html> 