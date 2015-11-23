<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="author" content="Chhorn Elit">
<meta lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS Library -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lib/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lib/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lib/bootstrap-select.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lib/jasny-bootstrap.css">
<!-- End CSS Library -->

<!-- Custom StyleSheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/index.css">
<!-- End Custom StyleSheet -->
<!--javacript library  -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/lib/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/lib/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/lib/bootpag.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/lib/jasny-bootstrap.js"></script>
<!--end javascript library  -->
<style>
* {
	padding: 0px;
	margin: 0px;
}

.mywraper {
	background: white;
	box-shadow: -1px -1px 3px gray;
}

.mystyle {
	color: #0277BD;
	font-family: "Khmer OS Muol";
	font-weight: bold;
}
</style>

</head>
<c:set var="sesslogin" value="${sessionScope.user }"></c:set>
<body style="background: white;">
	<div id="main" class="container-fluid"
		style="margin: 10px auto; width: 90%; padding-bottom: 20px; box-shadow: -1px -1px 3px gray; background: #EEEEEE;">
		<div class="col-sm-12">
			<div class="row col-sm-12" style="margin: auto;">
				<!--row1  -->
				<h2
					style="color: rgb(63, 72, 204); font-family: 'Monotype Corsiva'; padding: 10px; font-weight: bolder; border-bottom: 3px solid rgb(63, 72, 204); height: 100%;">
					<i class="fa fa-folder-open"></i>&nbsp;&nbsp;&nbsp;Add New Article
				</h2>
			</div>
		</div>
		<!--end row1  -->
		<div class="row col-sm-12" style="margin: auto;" class="mywraper">
			<!--row wraper  -->
			<div class="row col-sm-12" style="margin: 0px auto;">
				<!--row1  -->
				<div class="col-sm-12" style="margin: 0px auto; padding: 0px;">
					<ul class="nav nav-tabs nav-justified"
						style="padding: 0px; margin: 0px;">
						<li role="presentation" class="active mystyle"><a
							href="authorarticle">Add New Article</a></li>
						<li role="presentation" class="mystyle"><a
							href="authorlistarticle">View Your Article</a></li>
					</ul>
				</div>
			</div>
			<!--end row1  -->
			<form id="frmAdd" method="POST">
				<input type="hidden" value="${sesslogin.id}" name="userid"
					id="userid" /> <input type="hidden" value="${param.id}"
					name="userid" id="id" />
				<div class="row col-sm-12" style="margin: auto;">
					<!--row2  -->
					<div class="col-sm-12" style="padding: 0px;">
						<div class="form-group">
							<label for="email">Title:</label> <input type="text"
								class="form-control" id="title" name="title">
						</div>
					</div>
				</div>
				<!--row2  -->
				<div class="row col-sm-12" style="margin: auto;">
					<!--row3  -->
					<div class="col-sm-3" style="padding: 0px;">
						<div class="fileinput fileinput-new" data-provides="fileinput"
							style="margin: 0px; padding: 0px;">
							<div id="disp" class="fileinput-preview thumbnail" data-trigger="fileinput"
								style="width: 250px; height: 250px;">
							<img alt="" src="">	
							</div>
							<div>
								<span class="btn btn-primary btn-file"><span
									class="fileinput-new">Select image</span><span
									class="fileinput-exists">Change</span><input type="file"
									name="file" id="artimg"></span> <a href="#"
									class="btn btn-danger fileinput-exists"
									data-dismiss="fileinput">Remove</a>
							</div>
						</div>
					</div>
					<div class="col-sm-9" style="padding: 0px;">
						<div class="form-group">
							<textarea rows="12" cols="50" class="form-control"
								placeholder="Add Content Here" id="content" name="content"></textarea>
						</div>
					</div>
				</div>
				<!--row3  -->
				<div class="row col-sm-12" style="margin: auto; text-align: right;">
					<button type="button" class="btn btn-primary"
						onclick="saveArticle()" id="btnsave">
						<b>S</b>ave
					</button>
				</div>
			</form>
		</div>
		<!--end wraper -->
	</div>
	<script type="text/javascript">
		function processUpload() {
			var oMyForm = new FormData();
			oMyForm.append('file', $('#artimg')[0].files[0]);
			$.ajax({
				dataType : 'json',
				url : "uploadfile",
				data : oMyForm,
				type : "POST",
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				success : function(result) {
						alert("Save and Upload Successful..!");
				},
				error:function(result){
					alert(result.MESSAGE);
				}
			});
		}
		function saveArticle() {
			json = {
				key : "C",
				title : $("#title").val(),
				image : "${pageContext.request.contextPath}/resources/upload/images/"+$("#artimg").val().replace(/^.*[\\\/]/, ''),
				content : $("#content").val(),
				userid : $("#userid").val()
			};
			$.ajax({
				type : "POST",
				url : "authorworkarticle",
				dataType : 'json',
				data : json,
				success : function(data) {
					processUpload();
				},
				error : function(data) {
					alert("Unsuccess" + data.MESSAGE);
				}
			});
		}
		var img = "";
		var change = false;
		$("#artimg").change(function() {
			change = true;
		});
		function toControls() {
			json = {
				key : "TC",
				id : $("#id").val()
			};
			$.ajax({
				type : "POST",
				url : "authorworkarticle",
				dataType : 'json',
				data : json,
				success : function(data) {
					$("#title").val(data.RESPONE_DATA.title);
					$("#content").val(data.RESPONE_DATA.content);
					$("#disp img").attr("src",data.RESPONE_DATA.image);
					img = data.RESPONE_DATA.image;
					$("#btnsave").html("<b>U</b>pdate");
					$("#btnsave").attr("onclick", "updateArticle()");
				},
				error : function(data) {
					alert("Unsuccess" + data.MESSAGE);
				}
			});
		}

		function updateArticle() {
			if (change) {
				img = "${pageContext.request.contextPath}/resources/upload/images/"+$("#artimg").val().replace(/^.*[\\\/]/, '');
				processUpload();
			}
			json = {
				key : "U",
				id : $("#id").val(),
				title : $("#title").val(),
				image : img,
				content : $("#content").val()
			};
			$.ajax({
				type : "POST",
				url : "authorworkarticle",
				dataType : 'json',
				data : json,
				success : function(data) {
					$("#btnsave").html("<b>S</b>ave");
					$("#btnsave").attr("onclick", "saveArticle()");
				},
				error : function(data) {
					alert("Unsuccess" + data.MESSAGE);
				}
			});
		}

		function testCondition() {
			if ($("#id").val() != "") {
				toControls();
			}
		}
		testCondition();
	</script>
</body>
</html>

























