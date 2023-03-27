<%@page import="com.entity.User"%>
<%@page import="com.DAO.UserDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Customers</title> 
<%@include file="allCss.jsp"%>
</head> 
<body>
	<%@include file="navbar.jsp"%> 

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<h3 class="text-center">Hello Admin</h3>
	<h5 class="text-center">Check: Customer's Age must be 18+</h5>
	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg}</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>


	<table class="table table-striped ">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Customer Name</th>
				<th scope="col">Phone Number</th>
				<th scope="col">Date Of Birth</th>
				<th scope="col">Action</th>

			</tr>
		</thead>
		<tbody>
			<%
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			List<User> list = dao.getAllUser();
			for (User u : list) {
			%>
			<tr>
				<td><%=u.getId()%></td>
				<td><%=u.getName()%></td>
				<td><%=u.getPhno()%></td>
				<td><%=u.getDob()%></td>
				<td><a href="../deletee?id=<%=u.getId()%> " class="btn btn-sm btn-danger">Delete</a></td>
			</tr>
			<%
			}
			%>


		</tbody>
	</table>
	<div style="margin-top: 170px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>