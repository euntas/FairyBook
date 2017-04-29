<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>Make Cover</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<script src="../resources/js/html2canvas.js"></script>

<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">
<link rel="stylesheet" href="../resources/css/main.css">

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
.hanna{
	font-family: 'Hanna', fantasy;
}
#makeCoverContainer{
	padding-left: 17%;
}
#cover{
	
     border : 1px solid gray;
     display : inline-block;
     height : 600px;
     text-align : center;
     width : 400px;
     position: relative;
}
#itemsForC{
	overflow-y:scroll;
	margin-top: 50px;
	 border-radius : 7px;
     border : 5px solid gray;
     display : inline-block;
     float: right;
     height : 500px;
     position : relative;
     width : 480px;
}
canvas{
	display:none;
}
</style>

<script>

	$(function(){
		//profile사진 경로 설정
		$('#profile').attr('src','../resources/image/yo.jpg');

		//login버튼 이벤트
		$('#login').on('click',function(){
			location.href='../id/login';
		});
		//join버튼 이벤트
		$('#join').on('click',function(){
			location.href='../id/join';
		});
		//logout버튼 이벤트
		$('#logout').on('click',function(){
			if(confirm('로그아웃 하시겠습니까?'))
				location.href='../id/logout';
		});
		$('#update').on('click',function(){
			location.href='../id/userInfo';
		});
		
		
		//동화 선택 버튼 마우스오버
		$('#storyselect').on('mouseover',function(){
			$("#storyselect").attr('src',"../resources/image/icon/storyselect1.png");
		});
		
		//동화 선택 버튼 마우스아웃
		$('#storyselect').on('mouseout',function(){
			$("#storyselect").attr('src',"../resources/image/icon/storyselect.png");
		});
		
		//동화 감상 버튼 마우스오버
		$('#storyplay').on('mouseover',function(){
			$("#storyplay").attr('src',"../resources/image/icon/storyplay1.png");
		});
		
		//동화 감상 버튼 마우스아웃
		$('#storyplay').on('mouseout',function(){
			$("#storyplay").attr('src',"../resources/image/icon/storyplay.png");
		});
		
		//퀴즈 풀기 버튼 마우스오버
		$('#quizlist').on('mouseover',function(){
			$("#quizlist").attr('src',"../resources/image/icon/quizlist1.PNG");
		});
		
		//퀴즈 풀기 감상 버튼 마우스아웃
		$('#quizlist').on('mouseout',function(){
			$("#quizlist").attr('src',"../resources/image/icon/quizlist.png");
		});
		
		//내 아이 동화목록 버튼 마우스오버
		$('#mychildstory').on('mouseover',function(){
			$("#mychildstory").attr('src',"../resources/image/icon/mychildstory1.png");
		});
		
		//내 아이 동화목록 버튼 마우스아웃
		$('#mychildstory').on('mouseout',function(){
			$("#mychildstory").attr('src',"../resources/image/icon/mychildstory.png");
		});
		
		//게시판 버튼 마우스오버
		$('#board').on('mouseover',function(){
			$("#board").attr('src',"../resources/image/icon/board1.PNG");
		});
		
		//게시판 버튼 마우스아웃
		$('#board').on('mouseout',function(){
			$("#board").attr('src',"../resources/image/icon/board.png");
		});
		
		//상담 결과 보기 버튼 마우스오버
		$('#counselresult').on('mouseover',function(){
			$("#counselresult").attr('src',"../resources/image/icon/counselresult1.png");
		});
		
		//상담 결과 보기 버튼 마우스아웃
		$('#counselresult').on('mouseout',function(){
			$("#counselresult").attr('src',"../resources/image/icon/counselresult.png");
		});
		
		//장바구니 목록 버튼 마우스오버
		$('#ordercart').on('mouseover',function(){
			$("#ordercart").attr('src',"../resources/image/icon/ordercart1.png");
		});
		
		//장바구니 목록 버튼 마우스아웃
		$('#ordercart').on('mouseout',function(){
			$("#ordercart").attr('src',"../resources/image/icon/ordercart.png");
		});
		
		//주문 내역 버튼 마우스오버
		$('#confirmorder').on('mouseover',function(){
			$("#confirmorder").attr('src',"../resources/image/icon/confirmorder1.png");
		});
		
		//주문 내역 버튼 마우스아웃
		$('#confirmorder').on('mouseout',function(){
			$("#confirmorder").attr('src',"../resources/image/icon/confirmorder.png");
		});
		
		
		//login mouseover 이벤트
		$('#login').on('mouseover',function(){
			$('#login').css('cursor', 'pointer');
			$("#login").attr('src',"../resources/image/icon/loginbt1.png");
		});
		
		//login mouseout 이벤트
		$('#login').on('mouseout',function(){
			$("#login").attr('src',"../resources/image/icon/loginbt.png");
		}); 
		
		//join mouseover 이벤트
		$('#join').on('mouseover',function(){
			$('#join').css('cursor', 'pointer');	
			$("#join").attr('src',"../resources/image/icon/joinbt1.png");
		});
		
		//join mouseout 이벤트
		$('#join').on('mouseout',function(){
			$("#join").attr('src',"../resources/image/icon/joinbt.png");
		});
		
		//logout 커서 이벤트
		$('#logout').on('mouseover',function(){
			$('#logout').css('cursor', 'pointer');
			$("#logout").attr('src',"../resources/image/icon/logoutbt1.png");

		});
		
		//logout mouseout 이벤트
		$('#logout').on('mouseout',function(){
			$("#logout").attr('src',"../resources/image/icon/logoutbt.png");
		});
		
		//update 커서 이벤트
		$('#update').on('mouseover',function(){
			$('#update').css('cursor', 'pointer');
			$("#update").attr('src',"../resources/image/icon/userinfobt1.png");

		});
		
		//update mouseout 이벤트
		$('#update').on('mouseout',function(){
			$("#update").attr('src',"../resources/image/icon/userinfobt.png");
		});
		init();
	});
	
	function init(){
		$.ajax({
			url:'getCoverResources',
			type:'GET',
			data:{ordernum:${ordernum}},
			dataType:'json',
			success: coverResources,
			error: function(e){
				alert(JSON.stringify(e));
			}
		});
	}
	
	//사진 불러오기
	function coverResources(paths){
		var bg = "<div class='well well-sm hanna'>원하는 배경을 클릭하세요!</div>";
		var ch = "<div class='well well-sm hanna'>원하는 캐릭터를 클릭한 후 드래그해보세요!</div>";
		var tt = "<div class='well well-sm hanna'>원하는 타이틀을 클릭하세요!</div>";
		$.each(paths,function(i,p){
			console.log(p.TYPE);
			if (p.TYPE == 'background') {
				console.log(p.PATH);
				bg += "<img src='"+p.PATH+"' width='200px' sel='bg'> ";
			}else if(p.TYPE == 'title'){
				tt += "<img src='"+p.PATH+"' width='200px' height='auto' sel='tt'> ";
			}else if(p.TYPE == 'character'){
				ch += "<img src='"+p.PATH+"' width='200px' sel='ch'> ";
			}
		});
		$('#cover_bg').html(bg);
		$('#cover_ch').html(ch);
		$('#cover_tt').html(tt);
		$('img').on('click',selected);
	}
	
	//메뉴에서 사진 선택했을 때
	function selected(){
		var selectedImg = $(this);
		var input = $('#cover').html();
		if (selectedImg.attr('sel') == 'bg') { //배경일때
			$('#cover').css('background-image','url("'+selectedImg.attr('src')+'")');
			$('#cover').css('background-size','100% 100%');
		}else if(selectedImg.attr('sel') == 'tt'){ //제목
			input += "<div class='selected ui-widget-content' style='display:inline-block;background-image: url("
			input += '"'+selectedImg.attr('src')+'"';
			input += ");width: 300px;height: 80px;border: 0px solid #c5c5c5;' onmouseover='javascript:editImg($(this))'></div>"; //onmouseover='javascript:editImg()'
		}else{ //캐릭터 일때
			input += "<div class='selected ui-widget-content' style='display:inline-block;background-image: url("
			input += '"'+selectedImg.attr('src')+'"';
			input += ");width: 150px;height: 150px;border: 0px solid #c5c5c5;' onmouseover='javascript:editImg($(this))'></div>"; //onmouseover='javascript:editImg()'
		}
		$('#cover').html(input);
		$('.selected').css('background-color','transparent');
		$('.selected').css('background-size','contain');
		$('.selected').css('background-repeat','no-repeat');
		$('.selected').dblclick(deleteItem); //더블클릭하면 삭제
	}
	
	function editImg(a){
		a.resizable();
		a.resizable({
			aspectRatio: true,
			ghost: true,
			helper: "resizable-helper"
			//autoHide: true
			//containment: '.container'
		});
		a.resizable( "option", "aspectRatio", true );
		a.resizable( "enable" ); 
		a.draggable({
			containment: '.container'
		}); //사이즈 조절, 드래그 가능
	} 
	
	//더블클릭시 cover에서 제거
	function deleteItem(){
		if (confirm('삭제하시겠습니까?')) {
			$(this).remove();
		}
	}
	
	function capture() {
        $("canvas").remove();
        html2canvas($("#cover"), {
              onrendered: function(canvas) {
                document.body.appendChild(canvas);
                
                $("#imgSrc").val(canvas.toDataURL("image/png")); //이미지 파일 만들어서 input에 넣기
            	//표지 생성되면 책 주문하기 버튼 활성화
               
            	order();
              }
        }); //html2canvas
    }  
	
	function order(){
		var form = $('#capturedForm');
		 $.ajax({
             type:"post",
             data : $("form").serialize(),
             url:     "saveCover",
             error: function(a, b, c){
            	 form.submit();
                // alert("fail!!");
             },
             success: function (data) {
            	 form.submit();
                 try{
                 }catch(e){                
                     alert('server Error!!');
                 }
             }
         }); //ajax
	}
</script>

<title>Make Cover</title>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--배너  -->
<nav class="navbar-fixed-top">
<div style="background-image: url('../resources/image/icon/banner.png');width: 100%;height: 100px;">
 <center><a href="../"><img src="../resources/image/icon/bannertitle.png" style="margin-top: 15px;"></a></center>
</div>
</nav>

<div id="under">
<!-- Side Navigation -->
<!--로그인하지 않았을 때  -->
<c:if test="${loginUser == null }">
<nav class="w3-sidebar w3-bar-block w3-collapse w3-animate-left w3-card-2" style="z-index:3;width:220px;background-image: url('../resources/image/icon/menubar.png');" id="mySidebar">
<div style="background-image: url('../resources/image/icon/userbar.png');">
  <center>
  <img src="../resources/image/icon/pleaselogin.png">
  <img src="../resources/image/pp3.jpg" alt="img" style="width: 150px;" class="img-responsive img-circle" style="display:inline-block;"><br><!--circle image  -->
  <img src="../resources/image/icon/loginbt.png" id="login">
 <img src="../resources/image/icon/joinbt.png" id="join">
  </center>
  <br><br>
  
  
  
  </div>
  <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu" 
  class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
  
  <!-- <a href="../menu/storySelect" class="w3-bar-item w3-button"><i class="fa fa-paper-plane w3-padding-right"></i>동화선택</a>
  <a href="../menu/storyPlay" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>동화감상</a>
 -->
 <a href="../menu/storySelect"><img src="../resources/image/icon/storyselect.png" id="storyselect"></a>
 <br><br>
<a href="../menu/storyPlay"><img src="../resources/image/icon/storyplay.png" id="storyplay"></a>
 <br><br>
</nav>
</c:if>
<!--로그인 했을 때  -->
<c:if test="${loginUser != null }">
<!--아이로그인  -->
<c:if test="${userType == 'child'}"> <!--w3-animate-left   -->
<nav class="w3-sidebar w3-bar-block w3-collapse w3-animate-left w3-card-2" style="z-index:3;width:220px;background-image: url('../resources/image/icon/menubar.png');" id="mySidebar">
<div style="background-image: url('../resources/image/icon/userbar.png');">
  <center>
  <h3>${loginUser.cnickName}</h3>
  <img src="../resources/image/yo.jpg" alt="img" style="width: 150px;" class="img-responsive img-circle" style="display:inline-block;"><br><!--circle image  -->
  <img src="../resources/image/icon/userinfobt.png" id="update">
 <img src="../resources/image/icon/logoutbt.png" id="logout">
  </center>
  <br><br>
  </div>
  <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu" 
  class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
  
  
  
  <!-- <a href="../menu/storySelect" class="w3-bar-item w3-button"><i class="fa fa-paper-plane w3-padding-right"></i>동화선택</a>
  <a href="../menu/storyPlay" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>동화감상</a>
  <a href="../quiz/quizList" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>문제풀기</a>
   -->
   <a href="../menu/storySelect"><img src="../resources/image/icon/storyselect.png" id="storyselect"></a>
 <br><br>
 <a href="../menu/storyPlay"><img src="../resources/image/icon/storyplay.png" id="storyplay"></a>
 <br><br>
 <a href="../quiz/quizList"><img src="../resources/image/icon/quizlist.png" id="quizlist"></a>
  
</nav>
</c:if>
<!--부모 로그인했을때  -->
<c:if test="${userType == 'parent'}">
<nav class="w3-sidebar w3-bar-block w3-collapse w3-animate-left w3-card-2" style="z-index:3;width:220px;background-image: url('../resources/image/icon/menubar.png');" id="mySidebar">
<div style="background-image: url('../resources/image/icon/userbar.png');">
  <center>
  <h3>${loginUser.pnickName}</h3>
  <img src="./../resources/image/pp4.jpg" alt="img" style="width: 150px;" class="img-responsive img-circle" style="display:inline-block;"><br><!--circle image  -->
   <img src="../resources/image/icon/userinfobt.png" id="update">
 <img src="../resources/image/icon/logoutbt.png" id="logout">
  </center>
  <br><br>
  
  
  </div>
  <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu" 
  class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
  
  <!-- <a href="../menu/myChildStory" class="w3-bar-item w3-button"><i class="fa fa-paper-plane w3-padding-right"></i>내 아이 동화 목록</a>
  <a href="../pboard/listForm" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>게시판</a>
  <a href="../menu/counselResult" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>상담요청 결과보기</a>
  <a href="../orderBook/orderCart" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>장바구니</a>
  <a href="../orderBook/confirmOrder" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>주문내역</a>
   -->
   <a href="../menu/myChildStory"><img src="../resources/image/icon/mychildstory.png" id="mychildstory"></a>
  <br><br>
  <a href="../pboard/listForm"><img src="../resources/image/icon/board.png" id="board"></a>
  <br><br>
  <a href="../menu/counselResult"><img src="../resources/image/icon/counselresult.png" id="counselresult"></a>
  <br><br>
  <a href="../orderBook/orderCart"><img src="../resources/image/icon/ordercart.png" id="ordercart"></a>
  <br><br>	
  <a href="../orderBook/confirmOrder"><img src="../resources/image/icon/confirmorder.png" id="confirmorder"></a>
  
  
</nav>
</c:if>
</c:if>

<!-- Modal that pops up when you click on "New Message" -->
<div id="id01" class="w3-modal" style="z-index:4">
  <div class="w3-modal-content w3-animate-zoom">
    <div class="w3-container w3-padding w3-red">
       <span onclick="document.getElementById('id01').style.display='none'"
       class="w3-button w3-red w3-right w3-xxlarge"><i class="fa fa-remove"></i></span>
      <h2>Send Mail</h2>
    </div>
    <div class="w3-panel">
      <label>To</label>
      <input class="w3-input w3-border w3-margin-bottom" type="text">
      <label>From</label>
      <input class="w3-input w3-border w3-margin-bottom" type="text">
      <label>Subject</label>
      <input class="w3-input w3-border w3-margin-bottom" type="text">
      <input class="w3-input w3-border w3-margin-bottom" style="height:150px" placeholder="What's on your mind?">
      <div class="w3-section">
        <a class="w3-button w3-red" onclick="document.getElementById('id01').style.display='none'">Cancel  <i class="fa fa-remove"></i></a>
        <a class="w3-button w3-right" onclick="document.getElementById('id01').style.display='none'">Send  <i class="fa fa-paper-plane"></i></a> 
      </div>    
    </div>
  </div>
</div>

<!-- Overlay effect when opening the side navigation on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="Close Sidemenu" id="myOverlay"></div>

</div>


<!--####################여기부터  -->
<div class="container" id="makeCoverContainer">
<h1 class="hanna">[ 표지 꾸미기 ]</h1>
<!--꾸밀 표지  -->
<div class="container" id="cover"></div>

<!--꾸밀 아이템  -->
<div class="container" id="itemsForC">
	<ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" class="hanna" href="#cover_bg" onclick="javascript:init();">배경</a></li>
    <li><a data-toggle="tab" class="hanna" href="#cover_tt" onclick="init();">타이틀</a></li>
    <li><a data-toggle="tab" class="hanna" href="#cover_ch" onclick="javascript:init();">캐릭터</a></li>
 	 </ul>
  <div class="tab-content">
    <div id="cover_bg" class="tab-pane fade in active"></div>
    <div id="cover_tt" class="tab-pane fade"></div>
    <div id="cover_ch" class="tab-pane fade"></div>
    <div id="menu3" class="tab-pane fade"></div>
  </div>
</div>
<br>


<!--표지 완성 확인 버튼  -->
<div style="padding-left:35%;">
<button type="button" class="btn btn-success hanna" id="makeCover" onclick="capture();">저장하기</button>
</div>

<!-- 생성된 표지 -->
<form id="capturedForm" action="order" method="post">
<input type="hidden" name="imgSrc" id="imgSrc" />
<input type="hidden" name="ordernum" id="ordernum" value="${ordernum}"/>
</form>

</div>
<!--여기까지###########################  -->


<!--Footer  -->
<%-- <c:import url="../main/mainFooter.jsp"></c:import> --%>

</body>
</html> 