<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Order Success</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #d9d7e0;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-5  x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Successful</h2>
		<h5>Within 7 days your order will be delivered in your Address</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a> <a
			href="order.jsp" class="btn btn-danger mt-3">View Order</a>
	</div>

</body>
</html>