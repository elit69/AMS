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
<c:set var="sesslogin" value="${sessionScope.user }"></c:set>
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
			<a class="navbar-brand">Author Page</a>
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
				<li><a href="#"><i class="fa fa-newspaper-o fa-lg"></i>Article</a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/author"><i class="fa fa-list fa-lg"></i> List</a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/author/add"><i class="fa fa-plus fa-lg"></i> Add</a></li>
						<li><a href="#"><i class="fa fa-search fa-lg"></i> Search</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row col-sm-12 center-block card">
					<h3>Add New Article</h3>
					<hr>
					<form id="frmAdd" method="POST">
						<!--row2  -->
						<div class="row col-sm-12" style="margin: auto;">
							<!--row3  -->
							<div class="col-sm-3" style="padding: 0px;">
								<div class="fileinput fileinput-new" data-provides="fileinput"
									style="margin: 0px; padding: 0px;">
									<div id="disp" class="fileinput-preview thumbnail"
										data-trigger="fileinput" style="width: 250px; height: 250px;">
										<img alt="" src="">
									</div>
									<div>
										<span class="btn btn-primary btn-file"><span
											class="fileinput-new">Select image</span><span
											class="fileinput-exists">Change</span><input type="file"
											name="file" id="artimg"></span> <a href="#"
											class="btn btn-danger fileinput-exists"
											data-dismiss="fileinput">Remove</a>
									</div>
								</div>
							</div>
							<div class="col-sm-9" style="padding: 0px;">
								<input type="hidden" value="${sesslogin.id}" name="userid"
									id="userid" /> <input type="hidden" value="${param.id}"
									name="userid" id="id" />
								<div class="form-group" style="margin-bottom: 40px;">
									<label for="title">Title:</label> <input type="text"
										placeholder="Add Title Here" class="form-control" id="title"
										name="title" autofocus>
								</div>
								<div class="form-group">
									<label for="content">Content:</label>
									<textarea rows="12" cols="50" class="form-control"
										placeholder="Add Content Here" id="content" name="content" style="border: 1px solid #ddd;"></textarea>
								</div>
							</div>
						</div>
						<!--row3  -->

							<button type="button" class="btn btn-primary pull-right"
								onclick="saveArticle()" id="btnsave">
								<b>S</b>ave
							</button>
			
					</form>

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
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/lib/bootpag.js"></script>		
	<!-- End Javascript Library -->

	<!-- Custom Javascript -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/default.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/author/authorarticle.js"></script>
	<!-- End Custom Javascript -->
</body>
</html>