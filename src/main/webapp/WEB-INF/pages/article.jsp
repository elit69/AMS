<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- CSS Library -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/lib/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lib/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lib/bootstrap-select.min.css">
<!-- End CSS Library -->

<!-- Custom StyleSheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/index.css">
<!-- End Custom StyleSheet -->
<title>List Article</title>
</head>
<body ng-controller="myController">
	<div id="main" class="container-fluid">
		<div class="col-sm-12">
			<div class="col-sm-12 card form-horizontal">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-condensed table-hover">
						<thead>
							<tr style="text-align:center">
								<th>#</th>
								<th>Title</th>
								<th>Content</th>
								<th>Image</th>
								<th>Published Date</th>
								<th>Status</th>
								<th>Author</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="x in list">
								<td></td>
								<td ng-cloak>{{x.title}}</td>
								<td ng-cloak>{{x.content}}</td>
								<td ng-cloak>{{x.image}}</td>
								<td ng-cloak>{{x.pubdate}}</td>
								<td ng-cloak>{{x.enable}}</td>
								<td ng-cloak>View</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>
	<script>
		var app = angular.module('myApp', []);
		app.controller('myController', function($scope, $http) {
			$http.get('${pageContext.request.contextPath}/admin/api/list')
					.success(function(data) {
						$scope.list = data.RESPONSE_DATA;
					})
		})
	</script>
</body>
</html>