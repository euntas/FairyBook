<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
var openInbox = document.getElementById("myBtn");
openInbox.click();

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

openMail("Borge")
function openMail(personName) {
    var i;
    var x = document.getElementsByClassName("person");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";
    }
    x = document.getElementsByClassName("test");
    for (i = 0; i < x.length; i++) {
       x[i].className = x[i].className.replace(" w3-light-grey", "");
    }
    document.getElementById(personName).style.display = "block";
    event.currentTarget.className += " w3-light-grey";
}
</script>

<script>
var openTab = document.getElementById("firstTab");
openTab.click();
</script>
  
  
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><style>
html,body,h1,h2,h3,h4,h5 {font-family: "RobotoDraft", "Roboto", sans-serif;}
.w3-bar-block .w3-bar-item{padding:16px}
.bg-1 { 
	    background-color: rgb(0,147,205); /* Green */
	    color: #ffffff;
	    text-align:center;
		}
.bg-2 { 
		    background-color: rgb(255,255,70); /* yellow */
		    color: rgb(0,76,112);
		    padding-top: 20px;
		    padding-bottom: 20px;
		    font-variant: small-caps;
		    letter-spacing: 5px;
		}
img{
	display: -webkit-flex;
     display: flex; /* 플렉스박스로 지정 */
     -webkit-align-items: center;
     align-items: center; /* 세로 중앙정렬 */
  	-webkit-justify-content: center;
     justify-content: center; /* 가로 중앙정렬 */
}
.navbar-nav li a:hover {
		    color: #1abc9c !important;
		}
#under{
	padding-top:100px;
}
</style>



<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--배너  -->
<nav class="navbar-fixed-top">
<div class="container-fluid bg-2 text-center">
  <h1>Fairytale Book</h1>
</div>
</nav>

<div id="under">
<!-- Side Navigation -->

<nav class="w3-sidebar w3-bar-block w3-collapse w3-white w3-animate-left w3-card-2" style="z-index:3;width:220px;" id="mySidebar">
  <div class="container-fluid bg-1">
  <h3>Who Am I?</h3>
  <img src="resources/image/yo.jpg" alt="img" style="width: 150px;" class="img-responsive img-circle" style="display:inline-block;"><br><!--circle image  -->
  <button type="button" class="btn btn-success">LOGIN</button>
  <button type="button" class="btn btn-warning">JOIN</button>
  <br><br>
  </div>
  <a href="javascript:void(0)" onclick="w3_close()" title="Close Sidemenu" 
  class="w3-bar-item w3-button w3-hide-large w3-large">Close <i class="fa fa-remove"></i></a>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-dark-grey w3-button w3-hover-black w3-left-align" onclick="document.getElementById('id01').style.display='block'">New Message <i class="w3-padding-left fa fa-pencil"></i></a>
  
  <a href="" class="w3-bar-item w3-button"><i class="fa fa-paper-plane w3-padding-right"></i>동화선택</a>
  <a href="#" class="w3-bar-item w3-button"><i class="fa fa-play-circle-o w3-padding-right" aria-hidden="true"></i>동화감상</a>
</nav>

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

<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	<a href="javascript:void(0)" class="w3-hide-large w3-red w3-button w3-right w3-margin-top w3-margin-right" onclick="document.getElementById('id01').style.display='block'"><i class="fa fa-pencil"></i></a>
	
	<div id="Borge" class="w3-container person">
	  <br>
	  <h4>이 주의 업데이트</h4>
	  <hr>
	</div>
	<!-- image -->
	 <div class="w3-row-padding w3-padding-16">
	    <div class="w3-third w3-margin-bottom">
	      <img src="resources/image/book.jpg" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>헨젤과 그레텔</h3>
	        <h6 class="w3-opacity">2017.3.22</h6>
	        <button class="w3-button w3-block w3-yellow w3-margin-bottom">Play</button>
	      </div>
	    </div>
	    <div class="w3-third w3-margin-bottom">
	      <img src="resources/image/pp1.png" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>Double Room</h3>
	        <h6 class="w3-opacity">From $149</h6>
	        <button class="w3-button w3-block w3-yellow w3-margin-bottom">Play</button>
	      </div>
	    </div>
	    <div class="w3-third w3-margin-bottom">
	      <img src="resources/image/pp3.jpg" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>Deluxe Room</h3>
	        <h6 class="w3-opacity">From $199</h6>
	        <button class="w3-button w3-block w3-yellow w3-margin-bottom">Play</button>
	      </div>
	    </div>
	  </div>

	  <div id="Borge" class="w3-container person">
	  <br>
	  <h4>다른 어린이들의 동화</h4>
	  <hr>
	  </div>
	  <div class="w3-row-padding w3-padding-16">
	    <div class="w3-third w3-margin-bottom">
	      <img src="resources/image/book.jpg" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>헨젤과 그레텔</h3>
	        <h6 class="w3-opacity">2017.3.22</h6>
	        <button class="w3-button w3-block w3-green w3-margin-bottom">Play</button>
	      </div>
	    </div>
	    <div class="w3-third w3-margin-bottom">
	      <img src="resources/image/pp1.png" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>Double Room</h3>
	        <h6 class="w3-opacity">From $149</h6>
	        <button class="w3-button w3-block w3-green w3-margin-bottom">Play</button>
	      </div>
	    </div>
	    <div class="w3-third w3-margin-bottom">
	      <img src="resources/image/pp3.jpg" alt="Norway" style="width:100%">
	      <div class="w3-container w3-white">
	        <h3>Deluxe Room</h3>
	        <h6 class="w3-opacity">From $199</h6>
	        <button class="w3-button w3-block w3-green w3-margin-bottom">Play</button>
	      </div>
	    </div>
	  </div>
</div>
</div>

<!--Add a navar  -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="#">Me</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">WHO</a></li>
        <li><a href="#">WHAT</a></li>
        <li><a href="#">WHERE</a></li>
      </ul>
    </div>
  </div>
</nav>

<footer class="container-fluid bg-4 text-center">
  <p>Made By <a href="localhost:8888/fairybook">FairyBook.com</a></p> 
</footer>



</body>
</html> 
