<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js"></script>
<script type="text/javascript">
$( init );
function init() {
  $('#yo').draggable();
  $('#hiyoko').draggable();
  $('#hansel').draggable();
  $('#gretel').draggable();


}
</script>

<style>
 #bookcover {
    width: 421px;
    height: 595px;
    padding: 10px;
    border: 1px solid #aaaaaa;
}
</style>
 
</head>
<body>
 <h1>야이씨 그냥 돈주고 사면 안되겠니?</h1>
 
<div id="bookcover"></div>
<br>
 
<table>
<tr>
<td><img src="../resources/img/book/yo.jpg" id='yo' width='100' height='100'></td>
<td><img src="../resources/img/book/hiyoko.png" id='hiyoko' width='100' height='100'></td>
<td><img src="../resources/img/book/hansel.png" id='hansel' width='100' height='100'></td>
<td><img src="../resources/img/book/gretel.png" id='gretel' width='100' height='100'></td>

</tr>

</table> 
 
</body>
</html>