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
				<h1>Article</h1>
				<hr>
				<div class="table-responsive">

					<table
						class="table table-striped table-bordered table-condensed table-hover">
						<caption>http://localhost:8080/ArticleManagement/api/admin/article/*</caption>
						<thead>
							<tr class="info">
								<th>relative_path</th>
								<th>http_verb</th>
								<th>example</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>/list/{limit}</td>
								<td>GET</td>
								<th><a href="api/admin/article/list/10">example1</a> <a
									href="api/admin/article/list/20">example2</a></th>
							</tr>
							<tr>
								<td>/list/{limit}/{page}</td>
								<td>GET</td>
								<th><a href="api/admin/article/list/10/1">example1</a> <a
									href="api/admin/article/list/10/2">example2</a></th>
							</tr>
							<tr>
								<td>/add</td>
								<td>POST</td>
							</tr>

							<tr>
								<td>/delete/{id}</td>
								<td>DELETE</td>
							</tr>
							<tr>
								<td>/update/{id}</td>
								<td>PUT</td>
							</tr>
							<tr>
								<td>/search/{type}/{keyword}/{limit}/{page}</td>
								<td>GET</td>
								<th><a href="api/admin/article/search/title/a/5/1">example1</a>
									<a href="api/admin/article/search/title/a/5/2">example2</a></th>
							</tr>
							<tr>
								<td>/search/{type}/{keyword}/{limit}/</td>
								<td>GET</td>
								<th><a href="api/admin/article/search/title/a/5">example1</a>
									<a href="api/admin/article/search/title/a/10">example2</a></th>
							</tr>
							<tr>
								<td>/get/{id}</td>
								<td>GET</td>
								<th><a href="api/admin/article/get/1">example1</a> <a
									href="api/admin/article/get/2">example1</a></th>
							</tr>
							<tr>
								<td>/toggle/{id}</td>
								<td>GET</td>
								<th><a href="api/admin/article/toggle/1">example1</a> <a
									href="api/admin/article/toggle/2">example1</a></th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="col-sm-12 card form-horizontal">
				<h1>User</h1>
				<hr>
				<div class="table-responsive">

					<table
						class="table table-striped table-bordered table-condensed table-hover">
						<caption>http://localhost:8080/ArticleManagement/api/admin/user/*</caption>
						<thead>
							<tr class="info">
								<th>relative_path</th>
								<th>http_verb</th>
								<th>example</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>/list/{limit}</td>
								<td>GET</td>
								<th><a href="api/admin/user/list/5">example1</a> <a
									href="api/admin/user/list/10">example2</a></th>
							</tr>
							<tr>
								<td>/list/{limit}/{page}</td>
								<td>GET</td>
								<th><a href="api/admin/user/list/5/1">example1</a> <a
									href="api/admin/user/list/5/2">example2</a></th>
							</tr>
							<tr>
								<td>/add</td>
								<td>POST</td>
							</tr>

							<tr>
								<td>/delete/{id}</td>
								<td>DELETE</td>
							</tr>
							<tr>
								<td>/update/{id}</td>
								<td>PUT</td>
							</tr>
							<tr>
								<td>/search/{type}/{keyword}/{limit}/{page}</td>
								<td>GET</td>
								<th><a href="api/admin/user/search/title/a/5/1">example1</a>
									<a href="api/admin/user/search/title/a/5/2">example2</a></th>
							</tr>
							<tr>
								<td>/search/{type}/{keyword}/{limit}/</td>
								<td>GET</td>
								<th><a href="api/admin/user/search/title/a/5">example1</a>
									<a href="api/admin/user/search/title/a/10">example2</a></th>
							</tr>
							<tr>
								<td>/get/{id}</td>
								<td>GET</td>
								<th><a href="api/admin/user/get/1">example1</a> <a
									href="api/admin/user/get/2">example1</a></th>
							</tr>
							<tr>
								<td>/toggle/{id}</td>
								<td>GET</td>
								<th><a href="api/admin/user/toggle/1">example1</a> <a
									href="api/admin/user/toggle/2">example1</a></th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>