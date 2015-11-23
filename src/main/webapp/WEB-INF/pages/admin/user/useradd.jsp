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
<title>Add User</title>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
<style type="text/css">
	.navbar{
		background-color: #009688;
		color:white;
	}
	.col-md-2,.col-md-10{
		margin-top:20px;
	}
	.menu-left{
		background-color:gray;
	}
	.navbar a{
		color:white;
	}
</style>
</head>
<body>
<nav class="navbar">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Brand</a>
    </div>
  </div><!-- /.container-fluid -->
</nav>
<!-- body form -->
<div class="row">
	<div class="col-md-2 menu-left">
		<!-- menu left -->
	
	</div>
	<div class="col-md-10">
		<div class="row">
			<div class="col-md-2">
				<div class="fileinput fileinput-new" data-provides="fileinput">
					<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"></div>
						<div>
							<span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span>
							<span class="fileinput-exists">Change</span>
							<input type="file" name="file" id="image"/></span>
							<a href="#"	class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
						</div>
				</div>	
			</div>
			<div class="col-md-10">
					<form action="#" method="POST" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-2">
								<!-- ID -->
							</div>
							<div class="col-md-10">
								<input type="hidden" id="id" />
							</div>
							<div class="col-md-2">Name</div>
							<div class="col-md-10">
								<input type="text" id="name" class="form-control"
									placeholder="enter name" />
							</div>
							<div class="col-md-2">Gender</div>
							<div class="col-md-10">
								<input type="radio" name="gender" value="f" /> Female <input
									type="radio" name="gender" value="m" checked/> Male
							</div>
							<div class="col-md-2">Email</div>
							<div class="col-md-10">
								<input type="text" id="email" class="form-control"
									placeholder="enter email" />
							</div>
							<div class="col-md-2">User Name</div>
							<div class="col-md-10">
								<input type="text" id="username" class="form-control"
									placeholder="enter username" />
							</div>
							<div class="col-md-2">Role</div>
							<div class="col-md-10">
								<select class="form-control" name="role_id" id="userrole">
									<option value="1">ROLE_ADMIN</option>
									<option value="2">ROLE_AUTHOR</option>
								</select>
							</div>
							<div class="col-md-2">Password</div>
							<div class="col-md-10">
								<input type="text" id="password" class="form-control"
									placeholder="enter password" />
							</div>
							<div class="col-md-2">Address</div>
							<div class="col-md-10">
								<input type="text" id="address" class="form-control"
									placeholder="enter address" />
							</div>
							<div class="col-md-2">Phone</div>
							<div class="col-md-10">
								<input type="text" id="phone" class="form-control"
									placeholder="enter phone" />
							</div>
							<div class="col-md-2">Enable</div>
							<div class="col-md-10">
								<input type="radio" name="enable" value="true" checked/>Enable <input
									type="radio" name="enable" value="false" />Disable
							</div>
							<div class="col-md-2">
								<input type="button" class="btn btn-primary" value="Submit"	onclick="addUser()" />
							</div>
							<div class="col-md-10">
								<input type="reset" class="btn btn-warning" value="Clear" />
							</div>
						</div>
					</form>
				</div>
		</div><!--  close row -->
		
	</div>
</div>
<!-- body form -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			
		</div>
	</div>
	
</div>
<!-- close body form -->
	<script type="text/javascript">
		function addUser(){
			alert("add user");
			json = {
					name : $("#name").val(),
					gender : $('input:radio[name=gender]:checked').val(),
					email : $("#email").val(),
					username : $("#username").val(),
					password : $("#password").val(),
					address : $("#address").val(),
					phone : $("#phone").val(),
					enable : $('input:radio[name=enable]:checked').val(),
					image : $("#image").val().split("\\").pop(), //"default.jpg" 
					role_id: $('select[name="role_id"] option:selected').val()
				};
				//alert($('select[name="role_id"] option:selected').val());
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/api/admin/user/",
					data : JSON.stringify(json),
					contentType: 'application/json',
					success : function(data) {
						alert("Success :" + data.MESSAGE);
						uploadImage();
					},
					error : function(data) {
						alert("Unsuccess: " + data.MESSAGE);
						console.log("ERROR..." + data);
					}
				});
		}
		
		function uploadImage() {
			alert("upload image");
			var data1;
			data1 = new FormData();
			data1.append('file', $('#image')[0].files[0]);
			$.ajax({
				url : "${pageContext.request.contextPath}/api/admin/user/uploadimage",
				type : "POST",
				cache : false,
				contentType : false,
				processData : false,
				data : data1,
				success : function(data2) {
					alert("success uploading");
				}
			}); 
		}  
				
	</script>
</body>
</html>