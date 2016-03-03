
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="dao.ItemDao"%>
<%@ page import="entity.Item"%>
<%@ page import="entity.User"%>
<%@ page import="listener.UserListener"%>

<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Store</title>
<style type="text/css">
div {
	float: left;
	margin: 10px;
}

div dd {
	margin: 0px;
	font-size: 10pt;
	width: 200;
}
</style>
</head>
<body>





	<%
		request.getSession().setAttribute("latestUrl", request.getRequestURI());
	%>
	<center>
		<table id="operation">
			<tr>
				<%
					ItemDao itemDao = new ItemDao();
					ArrayList<Item> items = itemDao.getAllItems();
					if (items != null) {
				%>
				<%
					if (request.getSession().getAttribute("user") != null) {
							User user = (User) request.getSession().getAttribute("user");
				%>

				<td>welcome <%=user.getUsername()%></td>
				<td><input type="button" value="view my information"
					onclick="location.href='login_success.jsp'"></td>
				<td><input type="button" value="view cart"
					onclick="location.href='cart.jsp'"></td>
				<td><input type="button" value="view shopping history"
					onclick="location.href='items_bought.jsp'"></td>
				<td><input type="button" value="log out"
					onclick="location.href='servlet/LogoutServlet'"></td>

				<%
					} else {
				%>

				<td><input type="button" value="log in"
					onclick="location.href='login.jsp'"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<%
					}
				%>

				<!-- use listener to count the amount of people viewing the website -->
				<td><%=UserListener.getUserNumber()%> people are viewing this
					website</td>
			</tr>
		</table>

		<!-- item list -->
		<table width="1000" height="60">
			<tr>
				<td>
					<%
						for (Item i : items) {
					%>
					<div>
						<dl>
							<dt>
								<a href="detail.jsp?id=<%=i.getId()%>"> <img
									src="images/<%=i.getImage()%>" width="300" height="230"
									border="1" />
								</a>
							</dt>
							<dd><%=i.getName()%></dd>
							<dd>
								price:<%=i.getPrice()%></dd>
						</dl>
					</div> <%
 	}
 	}
 %>

				</td>
			</tr>

		</table>
	</center>

</body>
</html>