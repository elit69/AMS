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
						<li class="active"><a href="${pageContext.request.contextPath}/author"><i
								class="fa fa-list fa-lg"></i> List</a></li>
						<li><a
							href="${pageContext.request.contextPath}/author/add"><i
								class="fa fa-plus fa-lg"></i> Add</a></li>
						<li><a href="#"><i class="fa fa-search fa-lg"></i> Search</a></li>
					</ul></li>
			</ul>
		</div>
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row col-sm-12 center-block card">
					<h3>List Article</h3>
					<hr>
					<div class="row col-sm-12" style="margin: 10px auto; padding: 0px;">
						<input type="hidden" value="${sesslogin.id}" name="userid"
							id="userid" />
						<!--row2  -->
						<div class="col-sm-3">
							<select id="searchby" class="form-control">
								<option value='title' selected="selected">(Search
									By)->Title</option>
								<option value='name'>(Search By)->Author</option>
							</select>
						</div>
						<div class="col-sm-3">
							<select id="numberrow" class="form-control"
								onchange="getRowNumber()">
								<option value='10' selected="selected">10-Row to
									display</option>
								<option value='15'>15-Row to display</option>
								<option value='20'>20-Row to display</option>
							</select>
						</div>
						<div class="col-sm-6" style="padding: 0px;">
							<form class="navbar-form" role="search"
								style="margin: 0px; float: right;">
								<div class="form-group" style="margin: 0px;">
									<input type="text" class="form-control" placeholder="Search"
										id="search">
								</div>
								<button type="button" class="btn btn-success"
									onclick="getRowNumber()">
									<b>Search</b>
								</button>
							</form>
						</div>
					</div>
					<!--row2  -->
					<div class="row col-sm-12" style="margin: auto;" id="display">
						<!--row3  -->
					</div>
					<!--row3  -->
					<div class="row col-sm-12"
						style="margin: auto; text-align: center;">
						<!--row4  -->
						<div class="demo3"></div>
					</div>
					<!--row4  -->

				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header bgheadstyle">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" align="center"
						style="color: #00C853; font-family: 'Book Antiqua'; font-size: 20px;">
						<b>Article Information</b>
					</h4>
				</div>
				<div class="col-sm-12"
					style="margin-top: 15px; padding-bottom: 15px;">
					<div class="col-sm-12" id="title" style="padding: 0px;"></div>
					<div class="row col-sm-12" id="content">
						<!--For Content  -->
					</div>
				</div>
				<div class="modal-footer" style="border-top: 2px solid gray;">
					<div class="row col-sm-12">
						<div class="row col-sm-3">
							<small id="poster"></small>
						</div>
						<div class="row col-sm-3">
							<small id="postdate"></small>
						</div>
					</div>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
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
		src="${pageContext.request.contextPath}/resources/js/author/authorlistarticle.js"></script>
	<!-- End Custom Javascript -->
</body>
</html>