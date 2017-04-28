<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 심리 분석 결과 원형 그래프도 나타내기 예제 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
<link class="include" rel="stylesheet" type="text/css" href="resources/jqplot/jquery.jqplot.min.css"/>
<script src="resources/jqplot/jquery.jqplot.min.js"></script>

<script src="resources/jqplot/plugins/jqplot.pieRenderer.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico">
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


<title>Insert title here</title>
</head>
<body>
<div id="graph" style="width:300px; height:300px;"></div>
</body>
</html>