<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#avatar{
	position: absolute;
	width : 1000px;
	height: 600px;
	border: 1px solid black;
	left: 250px;
	top: 100px;
}
#category{
	position: absolute;
	width : 1000px;
	height: 80px;
	border: 1px solid black;
	left: 250px;
	top: 620px;
}
#detail{
	position: absolute;
	width : 800px;
	height: 200px;
	border: 1px solid black;
	left: 250px;
	top: 700px;
}
#color{
	position: absolute;
	width : 200px;
	height: 200px;
	border: 1px solid black;
	left: 1050px;
	top: 700px;
}
.color{
	width : 66px;
	height: 66px;
}
.category{
	width : 111px;
	height: 80px;

}
#red{
	background-color: red;
}
#orange{
	background-color: orange;
}
#yellow{
	background-color: yellow;
}
#green{
	background-color: green;
}
#blue{
	background-color: blue;
}
#purple{
	background-color: purple;
}
#white{
	background-color: white;
}
#gray{
	background-color: gray;
}
#black{
	background-color: black;
}
</style>

<meta charset="UTF-8">
<title>아바타 만들기</title>
</head>
<body>

<h1>아바타를 만들어 보아영</h1>

<div id="avatar">
여기에 만들어진 아바타
</div>

<div id="category">
<input class="category" type="button" value="얼굴"><input class="category" type="button" value="헤어"><input class="category" type="button" value="눈"><input class="category" type="button" value="코"><input class="category" type="button" value="입"><input class="category" type="button" value="귀"><input class="category" type="button" value="목"><input class="category" type="button" value="몸"><input class="category" type="button" value="피부">
</div>

<div id="detail">
여기가 소분류 직접 선택하는거
</div>

<div id="color">
<input id="red" class="color" type="button"><input id="orange" class="color" type="button"><input id="yellow" class="color" type="button"><br>
<input id="green" class="color" type="button"><input id="blue" class="color" type="button"><input id="purple" class="color" type="button"><br>
<input id="white" class="color" type="button"><input id="gray" class="color" type="button"><input id="black" class="color" type="button">
</div>

</body>
</html>