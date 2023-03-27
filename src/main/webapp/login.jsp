<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bumble Bee: Login</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #d9d7e0;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<!-- PUTTING OFFSET-MD-4 MEAN ITS PULL THE BOX INTO CENTER -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Login Page</h3>

						<c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty SuccMsg }">
							<h5 class="text-center text-success">${SuccMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>



						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Your Email</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">

							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Enter Your Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<br>
								<!-- BR TAG USED TO MOVE C.AC UNDER LOGIN BTN -->
								<a href="register.jsp">Create Account</a>
								<!-- THIS DIV SPECAILLY FOR BTN TO MOVE CENTER AND IM LINKING C.ACC HERE TOO -->
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>