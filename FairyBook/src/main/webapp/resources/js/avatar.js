// avatar.jsp 자바스크립트 파일

$(document).ready(function(){
   //id가 신체부위인 버튼을 클릭하면 해당 함수 호출
   $('#facebtn').on('click', callFace);
   $('#hairbtn').on('click', callHair);
    $('#eyebtn').on('click', callEye);
   $('#nosebtn').on('click', callNose);
   $('#mouthbtn').on('click', callMouth);
   $('#earbtn').on('click', callEar);
   $('#bodybtn').on('click', callBody);
   $('#helpbtn').on('click', help);
   //화면 사이즈에 맞게 크기 조절
   var screen1 = $(window).height();
   $("html").css("height", screen1);
   $("#bodytag").css("height", screen1);
   $("#bodytag").css("margin", "0px");
   help();
});

//얼굴 불러오기
function callFace(){
   $.ajax({
      url: 'callFace',
      type: 'GET',
      dataType: 'json',
      success: detailWithoutColor,
      error: function(e){
         alert(JSON.stringify(e));
      }
   });
}

//헤어 불러오기
function callHair(){
   $.ajax({
      url: 'callHair',
      type: 'GET',
      dataType: 'json',
      success: detailWithColor,
      error: function(e){
         alert(JSON.stringify(e));
      }
   });
}

//눈 불러오기
function callEye(){
   $.ajax({
      url: 'callEye',
      type: 'GET',
      dataType: 'json',
      success: detailWithColor,
      error: function(e){
         alert(JSON.stringify(e));
      }
   });
}

//코 불러오기
function callNose(){
   $.ajax({
      url: 'callNose',
      type: 'GET',
      dataType: 'json',
      success: detailWithoutColor,
      error: function(e){
         alert(JSON.stringify(e));
      }
   });
}

//입 불러오기
function callMouth(){
   $.ajax({
      url: 'callMouth',
      type: 'GET',
      dataType: 'json',
      success: detailWithoutColor,
      error: function(e){
         alert(JSON.stringify(e));
      }
   });
}

//귀 불러오기
function callEar(){
   $.ajax({
      url: 'callEar',
      type: 'GET',
      dataType: 'json',
      success: detailWithoutColor,
      error: function(e){
         alert(JSON.stringify(e));
      }
   });
}

//몸 불러오기
function callBody(){
   $.ajax({
      url: 'callBody',
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
   // fullName => hair02ColorRed
   var fullName = $(this).attr('id');
   // name => hair02
   var name = $(this).attr('id').split('Color')[0];
   // color => Red
   var color = $(this).attr('id').split('Color')[1];
   
   $.ajax({
      url: 'callColor',
      type: 'GET',
      data: {name:name, color:color},
      dataType: 'text',
      success: function(str){
         // hair
         $('#'+name.slice(0, -2)).attr('src', str);
         $('#'+name.slice(0, -2)).attr('name', fullName);
      },
      error: function(e){
         alert(JSON.stringify(e));
      }
   });
}


//디테일에서 선택하면 아바타가 그려진다
function draw(){
   var avatar = $('#avatar').html();
   var arr = ['face', 'nose', 'mouth', 'ear', 'hair','eye','body'];
   var colorObject = ['hair','eye','body'];
   for(var i in arr){
      if($(this).attr('name').indexOf(arr[i])!=-1){
         if(avatar.indexOf(arr[i])==-1){
            avatar += '<img src="'+$(this).attr('src')+'" num="'+$(this).attr('num')+'" name="'+$(this).attr('name')+'" id="'+arr[i]+'">';
            $('#avatar').html(avatar);
            
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
         color += '<input id="'+$(this).attr('name')+'ColorRed" class="color" type="button" style="background-image:url(\'../resources/img/util/redbtn.png\'">';
         color += '<input id="'+$(this).attr('name')+'ColorOrange" class="color" type="button" style="background-image:url(\'../resources/img/util/orangebtn.png\'">';
         color += '<input id="'+$(this).attr('name')+'ColorYellow" class="color" type="button" style="background-image:url(\'../resources/img/util/yellowbtn.png\'">';
         color += '<input id="'+$(this).attr('name')+'ColorGreen" class="color" type="button" style="background-image:url(\'../resources/img/util/greenbtn.png\'">';
         color += '<input id="'+$(this).attr('name')+'ColorBlue" class="color" type="button" style="background-image:url(\'../resources/img/util/bluebtn.png\'">';
         color += '<input id="'+$(this).attr('name')+'ColorPurple" class="color" type="button" style="background-image:url(\'../resources/img/util/purplebtn.png\'">';
         color += '<input id="'+$(this).attr('name')+'ColorWhite" class="color" type="button" style="background-image:url(\'../resources/img/util/whitebtn.png\'">';
         color += '<input id="'+$(this).attr('name')+'ColorGray" class="color" type="button" style="background-image:url(\'../resources/img/util/graybtn.png\'">';
         color += '<input id="'+$(this).attr('name')+'ColorBlack" class="color" type="button" style="background-image:url(\'../resources/img/util/blackbtn.png\'">';
      }
   }
   $('#color').html(color);
   $('#resetbtn').on('click', reset);
   $('.color').on('click', colorbtn);
   
   //모든 디테일을 선택하면 저장버튼을 활성화한다
   var count = 0;
   for(var i in arr){
      if(avatar.indexOf(arr[i])!=-1){
         count += 1;
      }
   }
   if(count == 7){
      $('#savebtn').css('display','block');
      $('#helpbtn').css('display','none');
      $('#savebtn').on('click',save);
      $('#helpbtn').on('click',help);
   }else{
      $('#savebtn').css('display','none');
      $('#helpbtn').css('display','block');
      $('#savebtn').on('click',save);
      $('#helpbtn').on('click',help);
   }
   checkSelection();
}

//내가 선택한 이미지를 강조해준다
function checkSelection(){
   var avatar = $('#avatar').html();
   var arr = ['face', 'hair', 'eye', 'nose', 'mouth', 'ear', 'body'];
   //일단 전체에 아무것도 없게 만들고
   $('#items img').css('border','none');
   for(var i in arr){
      //위의 부위가 아바타 영역에 그려져있을때
      if(avatar.indexOf(arr[i])!=-1){
         //해당 부위의 넘버를 가져와서
         var myselection = $('#'+arr[i]).attr('num');
         //그놈꺼 빨갛게
         $('#'+myselection).css('border','2px solid red');
         
      }
   }
}


//reset버튼을 누르면 그리던 아바타를 초기화한다
function reset(){
   var avatar = ''
   avatar += '<input type="button" id="resetbtn">';
   avatar += '<div id="saveArea">';
   avatar += '<input type="button" id="savebtn">';
   avatar += '<input type="button" id="helpbtn">';
   avatar += '</div>';
   $('#avatar').html(avatar);
}

//save버튼을 누르면 완성된 아바타를 저장한다
function save(){
   var face = $('#face').attr('num');
   var hair = $('#hair').attr('num');
   var eye = $('#eye').attr('num');
   var nose = $('#nose').attr('num');
   var mouth = $('#mouth').attr('num');
   var ear = $('#ear').attr('num');
   var body = $('#body').attr('num');
   var hairColor = $('#hair').attr('name').split('Color')[1];
   var eyeColor = $('#eye').attr('name').split('Color')[1];
   var bodyColor = $('#body').attr('name').split('Color')[1];
   
   var arr = ['Black', 'Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Purple','White','Gray'];
   for(var i in arr){
      if(hairColor == arr[i]){
         hairColor = i;
      }
      if(eyeColor == arr[i]){
         eyeColor = i;
      }
      if(bodyColor == arr[i]){
         bodyColor = i;
      }
   }
   
   alertify.confirm('아바타를 저장하시겠습니까?', function(e){
      if(e){
         $.ajax({
            url: 'saveAvatar',
            type: 'POST',
            async: false,
            data: {face:face,hair:hair,eye:eye,nose:nose,mouth:mouth,ear:ear,body:body,hairColor:hairColor,eyeColor:eyeColor,bodyColor:bodyColor},
            success: function(){
               location.href='house';
            },
            error: function(e){
            //alert(JSON.stringify(e));
            }
         });
      }
   });
}


// help 버튼을 누르면 도움말이 나온다
function help(){
   alertify.alert('당신의 아바타를 만들어 주세요!');
   var cw = screen.availWidth;     //화면 넓이
   var ch = screen.availHeight;    //화면 높이
   var sw = 877;    //띄울 창의 넓이
   var sh = 620;    //띄울 창의 높이
   var ml = (cw-sw)/2;        //가운데 띄우기위한 창의 x위치
   var mt = (ch-sh)/2;         //가운데 띄우기위한 창의 y위치
   window.open("help","도움말",'width=877, height=620,top='+ mt +',left='+ ml +' loaction=no, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no');
}

// opener가 누구인지 알려주는 함수
function whoAreYou(){
   return "avatar";
}