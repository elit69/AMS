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
		<div class="row col-sm-8 center-block">
			<div class="col-sm-12 card form-horizontal">
				<h1>Login</h1>
				<hr>
				<form action="${pageContext.request.contextPath}/login"
					method="POST">
					<div class="col-sm-12 ">
						<div class="col-sm-8 center-block" style="margin-bottom: 40px;">
							<c:if test="${param.error != null}">
								<div class="alert alert-danger text-center">
									Your login attempt was not successful, try again.<br />
									Reason: ${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}
								</div>
							</c:if>
							<div class="form-group">
								<label class="col-sm-3">Username:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="username"
										placeholder="Enter Username" maxlength="20"
										value='${usrObj.username}' ${readonly } required autofocus>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3">Password: </label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="password"
										placeholder="Enter Password" maxlength="20"
										value='${usrObj.password}' ${readonly } required>
								</div>
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</div>

						<div class="col-sm-6 center-block">
							<button type="submit" id="btnAdd" class="btn btn-primary"
								style="width: 150px;">
								<i class="fa fa-sign-in"></i>&nbsp;&nbsp;Log Me in
							</button>
							<button type="reset" id="btnClear"
								class="btn btn-primary pull-right" style="width: 150px;">
								<i class="fa fa-eraser"></i>&nbsp;&nbsp;Reset
							</button>
						</div>
						<h1>${ERROR }</h1>

					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>