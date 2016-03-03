<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entity.Cart" %>
<%@ page import="entity.Item" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Cart</title>
<style styp="text/css">
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
<input type="button" value="view shopping history" onclick="location.href='items_bought.jsp'">
<input type="button" value="back to main page" onclick="location.href='index.jsp'">
<input type="button" value="log out" onclick="location.href='servlet/LogoutServlet'">
<br>
<h1>Cart</h1><hr>

<!-- decide if there are items in the cart -->
<%
Cart cart=(Cart)request.getSession().getAttribute("cart");
if(cart==null){
	%>
	<h2>cart is empty</h2>
	<%
}
else{
HashMap<Item,Integer> itemsInCart=cart.getItemsInCart();
Set<Item> items=itemsInCart.keySet();
Iterator<Item> it=items.iterator();
if(it.hasNext()==false){
	%>
<h2>cart is empty</h2>
<%
}
else{
%>
<!-- show items in the cart -->
<table>
<tr>
<th>picture</th>
<th>name</th>
<th>amount</th>
<th>price</th>
<th>operation</th>
</tr>

<%
while(it.hasNext()){
	Item i=it.next();
%>
<tr>
<td><a href="detail.jsp?id=<%=i.getId()%>">
<img src="images/<%=i.getImage()%>" width="200" height="150"  /></a></td>
<td><%=i.getName() %></td>
<td><%=itemsInCart.get(i) %></td>
<td><%=itemsInCart.get(i)*i.getPrice() %></td>
<td><input type="button" value="delete" onclick="location.href='servlet/CartServlet?action=delete&id=<%=i.getId()%>'"></td>
</tr>
<%
}
%>
</table>

<h3>total price is <%=cart.getTotalPrice() %></h3>
<input style="width:200px;" type="button" value="buy now" onclick="location.href='servlet/BuyServlet'">

<%
}}
%>
	
</center>
</body>
</html>