<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="entity.User" %>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Information</title>
</head>
<body>
<center>
<%
User user=(User)request.getSession().getAttribute("user");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String date = sdf.format(user.getBirthday());
%>

welcome <%=user.getUsername() %>

<table border="1">
<tr>
<td>
username
</td>
<td>
<%=user.getUsername() %>
</td>
</tr>
<tr>
<tr>
<td>
birthday
</td>
<td>
<%

%>
<%=date %>
</td>
</tr>
<tr>
<td>
gender
</td>
<td>
<%=user.getGender() %>
</td>
</tr>
</table>
<td><input type="button" value="back" onclick="location.href='<%=request.getSession().getAttribute("latestUrl") %>'"></td>

</center>
</body>
</html>