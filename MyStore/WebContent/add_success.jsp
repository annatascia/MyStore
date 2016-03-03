<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add success</title>
<script type="text/javascript">

var attime=5;
function timer(){
  document.getElementById("timer").value =  "this window will close after " + attime + " seconds"; 
  attime=attime-1;
	 if(attime==-1){
		 window.close();
	 }
}
setInterval(timer,1000);
</script>
</head>


<body>
<center>
<h1 style="color:red;">add success!</h1>
<input type="text" id="timer" size="30px"><br>
<input type="button" onclick="window.close()" value="or click here to close the window">
</center>
</body>
</html>