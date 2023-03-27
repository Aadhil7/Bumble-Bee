<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Home</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container">
		<div class="row p-5">

			<div class="col-md-4 p-2">
				<a href="add_products.jsp">
					<div class="card">
						<div class="card-body text-center">
							<!-- pulling AddBook into center -->
							<i class="fas fa-plus-square fa-3x text-primary"></i><br>
							<!-- text-primary take ICone blue -->
							<h4>Add Products</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 p-2">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<!-- pulling AddBook into center -->
							<i class="fas fa-book-open fa-3x text-danger"></i><br>
							<!-- text-danger take ICone red -->
							<h4>All Products</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 p-2">
				<a href="all_customers.jsp">
					<div class="card">
						<div class="card-body text-center">
							<!-- pulling AddBook into center -->
							<i class="fas fa-solid fa-users fa-3x text-primary"></i><br>
							<!-- text-danger take ICone red -->
							<h4>All Customers</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 p-2">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<!-- pulling AddBook into center -->
							<i class="fas fa-box-open fa-3x text-danger"></i><br>
							<!-- text-warning take ICone yellow -->
							<h4>Order</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 p-2">
				<a href="customer_payment.jsp">
					<div class="card">
						<div class="card-body text-center">
							<!-- pulling AddBook into center -->
							<i class="fa-solid fa-money-bill-wave fa-3x text-warning"></i></i></i><br>
							<!-- text-warning take ICone yellow -->
							<h4>Payment</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 p-2">
				<a data-toggle="modal" data-target="#exampleModalCenter"	>
					<div class="card">
						<div class="card-body text-center">
							<!-- pulling AddBook into center -->
							<i class="fas fa-sign-out fa-3x text-primary"></i><br>
							<!-- text-primary take ICone blue -->
							<h4>Logout</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>

		</div>
	</div>
	
	<!-- START LOGOUT MODAL -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<h4>Do You Want to Logout</h4>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>

<!--END LOGOUT MODAL -->
	
	<div style="margin-top: 180px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>