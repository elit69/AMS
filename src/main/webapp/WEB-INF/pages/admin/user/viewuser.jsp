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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lib/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lib/bootstrap-select.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/userstyle.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lib/font-awesome-4.3.0/css/font-awesome.min.css">	

<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/lib/jquery-2.1.4.min.js"></script>	
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/lib/jasny-bootstrap.js"></script>

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
	<h1>Users Information</h1>
	<br />
	<br />
	<div id="show"></div>
	<!-- Trigger the modal with a button -->
	<!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button> -->

	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #009688; color: white;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div>
					<div>
						<img id="image" style="width: 200px; height: 200px;" />
					</div>
					<div id="showdetail" class="modal-body">
						<!-- Some text in the modal. -->
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>


	<script type="text/javascript">
		startPage();
		function startPage() {
			//alert("start page");
			$
					.ajax({
						type : "GET",
						url : "${pageContext.request.contextPath}/api/admin/user/list/" + 10,
						dataType : 'json',
						data : null,
						success : function(data) {
							//alert("Success :" + data.MESSAGE);
							displayData(data);
						},
						error : function(data) {
							alert("Unsuccess: " + data.MESSAGE);
							console.log("ERROR..." + data);
						}
					});

		}

		function displayData(data) {
			var table = "<table class='table table-bordered table table-hover'><tr>"
					+ "<th>ID</th><th>Name</th><th>Gender</th>"
					+ "<th>email</th><th>username</th><th>password</th><th>Enable</th><th>address</th><th>phone</th>"
					+ "<th>Image</th><th>Action</th></tr>";

			for (var i = 0; i < data.RESPONSE_DATA.length; i++) {
				table += "<tr><td>"
						+ data.RESPONSE_DATA[i].id
						+ "</td><td>"
						+ data.RESPONSE_DATA[i].name
						+ "</td><td>"
						+ data.RESPONSE_DATA[i].gender
						+ "</td><td>"
						+ data.RESPONSE_DATA[i].email
						+ "</td><td>"
						+ data.RESPONSE_DATA[i].username
						+ "</td><td>"
						+ data.RESPONSE_DATA[i].password
						+ "</td><td>"
						+ data.RESPONSE_DATA[i].enable
						+ "</td><td>"
						+ data.RESPONSE_DATA[i].address
						+ "</td><td>"
						+ data.RESPONSE_DATA[i].phone
						+ "</td><td><img class='img-rounded' style='width:50px; height:50px' src='${pageContext.request.contextPath}/resources/upload/profile/"
						+data.RESPONSE_DATA[i].image+"' /></td>"
						+ "<td class='col-sm-3'><input type='button' value='Detail' class='btn btn-info'"
						+ "data-toggle='modal' data-target='#myModal' onclick='detailuser("
						+ data.RESPONSE_DATA[i].id
						+ ")' />&nbsp;&nbsp;"
						+ "<input type='button' value='Edit' class='btn btn-warning' onclick='edituser("
						+ data.RESPONSE_DATA[i].id
						+ ")' />&nbsp;&nbsp;"
						+ "<input type='button' value='Delete' class='btn btn-danger' onclick='deleteuser("
						+ data.RESPONSE_DATA[i].id + ")' />" + "</td></tr>";
			}
			table += "</table>";
			$("#show").html(table);
			//${pageContext.request.contextPath}/resources/upload/profile/
		}

		function detailuser(id) {
			//alert(id);
			var str = "";
			$.ajax({
				type : "GET",
				url : "api/admin/user/get/" + id,
				success : function(data) {
					//alert("Success detail:" + data.MESSAGE);
					//alert(data.RESPONSE_DATA.name);
					$("#image").attr(
							"src",
							"${pageContext.request.contextPath}/resources/upload/profile/"
									+ data.RESPONSE_DATA.image);
					str = "Name: " + data.RESPONSE_DATA.name + "<br/>"
							+ "Gender: " + data.RESPONSE_DATA.gender + "<br/>"
							+ "Email: " + data.RESPONSE_DATA.email + "<br/>"
							+ "Username: " + data.RESPONSE_DATA.username
							+ "<br/>" + "Password: "
							+ data.RESPONSE_DATA.password + "<br/>"
							+ "address: " + data.RESPONSE_DATA.address
							+ "<br/>" + "Phone: " + data.RESPONSE_DATA.phone
							+ "<br/>";
					$("#showdetail").html(str);
				},
				error : function(data) {
					alert("Unsuccess:" + data.MESSAGE);
					console.log("ERROR..." + data);
				}
			});
		}

		function edituser(id) {
			location.href = "${pageContext.request.contextPath}/admin/user/edit/"
					+ id;
		}

		function deleteuser(id) {
			alert("delete user.");
			$.ajax({
				type : "DELETE",
				url : "api/admin/user/delete/" + id,
				dataType : 'json',
				success : function(data) {
					alert("Success: " + data.MESSAGE);
					startPage();
				},
				error : function(data) {
					alert("Unsuccess:" + data.MESSAGE);
					console.log("ERROR..." + data);
				}
			});

		}
	</script>
</body>
</html>