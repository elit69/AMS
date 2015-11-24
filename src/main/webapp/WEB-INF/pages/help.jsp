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
<!-- End CSS Library -->

<!-- Custom StyleSheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/default.css">
<!-- End Custom StyleSheet -->
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/"><i
				class="fa fa-list"></i>&nbsp;&nbsp;&nbsp;Article Informations</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-2">


			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a
					href="${pageContext.request.contextPath}/help"><i
						class="fa fa-question-circle fa-lg"></i> Help </a></li>

				<c:choose>
					<c:when test="${not login}">
						<li><a href="${pageContext.request.contextPath}/login"><i
								class="fa fa-sign-in fa-lg"></i> Login </a></li>
					</c:when>
					<c:otherwise>
						<li><a href="#"><i class="fa fa-user fa-lg"></i> Hi,
								${name } </a></li>
						<li><a href="${pageContext.request.contextPath}/logout"><i
								class="fa fa-sign-out fa-lg"></i> Logout </a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	</nav>
	<div id="main" class="container-fluid">
		<div class="col-sm-12 center-block">
			<div class="col-sm-12 card form-horizontal">
				<h3>
					<i class="fa fa-globe"></i> Webpage
				</h3>
				<hr>
				<div class="table-responsive">

					<table
						class="table table-striped table-bordered table-condensed table-hover">
						<caption>http://localhost:8080/ArticleManagement/**</caption>
						<thead>
							<tr class="btn-primary">
								<th>relative_path</th>
								<th>http_verb</th>
								<th>example</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>/</td>
								<td>GET</td>
								<td><a href="${pageContext.request.contextPath}/">example</a></td>
							</tr>
							<tr>
								<td>/login</td>
								<td>GET</td>
								<td><a href="login">example</a></td>
							</tr>
							<tr>
								<td>/login</td>
								<td>POST</td>
								<td>formdata username password</td>
							</tr>
							<tr>
								<td>/logout</td>
								<td>GET</td>
								<td><a href="logout">example</a></td>
							</tr>
							<tr>
								<td>/help</td>
								<td>GET</td>
								<td><a href="help">example</a></td>
							</tr>
							<tr>
								<td>/admin/user</td>
								<td>GET</td>
								<td><a href="admin/user">example</a></td>
							</tr>
							<tr>
								<td>/admin/user/add</td>
								<td>GET</td>
								<td><a href="admin/user/add">example</a></td>
							</tr>
							<tr>
								<td>/admin/user/edit/{id}</td>
								<td>GET</td>
								<td><a href="admin/user/edit/5">example</a></td>
							</tr>
							<tr>
								<td>/author</td>
								<td>GET</td>
								<td><a href="author">example</a></td>
							</tr>
							<tr>
								<td>/author/add</td>
								<td>GET</td>
								<td><a href="author/add">example</a></td>
							</tr>														
						</tbody>
					</table>
				</div>
			</div>

			<div class="col-sm-12 card form-horizontal">
				<h3>
					<i class="fa fa-sign-in"></i> Login Web API
				</h3>
				<hr>
				<div class="table-responsive">

					<table
						class="table table-striped table-bordered table-condensed table-hover">
						<caption>http://localhost:8080/ArticleManagement/**</caption>
						<thead>
							<tr class="btn-primary">
								<th>relative_path</th>
								<th>http_verb</th>
								<th>example</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>/api/login</td>
								<td>POST</td>
								<td>{"username":"admin","password":"1"}</td>
							</tr>
							<tr>
								<td>/api/autologin/admin</td>
								<td>GET</td>
								<td><a href="api/autologin/admin">example1</a></td>
							</tr>
							<tr>
								<td>/api/autologin/author</td>
								<td>GET</td>
								<td><a href="api/autologin/author">example1</a></td>
							</tr>
							<tr>
								<td>/api/logout</td>
								<td>GET</td>
								<td><a href="api/logout">example1</a></td>
							</tr>
							<tr>
								<td>/api/status</td>
								<td>GET</td>
								<td><a href="api/status">example1</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="col-sm-12 card form-horizontal">
				<h3>
					<i class="fa fa-newspaper-o"></i> Admin Article Web API
				</h3>
				<hr>
				<div class="table-responsive">

					<table
						class="table table-striped table-bordered table-condensed table-hover">
						<caption>http://localhost:8080/ArticleManagement/api/admin/**</caption>
						<thead>
							<tr class="btn-primary">
								<th>relative_path</th>
								<th>http_verb</th>
								<th>example</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>article/list/{limit}</td>
								<td>GET</td>
								<td><a href="api/admin/article/list/10">example1</a> <a
									href="api/admin/article/list/20">example2</a></td>
							</tr>
							<tr>
								<td>article/list/{limit}/{page}</td>
								<td>GET</td>
								<td><a href="api/admin/article/list/10/1">example1</a> <a
									href="api/admin/article/list/10/2">example2</a></td>
							</tr>
							<tr>
								<td>article/</td>
								<td>POST</td>
								<td>{ "title": "The Pr", "userid": 2, "name": "author00",
									"content": "The Project Gutenberg EBook of War and Peace, by
									Leo Tolstoy", "pdate": "2015-11-17", "enable": true, "image":
									"some image" }</td>
							</tr>

							<tr>
								<td>article/{id}</td>
								<td>DELETE</td>
								<td></td>
							</tr>
							<tr>
								<td>article/</td>
								<td>PUT</td>
								<td>{ "id":"1", "title": "The Pr", "userid": 2, "name":
									"author00", "content": "The Project Gutenberg EBook of War and
									Peace, by Leo Tolstoy", "pdate": "2015-11-17", "enable": true,
									"image": "some image" }</td>
							</tr>
							<tr>
								<td>article/search/{type}/{keyword}/{limit}/{page}</td>
								<td>GET</td>
								<td><a href="api/admin/article/search/title/a/5/1">example1</a>
									<a href="api/admin/article/search/title/a/5/2">example2</a></td>
							</tr>
							<tr>
								<td>article/search/{type}/{keyword}/{limit}</td>
								<td>GET</td>
								<td><a href="api/admin/article/search/title/a/5">example1</a>
									<a href="api/admin/article/search/title/a/10">example2</a></td>
							</tr>
							<tr>
								<td>article/{id}</td>
								<td>GET</td>
								<td><a href="api/admin/article/1">example1</a> <a
									href="api/admin/article/2">example2</a></td>
							</tr>
							<tr>
								<td>article/toggle/{id}</td>
								<td>GET</td>
								<td><a href="api/admin/article/toggle/1">example1</a> <a
									href="api/admin/article/toggle/2">example2</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="col-sm-12 card form-horizontal">
				<h3>
					<i class="fa fa-user"></i> Admin User Web API
				</h3>
				<hr>
				<div class="table-responsive">
					<table
						class="table table-striped table-bordered table-condensed table-hover">
						<caption>http://localhost:8080/ArticleManagement/api/admin/**</caption>
						<thead>
							<tr class="btn-primary">
								<th>relative_path</th>
								<th>http_verb</th>
								<th>example</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>user/list/{limit}</td>
								<td>GET</td>
								<td><a href="api/admin/user/list/5">example1</a> <a
									href="api/admin/user/list/10">example2</a></td>
							</tr>
							<tr>
								<td>user/list/{limit}/{page}</td>
								<td>GET</td>
								<td><a href="api/admin/user/list/5/1">example1</a> <a
									href="api/admin/user/list/5/2">example2</a></td>
							</tr>
							<tr>
								<td>user/</td>
								<td>POST</td>
								<td>{ "username": "author", "password": "1", "enable":
									true, "email": "author@gmail.com", "address": "sr", "phone":
									"2322", "name": "author00", "gender": "f", "image":
									"default.jpg" }</td>
							</tr>

							<tr>
								<td>user/{id}</td>
								<td>DELETE</td>
								<td></td>
							</tr>
							<tr>
								<td>user/</td>
								<td>PUT</td>
								<td>{ "id": 2, "username": "author", "password": "1",
									"enable": true, "email": "author@gmail.com", "address": "sr",
									"phone": "2322", "name": "author00", "gender": "f", "image":
									"default.jpg" }</td>
							</tr>
							<tr>
								<td>user/search/{type}/{keyword}/{limit}/{page}</td>
								<td>GET</td>
								<td><a href="api/admin/user/search/username/admin/5/1">example1</a>
									<a href="api/admin/user/search/username/admin/5/2">example2</a></td>
							</tr>
							<tr>
								<td>user/search/{type}/{keyword}/{limit}</td>
								<td>GET</td>
								<td><a href="api/admin/user/search/username/admin/2">example1</a>
									<a href="api/admin/user/search/username/admin/5">example2</a></td>
							</tr>
							<tr>
								<td>user/{id}</td>
								<td>GET</td>
								<td><a href="api/admin/user/1">example1</a> <a
									href="api/admin/user/2">example2</a></td>
							</tr>
							<tr>
								<td>user/uploadimage</td>
								<td>POST</td>
								<td>fileimage</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>