<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Test list article</title>
</head>
<body ng-controller="myController">
	<table>
		<thead>
			<tr>1</tr>
			<tr>2</tr>
			<tr>3</tr>
			<tr>4</tr>
			<tr>5</tr>
		</thead>
		<tbody>
			<tr ng-repeat="art in list">
				<td>{{art.id}}</td>
				<td>{{art.title}}</td>
				<td>{{art.content}}</td>
				<td>{{art.publish_date}}</td>
				<td></td>
			</tr>
		</tbody>
	</table>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>
<script>
var app = angular.module('myApp', []);
app.controller('myController',function($scope,$http) {
  	$http.get('${pageContext.request.contextPath}/admin/api/list').success(function(data) {
  			alert(data.MESSAGE);
            $scope.list=data.RESPONSE_DATA;
        })
})

</script>
</body>
</html>