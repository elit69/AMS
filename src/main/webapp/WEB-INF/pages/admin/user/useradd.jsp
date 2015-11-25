<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View User</title>
<!-- CSS Library -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lib/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lib/jasny-bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lib/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lib/sidebar.css" />
<!-- End CSS Library -->

<!-- Custom StyleSheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/default.css">
<!-- End Custom StyleSheet -->

</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" id="menu-toggle"><i class="fa fa-list"></i></a>
			<a class="navbar-brand">Admin Page</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-2">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${pageContext.request.contextPath}/"><i
						class="fa fa-home fa-lg"></i> Home Page</a></li>
				<c:choose>
					<c:when test="${not login}">
						<li><a href="${pageContext.request.contextPath}/help"><i
						class="fa fa-question-circle fa-lg"></i> Help </a></li>
						<li><a href="${pageContext.request.contextPath}/login"><i
								class="fa fa-sign-in fa-lg"></i> Login </a></li>
					</c:when>
					<c:otherwise>
						<li><a href="#"><i class="fa fa-user fa-lg"></i> Hi,
								${name } </a></li>
						<li><a href="${pageContext.request.contextPath}/help"><i
						class="fa fa-question-circle fa-lg"></i> Help </a></li>
						<li><a href="${pageContext.request.contextPath}/logout"><i
								class="fa fa-sign-out fa-lg"></i> Logout </a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	</nav>
	<div id="wrapper" class="main">
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li><a href="#"><i class="fa fa-user fa-lg"></i> Profile</a>
				<li><a href="#"><i class="fa fa-users fa-lg"></i> User</a>
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/admin/user"><i
								class="fa fa-list fa-lg"></i> List</a></li>
						<li class="active"><a
							href="${pageContext.request.contextPath}/admin/user/add"><i
								class="fa fa-plus fa-lg"></i> Add</a></li>
						<li><a href="#"><i class="fa fa-search fa-lg"></i> Search</a></li>
					</ul></li>
				<li><a href="#"><i class="fa fa-newspaper-o fa-lg"></i>
						Article</a>
					<ul>
						<li><a href="#"><i class="fa fa-list fa-lg"></i> List</a></li>
						<li><a href="#"><i class="fa fa-plus fa-lg"></i> Add</a></li>
						<li><a href="#"><i class="fa fa-search fa-lg"></i> Search</a></li>
					</ul></li>
			</ul>
		</div>
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row col-sm-12 center-block card">
					<h3>Add New User</h3>
					<hr>
					<div class="col-md-3">
						<div class="fileinput fileinput-new" data-provides="fileinput">
							<div class="fileinput-preview thumbnail" data-trigger="fileinput"
								style="width: 200px; height: 150px;"></div>
							<div>
								<span class="btn btn-default btn-file"><span
									class="fileinput-new">Select image</span> <span
									class="fileinput-exists">Change</span> <input type="file"
									name="file" id="image"></span> <a href="#"
									class="btn btn-default fileinput-exists"
									data-dismiss="fileinput">Remove</a>
							</div>
						</div>
					</div>
					<div class="col-md-9">
						<form action="#" method="POST" enctype="multipart/form-data">

							<input type="hidden" id="id">
							<div class="row form-group">
								<label class="col-sm-2">Name:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="Enter Username" maxlength="20" id="name" value=""
										required="" autofocus="">
								</div>
							</div>
							<div class="row form-group" style="margin-bottom: 25px;">
								<label class="col-sm-2">Gender: </label>
								<div class="col-sm-10">
									<label class="radio-inline"> <input type="radio"
										name="gender" value="f" checked="">Female
									</label> <label class="radio-inline"> <input type="radio"
										name="gender" value="m">Male
									</label>
								</div>
							</div>
							<div class="row form-group">
								<label class="col-sm-2">Email:</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" id="email"
										placeholder="Enter name@domain.com" maxlength="25"
										pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$"
										required="">
								</div>
							</div>
							<div class="row form-group">
								<label class="col-sm-2">Username:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="Enter Username" maxlength="20" id="username"
										required="">
								</div>
							</div>

							<div class="row form-group">
								<label class="col-sm-2">Role: </label>
								<div class="col-sm-10">
									<select class="form-control" name="role_id" id="userrole"
										required="">
										<option value="1">Admin</option>
										<option value="2">Author</option>
									</select>
								</div>
							</div>
							<div class="row form-group">
								<label class="col-sm-2">Password: </label>
								<div class="col-sm-10">
									<input type="password" class="form-control" name="password"
										placeholder="Enter Password" maxlength="20" id="password"
										required="">
								</div>
							</div>

							<div class="row form-group">
								<label class="col-sm-2">Address:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="Enter Address" maxlength="20" id="address"
										required="">
								</div>
							</div>
							<div class="row form-group">
								<label class="col-sm-2">Phone:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="Enter Phone" maxlength="20" id="phone"
										required="">
								</div>
							</div>

<!-- 							<div class="row form-group" style="margin-bottom: 25px;">
								<label class="col-sm-2">Enable: </label>
								<div class="col-sm-10">
									<label class="radio-inline"> <input type="radio"
										name="enable" value="true" checked="">Enable
									</label> <label class="radio-inline"> <input type="radio"
										name="enable" value="false">Disable
									</label>
								</div>
							</div> -->
							<div class="col-sm-4 center-block">
								<input type="button" class="btn btn-primary" value="Submit"
									onclick="addUser()"> <input type="reset"
									class="btn btn-warning pull-right" value="Clear">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Javascript Library -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/lib/jquery-2.1.4.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/lib/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/lib/jasny-bootstrap.js"></script>
	<!-- End Javascript Library -->

	<!-- Custom Javascript -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/default.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/admin/user/useradd.js"></script>
	<!-- End Custom Javascript -->
</body>
</html>