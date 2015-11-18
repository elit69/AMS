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
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/lib/bootstrap.min.css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/lib/bootstrap-select.min.css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/userstyle.css" />
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

<title>Update User</title>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
	<form action="#" method="POST" enctype="multipart/form-data">
		ID <input type="hidden" id="id"  /><br/><br/>
		Name <input type="text" id="name" /><br/><br/>
		Gender	<input type="radio" name="gender" value="f" checked/> Female
				<input type="radio" name="gender" value="m" /> Male <br/><br/> 
		Email <input type="text" id="email" /><br/><br/>
		User Name <input type="text" id="username" /><br/><br/>
		Password <input type="text" id="password" /><br/><br/>
		Address <input type="text" id="address" /><br/><br/>
		Phone <input type="text" id="phone" /><br/><br/>
		Enable
			<input type="radio" name="enable" value="1" checked>Enable
			<input type="radio" name="enable" value="0"/>Disable<br/><br/>
		<%-- Image <input type="file" name="file" id="image" value="${user.image }"/><br/><br/> --%>
		<br/><br/>
		<input type="button" class="btn btn-primary" value="Update" onclick="updateUser()" />
		<input type="reset" class="btn btn-warning" value="Clear"  />
	</form>
	
	<script type="text/javascript">
		startPage();
		function startPage(){
			alert("${id}");
			$.ajax({
				type : "GET",
				url : "api/admin/user/get_user/"+"${id}",
				success : function(data) {
					alert("Success detail:" + data.MESSAGE);
					//alert(data.RESPONSE_DATA.name);
				},
				error : function(data) {
					alert("Unsuccess:" + data.MESSAGE);
					console.log("ERROR..." + data);
				}
			}); 
		}
		var img=0;
		//var temp_image="";
		function updateUser(){
			alert("update user");
			/*json = {
					id : $("#id").val(),
					name : $("#name").val(),
					gender : $('input:radio[name=gender]:checked').val(),
					email : $("#email").val(),
					username : $("#username").val(),
					password : $("#password").val(),
					address : $("#address").val(),
					phone : $("#phone").val(),
					enable : $('input:radio[name=enable]:checked').val(),
					image : "default.jpg"
				};

				$.ajax({
					type : "POST",
					url : "admin/api/user/updateuser",
					dataType : 'json',
					data : json,
					success : function(data) {
						alert("Success :" + data.MESSAGE);
						uploadImage();
					},
					error : function(data) {
						alert("Unsuccess: " + data.MESSAGE);
						console.log("ERROR..." + data);
					}
				}); */
		}
		
		/* $("#image").change(function() {
			//alert("change image");
			img = 1;
		}); */
		
		/* function uploadImage() {
			alert("upload image");
			var data1;
			data1 = new FormData();
			data1.append('file', $('#image')[0].files[0]);
			$.ajax({
				url : "admin/api/user/uploadimage",
				type : "POST",
				cache : false,
				contentType : false,
				processData : false,
				data : data1,
				success : function(data2) {
					alert("success uploading");
				}
			}); 
		}  */
		
		
		
		
	</script>
</body>
</html>