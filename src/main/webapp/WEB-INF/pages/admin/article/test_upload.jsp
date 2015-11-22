<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="#" method="post" accept-charset="utf-8" id="frmAdd">
		title:<input type="text" name="title" value=""><br/>
		content:<input type="text" name="content" value=""><br/>
		published date:<input type="text" name="" value=""><br/>
		status:<select name="enable" >
			<option value="true">Active</option>
			<option value="false">InActive</option>
		</select><br>
		image:<input type="file" name="file" value="" placeholder=""><br>
		user id:<input type="text" name="userid" value=""><br/>
		<input type="submit" name="btnSubmit" >
	</form>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	$(document).ready(function(e) {
		$("#frmAdd").submit(function(e) {
				e.preventDefault();
				$.ajax({
					type : "POST",
					/* url : "http://localhost:8080/BookMG/api/add", */
					url:"${pageContext.request.contextPath}/api/admin/article/add",
					enctype : 'multipart/form-data',
					data : new FormData(document.getElementById("frmAdd")),
					processData : false, // tell jQuery not to process the data
					contentType : false, // tell jQuery not to set contentType
					success : function(data) {
						console.log(data);
					},
					error : function(data) {
						console.log(data);
				}
			})
		});

	});

</script>
</html>