<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<script src="../resources/js/html2canvas.js"></script>

<style type="text/css">
#cover{
	margin-top: 50px;
	margin-left: 50px;
     border : 1px solid gray;
     display : inline-block;
     height : 700px;
     text-align : center;
     width : 500px;
     position: relative;
}
#itemsForC{
	margin-top: 50px;
	margin-right: 50px;
	 border-radius : 7px;
     border : 5px solid gray;
     display : inline-block;
     float: right;
     height : 500px;
     position : relative;
     width : 600px;
}
/* .selected{
	
background: #000;filter:alpha(opacity=10); opacity:0.1; -moz-opacity:0.1;

} */
/* .selected{
	background-color: transparent;
	resize: both;
 	overflow: auto;
} */
</style>

<script>
	$(function(){
		init();
	});
	
	//사진 불러오기
	function init(){
		var bg = "<img src='../resources/img/bg1.jpg' width='200px' sel='bg'>"
		bg += "<img src='../resources/img/bg2.jpg' width='200px' sel='bg'>"
		$('#cover_bg').html(bg);
		var ch = "<img src='../resources/img/book/gretel1.png' width='200px' sel='ch'>";
		ch += "<img src='../resources/img/book/hansel.png' width='200px' sel='ch'>";
		ch += "<img src='../resources/img/book/hiyoko.png' width='200px' sel='ch'>";
		ch += "<img src='../resources/img/book/yo.jpg' width='200px' sel='ch'>";
		$('#cover_ch').html(ch);
		var tt = "<img src='../resources/img/book/title1.png' width='200px' sel='tt'>";
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
			input += ");width: 400px;height: 100px;border: 0px solid #c5c5c5;' onmouseover='javascript:editImg($(this))'></div>"; //onmouseover='javascript:editImg()'
		}else{ //캐릭터 일때
			input += "<div class='selected ui-widget-content' style='display:inline-block;background-image: url("
			input += '"'+selectedImg.attr('src')+'"';
			input += ");width: 200px;height: 200px;border: 0px solid #c5c5c5;' onmouseover='javascript:editImg($(this))'></div>"; //onmouseover='javascript:editImg()'
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
			//containment: '.container'
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
        html2canvas($(".container"), {
              onrendered: function(canvas) {
                document.body.appendChild(canvas);
                
                $("#imgSrc").val(canvas.toDataURL("image/png")); //이미지 파일 만들어서 input에 넣기
            	//표지 생성되면 책 주문하기 버튼 활성화
                $('#makeOrder').removeAttr('disabled');
                
               /*  $.ajax({
                    type:"post",
                    data : $("form").serialize(),
                    url:     "saveCover",
                    error: function(a, b, c){        
                       // alert("fail!!");
                    },
                    success: function (data) {
                        try{
                        }catch(e){                
                            alert('server Error!!');
                        }
                    }
                }); //ajax */
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
<body>

<h1>[ 표지 꾸미기 ]</h1>
<!--꾸밀 표지  -->
<div class="container" id="cover"></div>

<!--꾸밀 아이템  -->
<div class="container" id="itemsForC">
	<ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#cover_bg" onclick="javascript:init();">배경</a></li>
    <li><a data-toggle="tab" href="#cover_tt" onclick="init();">타이틀</a></li>
    <li><a data-toggle="tab" href="#cover_ch" onclick="javascript:init();">캐릭터</a></li>
    <li><a data-toggle="tab" href="#menu3" onclick="init();">Menu 3</a></li>
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
<input type="button" value="표지 만들기" id="makeCover" onclick="capture();">
<input type="button" value="책 주문하기" id="makeOrder" onclick="order();" disabled="disabled">

<!-- 생성된 표지 -->
<form id="capturedForm" action="order" method="post">
<input type="hidden" name="imgSrc" id="imgSrc" />
<input type="hidden" name="ordernum" id="ordernum" value="${ordernum}"/>
</form>
</body>
</html>