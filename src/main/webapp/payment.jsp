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
<title>Make Your Payment Here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>


	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg }</div>


		<c:remove var="succMsg" scope="session" />


	</c:if>

	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg }</div>


		<c:remove var="failedMsg" scope="session" />


	</c:if>


	<table class="table table-striped ">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Cart ID</th>

				<th scope="col">Product ID</th>
				<th scope="col">User ID</th>
				<th scope="col">Product Name</th>
				<th scope="col">Amount</th>
				<th scope="col">Pay Here</th>

			</tr>
		</thead>
		<tbody>
		<%
			User u = (User) session.getAttribute("userobj");

			CartDAOimpl dao = new CartDAOimpl(DBConnect.getConn());
			List<Cart> cart = dao.getBookByUser(u.getId());
			double totalPrice = 0.00;
			for (Cart c : cart) {
				totalPrice = c.getTotal_price();
			%>
			<tr>
				<th scope="row"><%=c.getCid()%></th>
				<td><%=c.getBid()%></td>
				<td><%=c.getUid()%></td>
				<td><%=c.getProductName()%></td>
				<td><%=c.getPrice()%></td>
				<td><a
					href="user_payment?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>"
					class="btn btn-sm btn-danger">Pay</a></td>
			</tr>
			<%
			}
			%>

			<tr>
				<td>Total Price</td>
				<td></td>
				<td></td>
				<td><%=totalPrice%></td>
			</tr> 
			


		</tbody>
	</table>
	<div style="margin-top: 170px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>