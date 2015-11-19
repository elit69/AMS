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
	<div id="main" class="container-fluid">
		<div class="col-sm-12 center-block">
			<div class="col-sm-12 card form-horizontal">
				<h1>
					All User <a class="btn pull-right"
						href="${pageContext.request.contextPath}/logout"><i
						class="fa fa-sign-out fa-2x"></i></a> <a class="btn pull-right"
						href="${pageContext.request.contextPath}/admin/add"><i
						class="fa fa-plus fa-2x"></i></a> <a class="btn pull-right"
						href="${pageContext.request.contextPath}/admin/show/${currentUser.id }">Hi,
						${currentUser.username }</a>
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
					<caption>http://localhost:8080/ArticleManagement/*</caption>
					<table
						class="table table-striped table-bordered table-condensed table-hover">
						<thead>
							<tr class="info">

								<th>relative_path</th>
								<th>http_verb</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>api/admin/article/list/{limit}</td>
								<td>GET</td>
							</tr>
							<tr>
								<td>api/admin/article/list/{limit}/{page}</td>
								<td>GET</td>
							</tr>
							<tr>
								<td>api/admin/article/add</td>
								<td>POST</td>
							</tr>

							<tr>
								<td>api/admin/article/delete/{id}</td>
								<td>DELETE</td>
							</tr>
							<tr>
								<td>api/admin/article/update/{id}</td>
								<td>PUT</td>
							</tr>
							<tr>
								<td>api/admin/article/search/{type}/{keyword}/{limit}/{page}</td>
								<td>GET</td>
							</tr>
							<tr>
								<td>api/admin/article/search/{type}/{keyword}/{limit}/</td>
								<td>GET</td>
							</tr>
							<tr>
								<td>api/admin/article/toggle/{id}</td>
								<td>GET</td>
							</tr>
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