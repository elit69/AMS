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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lib/bootstrap-select.min.css">
<!-- Important Owl stylesheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/owl-carousel/owl.carousel.css">

<!-- Default Theme -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/owl-carousel/owl.theme.css">
<!-- End CSS Library -->

<!-- Custom StyleSheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<!-- End Custom StyleSheet -->

</head>
<body>
	<div id="main" class="container-fluid">
		<div class="row col-sm-10 center-block">
			<div class="col-sm-12 card form-horizontal">
				<h3>
					<i class="fa fa-list"></i>&nbsp;&nbsp;&nbsp;Article Informations					
					<c:choose>
						<c:when test="${not login}">
							<a class="btn btn-primary pull-right" href="${pageContext.request.contextPath}/login"><i class="fa fa-sign-in fa-2x"></i></a>
						</c:when>
						<c:otherwise>
							<a class="btn btn-primary pull-right" href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out fa-2x"></i></a>
						</c:otherwise>
					</c:choose>
					<a class="btn btn-primary pull-right" href="${pageContext.request.contextPath}/help"><i class="fa fa-question-circle fa-2x"></i></a>
				</h3>
				<hr>
				<!--end row1  -->
				<!--row2  -->
				<div class="row col-sm-12" style="margin: auto;">
					<div class="col-sm-6" style="padding: 0px;">
						<form class="navbar-form" role="search"
							style="margin: 0px; float: right;">
							<div class="form-group" style="margin: 0px;">
								<input type="text" class="form-control" placeholder="Search"
									id="search" onkeyup="getRowNumber()">
							</div>
							<button type="button" class="btn btn-success"
								onclick="getRowNumber()">
								<b>Search</b>
							</button>
						</form>
					</div>
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
							<option value='10' selected="selected">10-Row to display</option>
							<option value='15'>15-Row to display</option>
							<option value='20'>20-Row to display</option>
						</select>
					</div>

				</div>
				<!--end row2  -->
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

























