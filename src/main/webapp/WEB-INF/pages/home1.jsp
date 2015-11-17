<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="author" content="Chhorn Elit">
<meta lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS Library -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lib/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lib/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lib/bootstrap-select.min.css">
<!-- End CSS Library -->

<!-- Custom StyleSheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/index.css">
<!-- End Custom StyleSheet -->
</head>
<body>
${message }
	<div id="main" class="container-fluid">
		<div class="col-sm-12 center-block">
			<div class="col-sm-12 card form-horizontal">
				<h1>All User 
					<a class="btn pull-right"
						href="${pageContext.request.contextPath}/logout"><i
						class="fa fa-sign-out fa-2x"></i></a> 
					<a class="btn pull-right"
						href="${pageContext.request.contextPath}/admin/add"><i
						class="fa fa-plus fa-2x"></i></a>
					<a class="btn pull-right"
						href="${pageContext.request.contextPath}/admin/show/${currentUser.id }">Hi, ${currentUser.username }</a>
				</h1>
				<hr>
				<mvc:form action="${pageContext.request.contextPath}/admin/search"
					method="POST">
					<div class="col-sm-11 center-block">
						<div class="col-sm-10 ">
							<div class="input-group">
								<input type="text" class="form-control" name="keyword"
									placeholder="Search for User ..." autofocus> <span
									class="input-group-btn">
									<button type="submit" class="btn btn-primary">
										&nbsp;<span class="fa fa-search"></span>&nbsp;
									</button>
								</span>

							</div>
						</div>
						<div class="col-sm-2 ">
							<select class="form-control" name="type">
								<option value="username">Username</option>
								<option value="email">Email</option>
								<option value="password">Password</option>
								<option value="image">Image</option>
							</select>
						</div>
					</div>
				</mvc:form>
				<div class="table-responsive">
					<table
						class="table table-striped table-bordered table-condensed table-hover">
						<thead>
							<tr class="info">
								<th>ID</th>
								<th>Username</th>
								<th>Password</th>
								<th>Email</th>
								<th>Role</th>
								<th>Enable</th>
								<th>Birth Date</th>
								<th>Register Date</th>
								<th>Image</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="usr" items="${listUser}">
								<tr>
									<td>${usr.id}</td>
									<td>${usr.username}</td>
									<td>${usr.password}</td>
									<td>${usr.email}</td>
									<td>${usr.role}</td>
									<td>${usr.enable}</td>
									<td>${usr.birthdate}</td>
									<td>${usr.registerdate}</td>
									<td>${usr.image}</td>
									<td><a class="label label-info"
										href="${pageContext.request.contextPath}/admin/show/${usr.id}"
										style="margin-right: 10px;"><i class="fa fa-eye fa-lg"></i>
											Show </a> <a class="label label-primary"
										href="${pageContext.request.contextPath}/admin/update/${usr.id}"
										style="margin-right: 10px;"><i class="fa fa-pencil fa-lg"></i>
											Edit </a> <a class="label label-danger"
										href="${pageContext.request.contextPath}/admin/delete/${usr.id}"
										style="margin-right: 10px;"><i class="fa fa-trash-o fa-lg"></i>
											Delete</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:if test="${empty listUser}">
						<div class="alert alert-danger text-center">
							<strong>404 NOT FOUND</strong> <a
								href="${pageContext.request.contextPath}/">Go Home</a>
						</div>
					</c:if>
				</div>

			</div>
		</div>
	</div>
</body>
</html>