<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Article</title>
</head>
<body ng-controller="myController">
				<table >
						<thead>
							<tr>
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
								<td >{{x.title}}</td>
								<td >{{x.content}}</td>
								<td >{{x.image}}</td>
								<td >{{x.pubdate}}</td>
								<td >{{x.enable}}</td>
								<td >View</td>
							</tr>
						</tbody>
					</table>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>
	<script>
		var app = angular.module('myApp', []);
		app.controller('myController', function($scope, $http) {
			$http.get('${pageContext.request.contextPath}/api/admin/article/list/10/2')
					.success(function(data) {
						$scope.list = data.RESPONSE_DATA;
					})
		})
	</script>
</body>
</html>