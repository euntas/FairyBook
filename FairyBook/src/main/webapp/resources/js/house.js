$(document).ready(function(){
	//id가 집 부위인 버튼을 클릭하면 해당 함수 호출
	$('#roofbtn').on('click', callRoof);
	$('#doorbtn').on('click', callDoor);
 	$('#windowbtn').on('click', callWindow);
	$('#chimneybtn').on('click', callChimney);
	$('#yardbtn').on('click', callYard);
	$('#wallbtn').on('click', callWall);
});

//지붕 불러오기
function callRoof(){
	$.ajax({
		url: 'callRoof',
		type: 'GET',
		dataType: 'json',
		success: detailWithColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//문 불러오기
function callDoor(){
	$.ajax({
		url: 'callDoor',
		type: 'GET',
		dataType: 'json',
		success: detailWithoutColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//창문 불러오기
function callWindow(){
	$.ajax({
		url: 'callWindow',
		type: 'GET',
		dataType: 'json',
		success: detailWithoutColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//굴뚝 불러오기
function callChimney(){
	$.ajax({
		url: 'callChimney',
		type: 'GET',
		dataType: 'json',
		success: detailWithoutColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//마당 불러오기
function callYard(){
	$.ajax({
		url: 'callYard',
		type: 'GET',
		dataType: 'json',
		success: detailWithoutColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}

//벽 불러오기
function callWall(){
	$.ajax({
		url: 'callWall',
		type: 'GET',
		dataType: 'json',
		success: detailWithColor,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}


//불러온 자료를 디테일 부분에 띄운다(색 선택 부분은 안보여줌)
function detailWithoutColor(resourceList){
	var list = '';
	var color =''
	for(var i in resourceList){
		list += '<img src="'+resourceList[i].path+'" class="items" num="'+resourceList[i].resourceNum+'" name="'+resourceList[i].name+'" id="'+resourceList[i].resourceNum+'">';
	}
	$('#items').html(list);
	$('#color').html(color);
	$('.items').on('click', draw);
	$('#color').css('display','none');
	$('#detail').css('width','auto');
	
	checkSelection();
	
}

//불러온 자료를 디테일 부분에 띄운다(색 선택 부분은 보여줌)
function detailWithColor(resourceList){
	var list = '';
	var color =''
	for(var i in resourceList){
		list += '<img src="'+resourceList[i].path+'" class="items" num="'+resourceList[i].resourceNum+'" name="'+resourceList[i].name+'" id="'+resourceList[i].resourceNum+'">';
	}
	$('#items').html(list);
	$('#color').html(color);
	$('.items').on('click', draw);
	$('#color').css('display','block');
	$('#detail').css('width','auto');
	
	checkSelection();
}

//칼라 버튼을 눌렀을 때
function colorbtn(){
	var fullName = $(this).attr('id');
	var name = $(this).attr('id').split('Color')[0];
	var color = $(this).attr('id').split('Color')[1];
	
	$.ajax({
		url: 'callColor',
		type: 'GET',
		data: {name:name, color:color},
		dataType: 'text',
		success: function(str){
			$('#'+name.slice(0, -2)).attr('src', str);
			$('#'+name.slice(0, -2)).attr('name', fullName);
		},
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}


//디테일에서 선택하면 집이 그려진다
function draw(){
	var house = $('#house').html();
	var arr = ['roof', 'door', 'window', 'chimney', 'yard', 'wall'];
	var colorObject = ['roof','wall'];
	for(var i in arr){
		if($(this).attr('name').indexOf(arr[i])!=-1){
			if(house.indexOf(arr[i])==-1){
				house += '<img src="'+$(this).attr('src')+'" num="'+$(this).attr('num')+'" name="'+$(this).attr('name')+'" id="'+arr[i]+'">';
				$('#house').html(house);
			}else{
				$('#'+arr[i]).attr('src',$(this).attr('src'));
				$('#'+arr[i]).attr('num',$(this).attr('num'));
				$('#'+arr[i]).attr('name',$(this).attr('name'));
			}
		}
	}
	var color = '';
	for(var i in colorObject){
		if($(this).attr('name').indexOf(colorObject[i])!=-1){
			color += '<input id="'+$(this).attr('name')+'ColorRed" class="color" type="button" style="background-color: red;">';
			color += '<input id="'+$(this).attr('name')+'ColorOrange" class="color" type="button" style="background-color: orange;">';
			color += '<input id="'+$(this).attr('name')+'ColorYellow" class="color" type="button" style="background-color: yellow;"><br>';
			color += '<input id="'+$(this).attr('name')+'ColorGreen" class="color" type="button" style="background-color: green;">';
			color += '<input id="'+$(this).attr('name')+'ColorBlue" class="color" type="button" style="background-color: blue;">';
			color += '<input id="'+$(this).attr('name')+'ColorPurple" class="color" type="button" style="background-color: purple;"><br>';
			color += '<input id="'+$(this).attr('name')+'ColorWhite" class="color" type="button" style="background-color: white;">';
			color += '<input id="'+$(this).attr('name')+'ColorGray" class="color" type="button" style="background-color: gray;">';
			color += '<input id="'+$(this).attr('name')+'ColorBlack" class="color" type="button" style="background-color: black;">';
		}
	}
	$('#color').html(color);
	$('#resetbtn').on('click', reset);
	$('.color').on('click', colorbtn);

	//모든 디테일을 선택하면 저장버튼을 활성화한다
	var count = 0;
	for(var i in arr){
		if(house.indexOf(arr[i])!=-1){
			count += 1;
		}
	}
	if(count == 6){
		$('#savebtn').css('display','block');
		$('#savebtn').on('click',save);
	}
	
	checkSelection();
}


//내가 선택한 이미지를 강조해준다
function checkSelection(){
	var house = $('#house').html();
	var arr = ['roof', 'door', 'window', 'chimney', 'yard', 'wall'];
	//일단 전체에 아무것도 없게 만들고
	$('#items img').css('border','none');
	for(var i in arr){
		//위의 부위가 하우스 영역에 그려져있을때
		if(house.indexOf(arr[i])!=-1){
			//해당 부위의 넘버를 가져와서
			var myselection = $('#'+arr[i]).attr('num');
			//그놈꺼 빨갛게
			$('#'+myselection).css('border','2px solid red');
		}
	}
}


//reset버튼을 누르면 그리던 집을 초기화한다
function reset(){
	var house = '<input type="button" value="초기화" id="reset">';
	$('#house').html(house);
}

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
		roofColor = 7;
	}
	if(wallColor == null){
		wallColor = 7;
	}
	
	$.ajax({
		url: 'saveHouse',
		type: 'POST',
		data: {roof:roof,door:door,window:window,chimney:chimney,yard:yard,wall:wall,roofColor:roofColor,wallColor:wallColor},
		success: function(){
			alert('저장완료!');
			location.href='avatar'
		},
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
}
