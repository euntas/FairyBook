/*
	Written by Stanko
	RocketPageFlip
	https://github.com/Stanko/rocketPageFlip
	http://www.rocketlaunch.me
*/


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

function quizLoading(){
	$.ajax({
        url:'quizLoading',
        type:'GET',
        dataType:'json',
        data: {storyNum: 0, sceneNum: pageflip.options.current},
        success: function(quiz){
        	currentQuiz = quiz;
			alert('퀴즈 : ' + currentQuiz.quizNum );
			
			// 퀴즈가 있을 때
			if(currentQuiz.quizNum != -1){
				writeQuizDiv();
			}
			
			// 퀴즈가 없을 때
			else{
				$("#divForQuiz").html(''); 
			}
        },
        error: function(e){
            alert(JSON.stringify(e));
        }
    });
}

function writeQuizDiv(){
	var str = currentQuiz.question +"<br><br>";
	str += "<myselection selnum='1'>" + currentQuiz.select1 + "</myselection><br>";
	str += "<myselection selnum='2'>" + currentQuiz.select2 + "</myselection><br>";
	str += "<myselection selnum='3'>" + currentQuiz.select3 + "</myselection><br>";
	str += "<myselection selnum='4'>" + currentQuiz.select4 + "</myselection><br>";
	
	$("#divForQuiz").html(str); 

	$("myselection").click(function(){
		
		var selectNum = $(this).attr('selnum');
		
		$.ajax({
	        url:'getNextSceneNum',
	        type:'GET',
	        data: {currentSceneNum: pageflip.options.current, answerNum: $(this).attr('selnum')},
	        dataType: 'json',
	        success: function(nextSceneNum){
	        	alert(selectNum + '을 선택했습니다. 다음은 ' + nextSceneNum + '번 페이지로 이동합니다.');
				pageflip.flip(nextSceneNum);
	        },
	        error: function(e){
	            alert(JSON.stringify(e));
	        }
	    });
    }); 
}
//=================================================================
