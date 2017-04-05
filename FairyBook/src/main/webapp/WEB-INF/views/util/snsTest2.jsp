<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>FairyBook</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--적용 자바스크립트와 스타일  -->

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!-- 페이스북 로그인 연결 -->
<script>

var accessToken;

  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      accessToken = response.authResponse.accessToken;
      testAPI();
    } else {
      // The person is not logged into your app or we are unable to tell.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
      accessToken = response.authResponse.accessToken;
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '176801956172556',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    oauth: true,
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.8' // use graph api version 2.8
  });

  // Now that we've initialized the JavaScript SDK, we call 
  // FB.getLoginStatus().  This function gets the state of the
  // person visiting this page and can return one of three states to
  // the callback you provide.  They can be:
  //
  // 1. Logged into your app ('connected')
  // 2. Logged into Facebook, but not your app ('not_authorized')
  // 3. Not logged into Facebook and can't tell if they are logged into
  //    your app or not.
  //
  // These three cases are handled in the callback function.

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  }
  
  function myWrite(){
	  FB.api('/me/feed', 'post', { message: '글써라!!!!'});
  }
  
  function myVideoWrite(){
	  FB.api(
			    "/me/videos",
			    "POST",
			    {	  
					message: "테스트로 동영상 올리기4",
					description: "테스트용 영상입니다.4",
					source: "https://player.vimeo.com/external/200092486.sd.mp4?s=613baf0e2aaeb3cd49fcc342b3fbb12f71a3acaf&profile_id=165"
					//source: "./../resources/video/star.mp4"
				  },
			    function (response) {
			      if (response && !response.error) {
			        alert('정상');
			      }
			      
			      else{
			    	  alert('에러');
			    	  alert(JSON.stringify(response.error));
			      }
			    }
			);
	  
  }
  
//UPLOAD A LOCAL IMAGE FILE, BUT THIS CAN NOT BE DONE WITHOUT USER'S MANUAL OPERATION BECAUSE OF SECURITY REASONS
  function fileUpload() {
    FB.api('/me/albums', function(response) {
      var album = response.data[0]; // Now, upload the image to first found album for easiness.
      var action_url = 'https://graph.facebook.com/' + album.id + '/photos?access_token=' +  accessToken;
      var form = document.getElementById('upload-photo-form');
      form.setAttribute('action', action_url);

      // This does not work because of security reasons. Choose the local file manually.
      // var file = document.getElementById('upload-photo-form-file');
      // file.setAttribute('value', "/Users/nseo/Desktop/test_title_03.gif")

      form.submit();
    });
  }
  
  
</script>

	

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	
<!--####################여기부터  -->
<h1>SNS - Test</h1>

<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>

<div id="status">
</div>

<br>

<button onclick="myWrite()">글쓰기 테스트</button>
<button onclick="myVideoWrite()">글쓰기(동영상 추가) 테스트</button>

<br>

<div>
  <a href="#" id="upload-trigger" onClick="javascript:fileUpload();">File Upload!</a>
  <form id="upload-photo-form" target="upload_iframe" method="post" enctype="multipart/form-data">
    <input id="upload-photo-form-file" name="file" size="27" type="file" />
  </form>
  <iframe id="upload_iframe" name="upload_iframe" witdh="0px" height="0px" border="0" style="width:0; height:0; border:none;"></iframe>
</div>

<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 
