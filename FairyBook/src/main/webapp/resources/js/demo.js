
var pageflip = new RocketPageFlip('.pageflip', { current: 0 });

function buildNav(){
	
	var str = $('.pageflip').html();
	str += '<div class="page" style="background: #209657 url(\'./../resources/img/scene/';
	str += 'scene05.jpg';
	str += '\') no-repeat center center; background-size: 100%;"></div>';
	
	str += '<div class="page" style="background: #209657 url(\'./../resources/img/scene/';
	str += 'scene06.jpg';
	str += '\') no-repeat center center; background-size: 100%;"></div>';
	
	//str += '<a class="flip-directional flip-next" href="#">다음</a>';
	//str += '<div class="flip-navigation"></div>';
	
	
	$('.pageflip').html(str);
	
	pageflip.buildNavigation();
	
	pageflip.showCurrent();
	alert(str);
}

/*
 * imgsource : 동화페이지 이미지 파일 이름 (ex. scene12.jpg)
 * 이미지경로를 받아 새로운 페이지를 만들고 그 페이지로 이동한다.
 */
function changePage(imgsource){
	
	
	var str = $('.pageflip').html();
	
	str += '<div class="page page-current" style="background: #209657 url(\'./../resources/img/scene/';
	str += imgsource;
	str += '\') no-repeat center center; background-size: 100%;"></div>';
	
	$('.pageflip').html(str);
	
	pageflip = new RocketPageFlip('.pageflip', { current: 0 });
}

/*function changePage(){
	var str = $('.pageflip').html();
	str += '<div class="page" style="background: #209657 url(\'./../resources/img/scene/';
	str += 'scene12.jpg';
	str += '\') no-repeat center center; background-size: 100%;"></div>';
	
	str += '<div class="page" style="background: #209657 url(\'./../resources/img/scene/';
	str += 'scene13.jpg';
	str += '\') no-repeat center center; background-size: 100%;"></div>';
	
	$('.pageflip').html(str);
	
	pageflip = new RocketPageFlip('.pageflip', { current: 0 });
}*/
