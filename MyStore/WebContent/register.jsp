<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>


<script type="text/javascript" src="js/Calendar3.js"></script>
</head>
<body>
<center>
<%
if(request.getParameter("error")!=null){
	if(request.getParameter("error").equals("1")){
	%>
	username is already been used
	<%
	}
	else if(request.getParameter("error").equals("2")){
		%>
		password should be same
		<%
	}
}
%>
<br>
register now

<form action="servlet/RegisterServlet" method="post">
<table>
<tr>
<td>
username
</td>
<td>
<input type="text" name="username" /> 
</td>
</tr>
<tr>

<td>
password
</td>
<td>
<input type="password" name="password" /> 
</td>
</tr>

<tr>
<td>
confirm password
</td>
<td>
<input type="password" name="conPassword" /> 
</td>
</tr>
<tr>
<td>
gender
</td>
<td>
<input type="radio" name="gender" value="male"/>male 
<input type="radio" name="gender" value="female"/> female
</td>
</tr>
<tr>
<td>
birthday
</td>
<td>
<input name="birthday" type="text"  onclick="new Calendar().show(this);"  />
</td>
</tr>
<tr>
<td>
<input type="submit" value="register" /> 
</td>
</tr>
</table>
</form>
</center>
</body>
</html>