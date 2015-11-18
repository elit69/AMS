<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
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
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/lib/bootstrap.min.css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/lib/bootstrap-select.min.css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/userstyle.css" />
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"/>
</head>
<body>
	<h1>Users Information</h1> <br/><br/>
	<div id="show"></div>
	<!-- Trigger the modal with a button -->
	<!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button> -->
	
	<!-- Modal -->
	<div id="myModalDetail" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header" style="background-color: #009688; color:white;">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">User Information</h4>
	      </div>
	      <div class="modal-body">
	        <!-- <p>Some text in the modal.</p> -->
	        <div id="showdetail"></div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	  
	</div>
	
	
	<script type="text/javascript">
		startPage();
		function startPage(){
			//alert("start page");
			$.ajax({
				type : "GET",
				url : "admin/api/user/list",
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
						+ "<th>email</th><th>username</th><th>password</th><th>address</th><th>phone</th>"
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
						+ data.RESPONSE_DATA[i].address
						+ "</td><td>"
						+ data.RESPONSE_DATA[i].phone
						+ "</td><td><img class='img-rounded' src='${pageContext.request.contextPath}/resources/upload/profile/"
						+data.RESPONSE_DATA[i].image+"' /></td>"
						+ "<td class='col-sm-3'><input type='button' value='Detail' class='btn btn-info'"
						+"data-toggle='modal' data-target='#myModalDetail' onclick='detailuser("
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
		}
		
		function detailuser(id){
			//alert(id);
			var str="";
			$.ajax({
				type : "GET",
				url : "admin/api/user/get_user/"+id,
				success : function(data) {
					alert("Success detail:" + data.MESSAGE);
					//alert(data.RESPONSE_DATA.name);
					str="Name: "+data.RESPONSE_DATA.name+"<br/>"
						+"Gender: "+data.RESPONSE_DATA.gender+"<br/>"
						+"Email: "+data.RESPONSE_DATA.email+"<br/>"
						+"Username: "+data.RESPONSE_DATA.username+"<br/>"
						+"Password: "+data.RESPONSE_DATA.password+"<br/>"
						+"address: "+data.RESPONSE_DATA.address+"<br/>"
						+"Phone: "+data.RESPONSE_DATA.phone+"<br/>";
					$("#showdetail").html(str);
				},
				error : function(data) {
					alert("Unsuccess:" + data.MESSAGE);
					console.log("ERROR..." + data);
				}
			}); 
		}
		
		function edituser(id){
			//alert("edit user.");
			$.ajax({
				type : "POST",
				url : "admin/api/user/detail",
				data : {
					id : id
				},
				success : function(data) {
					//alert("Success detail:" + data.MESSAGE);
					$.ajax({
						type : "POST",
						url : "admin/api/user/edit",
						data : {
							data : data
						},
						success : function(data) {
							//alert("Success detail:" + data.MESSAGE);
							startPage();
						},
						error : function(data) {
							alert("Unsuccess:" + data.MESSAGE);
							console.log("ERROR..." + data);
						}
					}); 
					
				},
				error : function(data) {
					alert("Unsuccess:" + data.MESSAGE);
					console.log("ERROR..." + data);
				}
			}); 
			
		}
		
		function deleteuser(id){
			alert("delete user.");
			$.ajax({
				type : "DELETE",
				url : "admin/api/user/delete/"+id,			
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