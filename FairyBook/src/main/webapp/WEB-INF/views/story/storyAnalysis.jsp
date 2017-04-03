<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>StoryAnalysis</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--적용 자바스크립트와 스타일  -->
<style>
.morris-hover{position:absolute;z-index:1000}.morris-hover.morris-default-style{border-radius:10px;padding:6px;color:#666;background:rgba(255,255,255,0.8);border:solid 2px rgba(230,230,230,0.8);font-family:sans-serif;font-size:12px;text-align:center}.morris-hover.morris-default-style .morris-hover-row-label{font-weight:bold;margin:0.25em 0}
.morris-hover.morris-default-style .morris-hover-point{white-space:nowrap;margin:0.1em 0}

</style>
<script>
$.getScript('http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js',function(){
	$.getScript('http://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.0/morris.min.js',function(){
		 Morris.Donut({
		        element: 'donut-example',
		        data: [
		         {label: "Android", value: 12},
		         {label: "iPhone", value: 30},
		         {label: "Other", value: 20}
		        ]
		      });
	});
});
</script>

<link class="include" rel="stylesheet" type="text/css" href="../resources/jqplot/jquery.jqplot.min.css"/>
<script src="../resources/jqplot/jquery.jqplot.min.js"></script>
<script src="../resources/jqplot/plugins/jqplot.pieRenderer.js"></script>


<script>
 $(function(){
	 $.jqplot ('graph', [[['첫번째', 50], ['두번째', 22], ['세번째', 38], ['네번째', 30]]], //[항목, 수치]
		        {
		          seriesDefaults: {
		            //원형으로 렌더링
		            renderer: $.jqplot.PieRenderer,
		            //원형상단에 값보여주기(알아서 %형으로 변환)
		            rendererOptions: {
		              showDataLabels: true
		            }
		          },
		          //우측 색상별 타이틀 출력
		          legend: { show:true, location: 'e' }
		        }
		);
 });
</script>

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<!--상단, 사이드 메뉴  -->
<c:import url="../main/main.jsp"></c:import>
<!-- Page content -->
<div class="w3-main" style="margin-left:230px;">
	<i class="fa fa-bars w3-button w3-white w3-hide-large w3-xlarge w3-margin-left w3-margin-top" onclick="w3_open()"></i>
	
<!--####################여기부터  -->

<div class="container-fluid">
  <div class="row">
    <div class="col-sm-12">
    	<h3>Morris Charts Example</h3>  
    </div>
  </div><!--/row-->
  <hr>
  <div class="row">
    <div class="col-md-6">
        <div id="donut-example" style="height: 250px;"></div>
    </div>
  </div>
</div>

<div id="graph" style="width:300px; height:300px;"></div>


<!--여기까지###########################  -->

</div>

<!--Footer  -->
<c:import url="../main/mainFooter.jsp"></c:import>

</body>
</html> 
