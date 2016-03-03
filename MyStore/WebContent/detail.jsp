<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="listener.UserListener"%>
<%@ page import="dao.ItemDao"%>
<%@ page import="entity.Item"%>
<%@ page import="entity.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Item Information</title>

<style type="text/css">
div {
	float: left;
	margin: 10px;
}

div dd{
	      margin:0px;
	      font-size:10pt;
	   }
</style>
<%
String path=request.getContextPath();
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User user=(User)request.getSession().getAttribute("user");
String ifLogin;
if(user!=null){
	ifLogin="true";
}
else{
	ifLogin="false";
}
%>
<script type="text/javascript">
function hint(id){
	if(String(<%=ifLogin%>)=="true"){
		var myPath=String("<%=basePath%>") +"/servlet/CartServlet?id="+id+"&action=add";
		window.open(myPath,"_blank","width=300,height=200,top=400px,left=50%"); 
	}else{
		alert("please login");
	}
}
function hint2(){
	if(String(<%=ifLogin%>)=="true"){
		var myPath=String("<%=basePath%>") +"cart.jsp";
		window.open(myPath,"_self"); 
	}else{
		alert("please login");
	}
}
</script>

</head>
<body>
<center>
		<table id="operation">
		<tr>
		
<%
	if(user!=null){
		%>
		<td>welcome <%=user.getUsername() %></td>
		<td><input type="button" value="view my information" onclick="location.href='login_success.jsp'"></td>
		<td><input type="button" value="back to main page" onclick="location.href='index.jsp'"></td>
		
	<td><input type="button" value="view cart" onclick="location.href='cart.jsp'"></td>
	<td><input type="button" value="view shopping history" onclick="location.href='items_bought.jsp'"></td>
	<td><input type="button" value="log out" onclick="location.href='servlet/LogoutServlet'"></td>
	
		<%
	}
	else{
	%>
	<td><input type="button" value="log in" onclick="location.href='login.jsp'"></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>

	<%
	}
%>

<td><%=UserListener.getUserNumber() %> people are viewing this website</td>
</tr>
</table>

<!-- item detail -->
<%
int id=Integer.parseInt(request.getParameter("id"));
ItemDao itemDao=new ItemDao();
Item item=itemDao.getItemById(id);
String latestUrl=request.getRequestURI()+"?id="+id;
request.getSession().setAttribute("latestUrl",latestUrl);

%>

<table>
               <tr>
                 <td rowspan="5"><img src="images/<%=item.getImage()%>" width="400" height="320"/></td>
               </tr>
               <tr>
                 <td><B><%=item.getName() %></B></td> 
               </tr>
               <tr>
                 <td>Brand:<%=item.getBrand() %></td> 
               </tr>
               <tr>
                 <td>Price:<%=item.getPrice() %> CAD</td>
               </tr>
               <tr>
               <td><div id="cart">
               <input type="button" onclick="hint(<%=item.getId() %>)" value="add to cart">
					<input type="button" onclick="hint2()" value="view cart">
					 </div></td>
               </tr>
             </table>
             


					<br>
					
					 
					
					<hr>
					<h2>Description</h2>
					<table>
					<tr>
					<td>brand:</td>
					<td><%=item.getBrand() %></td>
					</tr>
					<tr>
					<td>drums:</td>
					<td><%=item.getDrums() %></td>
					</tr>
					<tr>
					<td>hardware:</td>
					<td><%=item.getHardware() %></td>
					</tr>
					<tr>
					<td>cymbals:</td>
					<td><%=item.getCymbals() %></td>
					</tr>
					<tr>
					<td>description:</td>
					<td><%=item.getDiscription() %></td>
					</tr>
					
					</table>	
		</center>						
</body>
</html>