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
		<div class="row col-sm-8 center-block">
			<div class="col-sm-12 card form-horizontal">
				<h3>Error</h3>
				<hr />
				<div class="col-sm-8 center-block" style="margin-bottom: 40px;">
					<div class="alert alert-danger text-center">
						<h4>You are not authorized to access this page!</h4>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>