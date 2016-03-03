<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<body>
<center>

<%
if(request.getParameter("error")!=null){
	if(request.getParameter("error").equals("1")){
%>
username does not exist
<%
	}
	else if(request.getParameter("error").equals("2")){
%>
password is wrong
<%
	}
}
%>
<form action="servlet/LoginServlet" method="post">
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

<td colspan="2">
<input style="width:200px;" type="submit" value="log in" /> 
</td>

</tr>
<tr>

<td colspan="2">

<input type="button" style="width:200px;" value="new user? create an account" onclick="window.location.href='register.jsp'"/> 
</td>

</tr>
</table>

</form>
</center>
</body>
</html>