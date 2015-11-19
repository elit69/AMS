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
		Gender	<input type="radio" name="gender" value="f" id="f"/> Female
				<input type="radio" name="gender" value="m" id="m" /> Male <br/><br/> 
		Email <input type="text" id="email" /><br/><br/>
		User Name <input type="text" id="username" /><br/><br/>
		Password <input type="text" id="password" /><br/><br/>
		Address <input type="text" id="address" /><br/><br/>
		Phone <input type="text" id="phone" /><br/><br/>
		Enable
			<input type="radio" name="enable" value="true" id="e">Enable
			<input type="radio" name="enable" value="false" id="d"/>Disable<br/><br/>
		Image <input type="file" name="file" id="image"/><br/><br/> 
		<br/><br/>
		<input type="button" class="btn btn-primary" value="Update" onclick="updateUser()" />
		<input type="reset" class="btn btn-warning" value="Clear"  />
	</form>
	
	<script type="text/javascript">
		var img=0;
		var img_temp;
		
		startPage();
		function startPage(){
			id="${id}";
			//alert(id);
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/api/admin/user/get_user/"+id,
				success : function(data) {
					//alert("Success detail:" + data.MESSAGE);
					//alert(data.RESPONSE_DATA.name);
					$("#id").val(data.RESPONSE_DATA.id);
					$("#name").val(data.RESPONSE_DATA.name);
					if(data.RESPONSE_DATA.gender=="f"){
						$("#f").attr('checked',true);
					}else{
						$("#m").attr('checked',true);
					}
					$("#email").val(data.RESPONSE_DATA.email);
					$("#username").val(data.RESPONSE_DATA.username);
					$("#password").val(data.RESPONSE_DATA.password);
					$("#address").val(data.RESPONSE_DATA.address);
					$("#phone").val(data.RESPONSE_DATA.phone);
					img_temp=data.RESPONSE_DATA.image;
					
					if(data.RESPONSE_DATA.enable==true){
						$("#e").attr('checked',true);
					}else{
						$("#d").attr('checked',true);
					} 
				},
				error : function(data) {
					alert("Unsuccess get user:" + data.MESSAGE);
					console.log("ERROR..." + data);
				}
			}); 
		}
		$("#image").change(function() {
			//alert("change image");
			img = 1;
		});
		function uploadImage() {
			alert("upload image");
			var data1;
			data1 = new FormData();
			data1.append('file', $('#image')[0].files[0]);
			$.ajax({
				url : "api/admin/user/uploadimage",
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
		function updateUser(){
			if(img==0){
				img=img_temp;
			}else{
				img=$("#image").val().split("\\").pop();
			}
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
					image : img
				};

				$.ajax({
					type : "PUT",
					url : "${pageContext.request.contextPath}/api/admin/user/update/"+$("#id").val(),
					data : JSON.stringify(json),
					contentType: 'application/json',
					success : function(data) {
						alert("Success :" + data.MESSAGE);
						uploadImage();
						location.href="${pageContext.request.contextPath}/formlistuser";
					},
					error : function(data) {
						alert("Unsuccess: " + data.MESSAGE);
						console.log("ERROR..." + data);
					}
				}); 
		}
		
		
		
		
		
		
	</script>
</body>
</html>