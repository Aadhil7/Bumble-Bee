<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center text-primary">Edit Profile</h4>
						
						
						<c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty SuccMsg }">
							<h5 class="text-center text-success">${SuccMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="update_profile" method="post">
							<!-- THIS IS THE FORM BODY PART TOOK FROM BOOTSTRAP FORM SEARCH -->
							
							<input type="hidden" value="${userobj.id }" name="id">
							
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Your Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname" value="${userobj.name }">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Your Email Address</label>
								<input type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email" value="${userobj.email }">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Your Phone Number</label>
								<input type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="phno" value="${userobj.phno }">

							</div>
							
							<div class="form-date">
								
								<label for="datepicker">Enter Your Date of Birth</label> <input
									type="date" class="form-control" id="datepicker"
									required="required" name="dob" value="${userobj.dob }">
							</div>



							<div class="form-group">
								<label for="exampleInputPassword1">Enter Your Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>
							<div class="text-center p-2">
							<button type="submit" class="btn btn-primary btn-block btn-sm">Update</button>
							</div>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>