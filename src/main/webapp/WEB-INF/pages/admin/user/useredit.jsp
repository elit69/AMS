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
</head>
<body>
	<form action="#" method="POST" enctype="multipart/form-data">
		ID <input type="hidden" id="id" value="${user.id }" /><br/><br/>
		Name <input type="text" id="name" value="${user.name }" /><br/><br/>
		Gender
		<c:choose>
			<c:when test="${user.gender=='f'}">
				<input type="radio" name="gender" value="f" checked/> Female
				<input type="radio" name="gender" value="m" /> Male <br/><br/>
			</c:when>
			<c:otherwise>
				<input type="radio" name="gender" value="f" /> Female <br/><br/>
				<input type="radio" name="gender" value="m" checked/> Male <br/><br/>
			</c:otherwise>
		</c:choose>   
		Email <input type="text" id="email" value="${user.email }"/><br/><br/>
		User Name <input type="text" id="username" value="${user.username }"/><br/><br/>
		Password <input type="text" id="password" value="${user.password }"/><br/><br/>
		Address <input type="text" id="address" value="${user.address }"/><br/><br/>
		Phone <input type="text" id="phone" value="${user.phone }"/><br/><br/>
		Enable
		<c:when test="${user.enable==1}">
			<input type="radio" name="enable" value="1"/ checked>Enable
			<input type="radio" name="enable" value="0"/>Disable<br/><br/>
		</c:when>
		<c:otherwise>
			<input type="radio" name="enable" value="1"/>Enable
			<input type="radio" name="enable" value="0" checked/>Disable<br/><br/>
		</c:otherwise>
		<%-- Image <input type="file" name="file" id="image" value="${user.image }"/><br/><br/> --%>
		
		<input type="button" value="Submit" onclick="updateUser()" />
		<input type="reset" value="Clear"  />
	</form>
	
	<script type="text/javascript">
		var img=0;
		//var temp_image="";
		function updateUser(){
			alert("update user");
			json = {
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
				});
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