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
	font-family: "Khmer OS Muol";
}
thead{
color: white;
	background:#1565C0;
	font-family: "Book Antiqua";
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
					<i class="fa fa-list-ol"></i>&nbsp;&nbsp;&nbsp;View Article
					Information
				</h2>
			</div>
		</div>
		<input type="hidden" value="${sesslogin.id}" name="userid" id="userid" />
		<!--end row1  -->
		<div class="row col-sm-12" style="margin: auto;" class="mywraper">
			<!--row wraper  -->
			<div class="row col-sm-12" style="margin: 0px auto;">
				<!--row1  -->
				<div class="col-sm-12" style="margin: 0px auto; padding: 0px;">
					<ul class="nav nav-tabs nav-justified"
						style="padding: 0px; margin: 0px;">
						<li role="presentation" class="mystyle"><a
							href="add">Add New Article</a></li>
						<li role="presentation" class="active mystyle"><a
							href="../author/">View Your Article</a></li>
					</ul>
				</div>
			</div>
			<!--end row1  -->
			<div class="row col-sm-12" style="margin: 10px auto; padding: 0px;">
				<!--row2  -->
				<div class="col-sm-3">
					<select id="searchby" class="form-control">
						<option value='title' selected="selected">(Search
							By)->Title</option>
						<option value='name'>(Search By)->Author</option>
					</select>
				</div>
				<div class="col-sm-3">
					<select id="numberrow" class="form-control"
						onchange="getRowNumber()">
						<option value='10' selected="selected">10-Row to display</option>
						<option value='15'>15-Row to display</option>
						<option value='20'>20-Row to display</option>
					</select>
				</div>
				<div class="col-sm-6" style="padding: 0px;">
					<form class="navbar-form" role="search"
						style="margin: 0px; float: right;">
						<div class="form-group" style="margin: 0px;">
							<input type="text" class="form-control" placeholder="Search" 
								id="search">
						</div>
						<button type="button" class="btn btn-success" onclick="getRowNumber()">
							<b>Search</b>
						</button>
					</form>
				</div>
			</div>
			<!--row2  -->
			<div class="row col-sm-12" style="margin: auto;" id="display">
				<!--row3  -->
			</div>
			<!--row3  -->
			<div class="row col-sm-12" style="margin: auto; text-align: center;">
				<!--row4  -->
				<div class="demo3"></div>
			</div>
			<!--row4  -->
		</div>
		<!--end wraper -->
	</div>
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header bgheadstyle">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" align="center"
						style="color: #00C853; font-family: 'Book Antiqua'; font-size: 20px; ">
						<b>Article Information</b>
					</h4>
				</div>
				<div class="col-sm-12"
					style="margin-top: 15px; padding-bottom: 15px;">
					<div class="col-sm-12" id="title" style="padding: 0px; "></div>
					<div class="row col-sm-12" id="content">
						<!--For Content  -->
					</div>
				</div>
				<div class="modal-footer" style="border-top: 2px solid gray;">
					<div class="row col-sm-12">
						<div class="row col-sm-3">
							<small id="poster"></small>
						</div>
						<div class="row col-sm-3">
							<small id="postdate"></small>
						</div>
					</div>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		function getRowNumber() {
			json = {
				key : "GR",
				userid : $("#userid").val(),
				columnName : $("#searchby").val(),
				search : $("#search").val()
			};
			$.ajax({
				type : "POST",
				url : "../api/author/authorworkarticle",
				dataType : 'json',
				data : json,
				success : function(data) {
					setNumerRow(data.RESPONE_DATA);
				},
				error : function(data) {
					alert("Unsuccess" + data.MESSAGE);
				}
			});
		}
		getRowNumber();
		function setNumerRow(numr) {
			var page = 0;
			var displayrow = $("#numberrow").val();
			if (numr % displayrow != 0) {
				page = numr / displayrow + 1;
			} else {
				page = numr / displayrow;
			}
			$('.demo3').bootpag({
				total : page,
				maxVisible : 5,
				leaps : true,
				firstLastUse : true,
				first : '&#8592;',
				last : '&#8594;',
				wrapClass : 'pagination',
				activeClass : 'active',
				disabledClass : 'disabled',
				nextClass : 'next',
				prevClass : 'prev',
				lastClass : 'last',
				firstClass : 'first'
			}).on("page", function(event, num) {
				getArticleList(num);
			});
			getArticleList(1);
		}
		function getArticleList(page) {
			json = {
				key : "R",
				userid : $("#userid").val(),
				columnName : $("#searchby").val(),
				search : $("#search").val(),
				limitRow : $("#numberrow").val(),
				page : page
			};
			$.ajax({
				type : "POST",
				url : "../api/author/authorworkarticle",
				dataType : 'json',
				data : json,
				success : function(data) {
					$("#display").html(getList(data));
				},
				error : function(data) {
					alert("Unsuccess" + data.MESSAGE);
				}
			});
		}
		function getList(data) {
			var tbl = "<table class='table table-hover' style='margin-top: 10px;'>"
					+ "<thead>"
					+ "<tr>"
					+ "<th>ID</th>"
					+ "<th>Title</th>"
					+ "<th>Publish Date</th>"
					+ "<th  style='text-align:center;'>Status</th>"
					+ "<th style='text-align:center;'>Action</th>"
					+ "</tr>"
					+ "</thead><tbody>";
			for ( var i = 0; i < data.RESPONE_DATA.length; i++) {
				tbl += "<tr>"
						+ "<td>"
						+ data.RESPONE_DATA[i].id
						+ "</td>"
						+ "<td>"
						+ data.RESPONE_DATA[i].title
						+ "</td>"
						+ "<td>"
						+ data.RESPONE_DATA[i].pdate
						+ "</td>";
						if(data.RESPONE_DATA[i].enable){
							tbl+="<td  style='text-align:center;'><span class='label label-success'>Enable</span></td>";
						}else{
							tbl+="<td  style='text-align:center;'><span class='label label-danger'>Disable</span></td>";
						}
						tbl+= "<td style='text-align:right;'><button type='button' data-toggle='modal' data-target='#myModal' style='margin-right: 5px;'"
						+ "class='btn btn-primary btn-sm' onclick=getArticleDetail("
						+ data.RESPONE_DATA[i].id
						+ ") >"
						+ "<i class='fa fa-eye'></i></span></button>"
						+ "<button type='button' style='margin-right: 5px;' "
						+ "class='btn btn-danger btn-sm' onclick=deleteArticle("+data.RESPONE_DATA[i].id+")>"
						+ "Delete</button>"
						+ "<form action='authorarticle' method='POST' style='display:inline;'>"
						+"<input type='hidden' value="+data.RESPONE_DATA[i].id+" name='id'/>"
						+"<button type='submit' style='margin-right: 5px;' "
						+ "class='btn btn-success btn-sm'>"
						+ "Edit</button>"
						+"</form>"
						+ "<button type='button' style='margin-right: 5px;' "
						+ "class='btn btn-warning btn-sm' onclick=changeArticleStatus("+data.RESPONE_DATA[i].id+")>"
						+ "Change Status</button></td>"
						+ "</tr>";
			}
			tbl += "</tbody></table>";
			return tbl;
		}
		getArticleList(1);
		
		function deleteArticle(id){
			json={
					key:"D",
					id:id
					};
			$.ajax({
				type : "POST",
				url : "../api/author/authorworkarticle",
				dataType : 'json',
				data : json,
				success : function(data) {
					getRowNumber();
				},
				error : function(data) {
					alert("Unsuccess" + data.MESSAGE);
				}
			});
		}
		
		function changeArticleStatus(id){
			json={
					key:"CS",
					id:id
					};
			$.ajax({
				type : "POST",
				url : "../api/author/authorworkarticle",
				dataType : 'json',
				data : json,
				success : function(data) {
					getRowNumber();
				},
				error : function(data) {
					alert("Unsuccess" + data.MESSAGE);
				}
			});
		}
		function getArticleDetail(id){
			json={
					key:"TC",
					id:id
					};
			$.ajax({
				type : "POST",
				url : "../api/author/authorworkarticle",
				dataType : 'json',
				data : json,
				success : function(data) {
					$("#title").html(
							"<h2 style='text-align:center; background: rgb(63,72,204); color:white; border-radius:10px; padding:7px; font-family: 'Book Antiqua';>"
									+ data.RESPONE_DATA.title
									+ "</h2>");
					$("#content")
							.html(
									"<img src="+data.RESPONE_DATA.image+" "+
					"width='200px' heigth='250px' style='float:left; margin: 7px;'/><p>"
											+ data.RESPONE_DATA.content
											+ "</p>");
					$("#postdate").html(
							"<b>Post Date:"
									+ data.RESPONE_DATA.pdate
									+ "</b>");
				},
				error : function(data) {
					alert("Unsuccess" + data.MESSAGE);
				}
			});
		}
	</script>
</body>
</html>

























