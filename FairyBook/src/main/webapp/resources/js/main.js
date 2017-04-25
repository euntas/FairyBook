/**
 * home과 같이 경로 추가되지 않았을때
 */

$(function(){
	//profile사진 경로 설정
	$('#profile').attr('src','../resources/image/pp3.jpg')

	//login버튼 이벤트
	$('#login').on('click',function(){
		location.href='./id/login';
	});
	//join버튼 이벤트
	$('#join').on('click',function(){
		location.href='./id/join';
	});
	//logout버튼 이벤트
	$('#logout').on('click',function(){
		if(confirm('로그아웃 하시겠습니까?'))
			location.href='./id/logout';
	});
	//update버튼 이벤트
	$('#update').on('click',function(){
		location.href='./id/userInfo';
	});
	//banner클릭시 home으로 이동
	$('#banner').on('click',function(){
		location.href='../';
	});
});

function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

function myFunc(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show"; 
        x.previousElementSibling.className += " w3-red";
    } else { 
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-red", "");
    }
}
