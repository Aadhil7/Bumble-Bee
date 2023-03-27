<%@page import="com.entity.Cart"%>
<%@page import="com.DAO.CartDAOimpl"%>
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
<title>Admin: All Customers Due/Payment</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<h3 class="text-center">Hello Admin</h3>
	
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
				<th scope="col">Cart ID</th>
				
				<th scope="col">User ID</th>
				<th scope="col">Product Name</th>
				<th scope="col">Total Payable Amount</th>
				

			</tr>
		</thead>
		<tbody>
			<%
			CartDAOimpl dao = new CartDAOimpl(DBConnect.getConn());
			List<Cart> list = dao.getTotalPayment();
			 for (Cart c:list){
			%>
			<tr>
				<td><%=c.getCid()%></td>
				
				<td><%=c.getUid()%></td>
				<td><%=c.getProductName()%></td>
				<td><%=c.getTotal_price()%></td>
				
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