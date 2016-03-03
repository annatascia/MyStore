<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entity.Cart" %>
<%@ page import="entity.Item" %>
<%@ page import="entity.User" %>
<%@ page import="entity.UserItems" %>
<%@ page import="dao.UserItemsDao" %>
<%@ page import="dao.ItemDao" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shopping History</title>
<style type="text/css">
table td {
	width:100px;
	text-align:center;
}
table th{
font-size:20px;
}
table, td, th
  {
  border:1px solid red;
  }
</style>
</head>
<body>

<%
request.getSession().setAttribute("latestUrl", request.getRequestURI());
%>
<center>

<input type="button" value="view my information" onclick="location.href='login_success.jsp'">
<input type="button" value="view cart" onclick="location.href='cart.jsp'">
<input type="button" value="back to main page" onclick="location.href='index.jsp'">
<input type="button" value="log out" onclick="location.href='servlet/LogoutServlet'">
	
<h1>shopping history</h1>
<hr>

<%
UserItemsDao userItemsDao= new UserItemsDao();
ItemDao itemDao=new ItemDao();
User user=(User)request.getSession().getAttribute("user");
ArrayList<UserItems> userItemsList=userItemsDao.getItems(user.getId());
if(userItemsList!=null){
	%>
	
<table>
<tr>
<th>picture</th>
<th>name</th>
<th>unit price</th>
<th>amount</th>
<th>buy date</th>
</tr>

<% 
	for(int k=userItemsList.size()-1;k>=0;k--){
		UserItems i=userItemsList.get(k);
		
		Item item=itemDao.getItemById(i.getItemId());
		
		%>
		
		<tr>
		<td><a href="detail.jsp?id=<%=item.getId()%>">
		<img src="images/<%=item.getImage()%>" width="200" height="150" /></a></td>
		<td><%=item.getName() %></td>
		<td><%=item.getPrice() %></td>
		<td><%=i.getAmount() %></td>
		<td><%=i.getBuyDate() %></td>
		</tr>
		<%
	}
%>
</table>
<%
}
else{
	%>
	<h2>hasn't bought anything yet</h2>
	<%
}
%>

</center>

</body>
</html>