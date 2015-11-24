<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	href="${pageContext.request.contextPath}/resources/css/home.css">
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
				<li><a href="${pageContext.request.contextPath}/help"><i
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
		<div class="row col-sm-11 center-block card form-horizontal">
			<div class="col-sm-11 center-block">
				<div class="col-sm-8">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search"
							id="search" onkeyup="getRowNumber()" autofocus> <span
							class="input-group-btn">
							<button type="button" class="btn btn-primary"
								onclick="getRowNumber()">
								<span class="fa fa-search"></span>&nbsp;Search
							</button>
						</span>
					</div>
				</div>
				<div class="col-sm-2">
					<select id="searchby" class="form-control">
						<option value='title' selected="selected">Title</option>
						<option value='name'>Author</option>
					</select>
				</div>
				<div class="col-sm-2">
					<select id="numberrow" class="form-control"
						onchange="getRowNumber()">
						<option value='10' selected="selected">10-Row</option>
						<option value='15'>15-Row</option>
						<option value='20'>20-Row</option>
					</select>
				</div>

			</div>
			<!--end row1  -->

			<div class="row col-sm-12" style="margin: auto;">
				<!--row3  -->
				<div class="col-sm-12" style="height: auto;" id="display"></div>
			</div>
			<!--end row3  -->
			<div class="row col-sm-12" style="text-align: center;"
				style="margin:auto;">
				<!--row4  -->
				<div class="demo3"></div>
			</div>
			<!--end row4  -->

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
		</div>
	</div>

	<!--Javacript Library-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/lib/jquery-2.1.4.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/lib/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/lib/bootpag.js"></script>
	<!--End Javascript Library-->

	<!--Custom Javacript-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/home.js"></script>
	<!--End Custom Javacript-->
</body>
</html>

























