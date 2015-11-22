<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="alternate" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel=stylesheet href="${pageContext.request.contextPath}/resources/css/table.css">
<title>List Article</title>
<style>
	tr td {
		text-align: center !important;
	}
</style>
</head>
<body ng-controller="myController">
<h1 >Article Management System</span></h1>
				<table class="responstable">
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
							<tr ng-repeat="x in list" >
								<td>{{$index+1}}</td>
								<td >{{x.title}}</td>
								<td >{{x.content}}</td>
								<td ><img ng-src="${pageContext.request.contextPath}/resources/upload/profile/{{x.image}}" class="img-responsive" width="100px" height="100px"/></td>
								<td >{{x.pdate}}</td>
								<td ><img ng-src="${pageContext.request.contextPath}/resources/upload/profile/{{x.enable==true ? 'enable.png':'disable.png'}}" width="50px" height="50px"/></td>
								<td >{{x.name}}</td>
								<td ><input type="button" name="btnDelete" value="Delete" ng-click="deleteArticle(x.id)"></td>
							</tr>
						</tbody>
					</table>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>
	<script>
		var app = angular.module('myApp', []);
		app.controller('myController', function($scope, $http) {
			$http.get('${pageContext.request.contextPath}/api/admin/article/list/10').success(function(data) {
						$scope.list = data.RESPONSE_DATA;
					});
		$scope.deleteArticle=function(id){
				$http.delete('${pageContext.request.contextPath}/api/admin/article/delete/'+id).success(function(data) {
					$http.get('${pageContext.request.contextPath}/api/admin/article/list/10').success(function(data) {
						$scope.list = data.RESPONSE_DATA;
					})
				});
			}
					
		})
	</script>
</body>
</html>