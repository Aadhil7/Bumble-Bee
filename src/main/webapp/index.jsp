<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bumble bee: Index</title>
<%@include file="all_component/allCss.jsp"%>
<!-- YOU HAVE TO INCLUDE THIS ALLCSS.JSP THAT ALL TOOK FROM I.NET(BOOTSTRAP) -->
<style type="text/css">
.back-img {
	background: url("img/R.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #f0f1f2;;
}
</style>

</head>
<body style="background-color: #f0f1f2;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<!-- THIS BG-COLOR INDICATING BODY OF THE BACKGROUND -->
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fulid back-img">
		<h2 class="text-center text-danger">Bumble Bee: Buy First and Pay Later</h2>

	</div>

	<!-- Start Recent Book -->

	<div class="container">
		<h3 class="text-center">Recent Products</h3>
		<div class="row">
			<%
			BookDAOimpl dao2 = new BookDAOimpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBook();
			for (BookDtls b : list2) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 200px; height: 300px;" class="img-thumbline">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getBookCategory().equals("Old")) {
							%>



							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_product.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success btn-sm ml-5">View</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-dollar-sign"></i><%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							}
							%>


							<a href="view_product.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success btn-sm ml-1">View</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-dollar-sign"></i><%=b.getPrice()%></a>
						</div>
						<%
						}
						%>


					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>

	</div>

	<!-- End Recent Book -->
	<hr>
	<!--THIS HORIZONTAL DIVIDING ALL THERE (RECENT,NEW,OLD BOOK)-->
	<!--Start New Book -->


	<div class="container">
		<h3 class="text-center">New Products</h3>
		<div class="row">


			<%
			BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 200px; height: 300px;" class="img-thumbline">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							}
							%>



							<a href="view_product.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success btn-sm ml-1">View </a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-dollar-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>

	</div>

	<hr>
	<div class="container">
		<h3 class="text-center">Old Products</h3>
		<div class="row">
			<%
			BookDAOimpl dao3 = new BookDAOimpl(DBConnect.getConn());
			List<BookDtls> list3 = dao2.getOldBooks();
			for (BookDtls b : list3) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 200px; height: 300px;" class="img-thumbline">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_product.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success btn-sm ml-5">View </a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-dollar-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>


	<div class="text-center mt-1">
		<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
			All</a>
	</div>



	<!-- End Old Book -->
	<%@include file="all_component/footer.jsp"%>
</body>
</html>