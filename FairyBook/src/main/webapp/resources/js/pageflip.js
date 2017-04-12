/*
	Written by Stanko
	RocketPageFlip
	https://github.com/Stanko/rocketPageFlip
	http://www.rocketlaunch.me
*/

//==============================
// 현재 스토리 번호 저장 위함
var myStoryNum;

// myStoryNum 변수에 값을 넣어준다.
function setMyStoryNum(storyNum){
	alert(storyNum + '으로 초기화 해줌');
	myStoryNum = storyNum;
}
//================================

var RocketPageFlip;

RocketPageFlip = function(selector, options){
	var defaultOptions = {
			current: 0, // page to display
			navigation: true, // show pagination
			directionalNav: true, // show prev/next navigation buttons
			prevText: 'prev', // text for prev button
			nextText: '다음' // text for next button
	};
	
	this.rotating = false;
	
	options = options || {};
	
	this.options = $.extend(defaultOptions, options);
	
	// Main elements
	this.el = {
			main: $(selector)
	};
	
	this.el.pages = this.el.main.find('> .page');
	
	this.init();
};

RocketPageFlip.prototype.init = function() {
	this.isModernBrowser = this.supports('Transition') && this.supports('Transform') && this.supports('Perspective');
	
	this.buildNavigation();
	
	this.showCurrent();
};

RocketPageFlip.prototype.supports = function(prop) {
	var div = document.createElement('div'),
	vendors = 'Khtml Ms O Moz Webkit'.split(' '),
	len = vendors.length;
	
	if (prop in div.style) {
		return true;
	}
	
	prop = prop.replace(/^[a-z]/, function(val) {
		return val.toUpperCase();
	});
	
	while(len--) {
		if ( vendors[len] + prop in div.style ) {
			// browser supports box-shadow. Do what you need.
			// Or use a bang (!) to test if the browser doesn't.
			return true;
		}
	}
	return false;
};


RocketPageFlip.prototype.buildNavigation = function() {
	var self = this, prev, next, navigation, i;
	
	// Build prev/next buttons
	if(this.options.directionalNav){
		/*prev = $('<a>')
		.html(this.options.prevText)
		.addClass('flip-directional flip-prev')
		.attr('href', '#')
		.click(function(e){
			e.preventDefault();
			if(!self.rotating){
				self.prev();
			}
		});*/
		
		next = $('<a>')
		.html(this.options.nextText)
		.addClass('flip-directional flip-next')
		.attr('href', '#')
		.click(function(e){
			e.preventDefault();
			if(!self.rotating){
				self.next();
			}
		});
		
		this.el.main.append(prev, next);
	}
	
	// Build pagination
	// 페이지 하단의 동그란 버튼으로 되어있는 네비게이션, 테스트 끝나면 지워야 함.
	if(this.options.navigation){
		navigation = $('<div>').addClass('flip-navigation');
		
		i = 0;
		this.el.pages.each(function(){
		navigation.append($('<a>').attr('href', '#').data('page', i));
		i++;
	});

	navigation.find('a').click(function(e){
		e.preventDefault();
		if(!self.rotating){
			self.flip($(this).data('page'));
		}
	});
		
		this.el.navigation = navigation;
		this.el.main.append(navigation);
	}
};

RocketPageFlip.prototype.showCurrent = function() {
	var self = this;
	
	this.el.pages.hide().eq(this.options.current).show();
	
	if(this.options.navigation){
		self.el.navigation.find('a')
		.removeClass('active')
		.eq(this.options.current)
		.addClass('active');
	}
};

RocketPageFlip.prototype.flip = function(page) {
	var backwards,
	prev,
	next,
	leftHalf,
	rightHalf,
	flipPart,
	flipPartFront,
	flipPartBack,
	halfOverlay,
	pageOverlay,
	self = this;
	
	prevPage = this.options.current;
	
	if(prevPage === page){
		return;
	}
	// 페이지가 전체 페이지 수를 넘어가면 그냥 return.
	if(page >= this.el.pages.length){
		return;
	}
	if(page < 0){
		page = this.el.pages.length-1;
	}
	
	this.options.current = page;
	
	if(!this.isModernBrowser){
		this.showCurrent();
		return;
	}
	
	backwards = page < prevPage;
	
	halfOverlay = $('<div>').addClass('dark-overlay');
	pageOverlay = $('<div>').addClass('dark-overlay page-overlay darken');
	
	
	prev = this.el.pages.eq(this.options.current);
	next = this.el.pages.eq(prevPage);
	
	flipPartFront = $('<div>').addClass('side side-front').append(prev.clone());
	flipPartBack = $('<div>').addClass('side side-back').append(next.clone());
	
	if(backwards){
		rightHalf = $('<div>').addClass('half half-right').append(next.clone(), halfOverlay);
	}
	else{
		leftHalf = $('<div>').addClass('half half-left').append(next.clone(), halfOverlay);
	}
	
	flipPart = $('<div>').addClass('flip-part').append(flipPartFront, flipPartBack);
	
	if(backwards){
		flipPart.addClass('flipped');
	}
	else{
		flipPart.addClass('flip-reverse');
	}
	
	this.el.main.append(leftHalf, rightHalf, flipPart, pageOverlay);
	
	
	/*
	 * ================================================================
	 *  페이지마다의 문제 출력을 위한 코드  eunji 3.27
	 * ================================================================
	 */
	
	
	var currentScene, currentQuiz, quizCheck;
	
	// selectiondetail 테이블에 insert 해주어야 하는 부분
	//selectiondetail 테스트용

	 $.ajax({
	        url:'saveSD',
	        type:'GET',
	        data: {sceneNum: pageflip.options.current},
	        dataType:'json',
	        success: function(){
	        	alert("플립 성공 들어옴");
	        	alert('selectionDetail 생성1');
	        },
	        error: function(e){
	        	alert("플립 실패 들어옴");
	            alert(JSON.stringify(e));
	        }
	    });
	 
	 // 퀴즈 버튼과 퀴즈 내용 초기화
	 $("#divForQuizBtn").html('');
	 $("#divForQuiz").html(''); 
	 
	 // 퀴즈 로딩
	 quizLoading();
	 
	//=================================================================
	
	this.showCurrent();
	
	
	setTimeout(function(){
		flipPart.toggleClass('flipped');
		halfOverlay.addClass('darken');
		pageOverlay.removeClass('darken');
	}, 50);
	
	this.rotating = true;
	
	
	flipPart.on('transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd', function(e) {
		// so children doesn't trigger it
		if (e.target === flipPart.get(0)) {
			self.rotating = false;
			
			halfOverlay.remove();
			pageOverlay.remove();
			if(leftHalf){
				leftHalf.remove();
			}
			if(rightHalf){
				rightHalf.remove();
			}
			flipPart.remove();
		}
	});
};

RocketPageFlip.prototype.next = function() {
		this.flip(this.options.current + 1);
};

RocketPageFlip.prototype.prev = function() {
	this.flip(this.options.current - 1);
};


//========================== 문제 출력을 위한 함수들 eunji 3.27 ======================
// 퀴즈를 가져온다. 
function quizLoading(){
	
	$.ajax({
        url:'quizLoading',
        type:'GET',
        dataType:'json',
        data: {storyNum: myStoryNum, sceneNum: pageflip.options.current},
        success: function(quiz){
        	
        	
        	currentQuiz = quiz;
			
			// 해당 씬에 퀴즈가 있을 때
			if(currentQuiz.quizNum != -1){
				alert("퀴즈로딩 성공 들어옴 if");
				// '다음' 버튼을 숨긴다.
				$('.pageflip').find('a.flip-directional.flip-next').hide();
				
				writePreBtnForQuizDiv();
				
				// 퀴즈의 내용을 jsp에 출력한다.
				//writeQuizDiv();
			}
			
			// 해당 씬에 퀴즈가 없을 때
			else{
				alert("퀴즈로딩 성공 들어옴 else");
				// '다음' 버튼을 보이게 한다.
				$('.pageflip').find('a.flip-directional.flip-next').show();
				// 퀴즈 div의 내용을 지운다.
				$("#divForQuiz").html(''); 
			}
        },
        error: function(e){
        	// 콘트롤러에서 반환해준 quiz가 null일 경우 무조건 여기로 들어오는 듯 함. 퀴즈 없는 경우의 처리를 여기서도 해 준다.
        	
        	// '다음' 버튼을 보이게 한다.
			$('.pageflip').find('a.flip-directional.flip-next').show();
			// 퀴즈 div의 내용을 지운다.
			$("#divForQuiz").html(''); 
        }
    });
}

// 이미지 버튼을 만든다. 이 버튼을 누르면 퀴즈가 나옴.
function writePreBtnForQuizDiv(){
	var str = "<img src='./../resources/image/hiyoko.png'>";
	
	// 1초 후에 버튼이 생기게 한다.
	setTimeout(function(){
		$('#divForQuizBtn').html(str);
		
		// 마우스를 대면 그림이 바뀐다.
		$("#divForQuizBtn img").mouseover(function(){
			$(this).attr('src', './../resources/image/farian_move.gif');
		});
		$("#divForQuizBtn img").mouseout(function(){
			$(this).attr('src', './../resources/image/hiyoko.png');
		});
		
		// 클릭 이벤트를 설정한다.
		$('#divForQuizBtn').click(function(){
			// 버튼 이미지를 지운다.
			$('#divForQuizBtn').html('');
			// 퀴즈의 내용을 보인다.
			writeQuizDiv();
			// 아바타 말의 내용을 보인다.
			writeAvatarDiv();
		});
		
    }, 1000);
	
}

// 아바타 말 내용을 쓰는 함수
function writeAvatarDiv(){
	$.ajax({
        url:'getAvatarText',
        type:'POST',
        data: {currentSceneNum: pageflip.options.current},
        dataType: 'text',
        success: function(avatarText){
        	// 배경에 이미지 넣는다.
        	var str = "<img src='./../resources/image/the-button-1161316_640.png'>";
        	str += "<div class='mytext'><p>";
        	// 디비에서 읽어온 아바타 대사를 삽입.
        	str += avatarText;
        	str += "</p></div>"
        		
        		$('#divForAvatar').html(str);        	
        },
        error: function(e){
            alert("getAvatarText실패함 : " + JSON.stringify(e));
        }
    });
	
}

// 퀴즈의 내용을 쓰는 함수
function writeQuizDiv(){
	
	// 퀴즈의 내용을 읽어 jsp의 퀴즈 div에 내용을 넣어준다.
	var str = currentQuiz.question +"<br><br>";
	str += "<myselection selnum='1'>" + currentQuiz.select1 + "</myselection><br>";
	str += "<myselection selnum='2'>" + currentQuiz.select2 + "</myselection><br>";
	str += "<myselection selnum='3'>" + currentQuiz.select3 + "</myselection><br>";
	str += "<myselection selnum='4'>" + currentQuiz.select4 + "</myselection><br>";
	
	$("#divForQuiz").html(str); 
	
	$("myselection").addClass('out');
	
	// 마우스를 대면 글자 색이 바뀌게끔 한다. css는 demo.css 파일에 있다.
	$("myselection").mouseover(function(){
		$(this).addClass('over');		
	});
	$("myselection").mouseout(function(){
		$(this).removeClass('over');		
	});

	// 선택지를 클릭하면 다음 페이지 번호를 디비에서 읽어 이동한다.
	$("myselection").click(function(){
		
		// 아바타 말을 지운다.
		$('#divForAvatar').html('');
		
		var selectNum = $(this).attr('selnum');
		
		$.ajax({
	        url:'getNextSceneNum',
	        type:'GET',
	        data: {currentSceneNum: pageflip.options.current, answerNum: $(this).attr('selnum')},
	        dataType: 'json',
	        success: function(nextSceneNum){
	        	// 지금 씬이 마지막 페이지가 아닐 때.
	        	if(nextSceneNum != -1){
		        	// selectiondetail 테이블에 update 해 주어야 함.
		        	$.ajax({
		    	        url:'updateSelectiondetail',
		    	        type:'GET',
		    	        data: {sceneNum: pageflip.options.current, answerNum: selectNum},
		    	        dataType: 'json',
		    	        success: function(){
		    	        	alert('selectiondetail 업데이트--');
		    	        	
		    	        	// 다음 씬 번호를 이용해 실제 다음 페이지 번호를 읽어온다.
				        	$.ajax({
		        		        url:'getPageNum',
		        		        type:'GET',
		        		        data: {currentSceneNum: nextSceneNum},
		        		        dataType: 'json',
		        		        success: function(nextPageNum){
		        		        	alert(selectNum + '을 선택했습니다. 다음은 ' + nextSceneNum + '번 씬, ' + nextPageNum +  '번 페이지로 이동합니다.');
		        		        	// 다음페이지로 이동한다.
		        		        	pageflip.flip(nextPageNum);     
		        		        	
		        		        	return;
		        		        },
		        		        error: function(e){
		        		            alert('페이지 번호 읽어오기 실패' + JSON.stringify(e));
		        		        }
		        		    });
		    	        },
		    	        error: function(e){
		    	            alert(JSON.stringify(e));
		    	        }
		    	    });
		        	//여기까지
	        		return;
	        	}
	        	
	        	// 지금 씬이 마지막 페이지일 때
	        	else{
	        		
        			alert('else 여기로 옴 : ' + location.href);
        			
        			// 종료 화면으로 이동
        			$.ajax({
        		        url:'storyEnd',
        		        type:'GET',
        		        dataType: 'json',
        		        success: function(result){
        		        	//alert('종료화면으로 이동' + result);
        		        	
        		        },
        		        error: function(e){
        		            //alert('저장실패' + JSON.stringify(e));
        		        	// 지금 상황 : 디비에 종료 저장도 하고, "storyEnd" 라는 문자열을 반환하기는 하지만
        		        	// 무조건 error 안으로 들어온다. ajax 밖에서 처리하도록 함.
        		        }
        		    });
        			
        			// 스토리 종료 화면으로 이동하게 한다.
        			location.href = "storyEndPage";
        			
        			return;
	        	}
	        	
	        },
	        error: function(e){
	            alert(JSON.stringify(e));
	        }
	    });
    }); 
}
//=================================================================
