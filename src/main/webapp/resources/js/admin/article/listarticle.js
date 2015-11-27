function getRowNumber() {
	json = {
		key : "GR",
		userid : $("#userid").val(),
		columnName : $("#searchby").val(),
		search : $("#search").val()
	};
	$.ajax({
		type : "POST",
		url : domainname +  "api/author/authorworkarticle",
		dataType : 'json',
		data : json,
		success : function(data) {
			setNumerRow(data.RESPONSE_DATA);
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
		type : "GET",
		url : domainname +  "api/admin/article/list/"+json.limitRow+"/"+json.page,
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
	var tbl = "<table class='table table-striped table-condensed table-hover' style='margin-top: 10px;'>"
		+ "<thead>"
		+ "<tr class=btn-primary>"
		+ "<th>ID</th>"
		+ "<th>Title</th>"
		+ "<th>Author</th>"
		+ "<th>Publish Date</th>"
		+ "<th>Status</th>"
		+ "<th style='text-align:center'>Action</th>" + "</tr>" 
		+ "</thead><tbody>";
	for ( var i = 0; i < data.RESPONSE_DATA.length; i++) {
		tbl += "<tr>"
				+ "<td>"
				+ data.RESPONSE_DATA[i].id
				+ "</td>"
				+ "<td>"
				+ data.RESPONSE_DATA[i].title
				+ "</td>"
				+ "<td>"
				+ data.RESPONSE_DATA[i].name
				+ "</td>"
				+ "<td>"
				+ data.RESPONSE_DATA[i].pdate
				+ "</td >";
				if(data.RESPONSE_DATA[i].enable){
					tbl+="<td ><span class='label label-success'>Enable</span></td>";
				}else{
					tbl+="<td ><span class='label label-danger'>Disable</span></td>";
				}
				tbl+= "<td style='text-align:center;'><button type='button' data-toggle='modal' data-target='#myModal' style='margin-right: 5px;'"
				+ "class='btn btn-primary btn-sm' onclick=getArticleDetail("
				+ data.RESPONSE_DATA[i].id
				+ ") >"
				+ "View Detail</button>"
				+ "<button type='button' style='margin-right: 5px;' "
				+ "class='btn btn-danger btn-sm' onclick=deleteArticle("+data.RESPONSE_DATA[i].id+")>"
				+ "Delete</button>"
				+ "<form action='"+ domainname +"author/add' method='POST' style='display:inline;'>"
				+"<input type='hidden' value="+data.RESPONSE_DATA[i].id+" name='id'/>"
				+"<button type='submit' style='margin-right: 5px;' "
				+ "class='btn btn-success btn-sm'>"
				+ "Edit</button>"
				+"</form>"
				+ "<button type='button' style='margin-right: 5px;' "
				+ "class='btn btn-warning btn-sm' onclick=changeArticleStatus("+data.RESPONSE_DATA[i].id+")>"
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
		url : domainname +  "api/author/authorworkarticle",
		dataType : 'json',
		data : json,
		success : function(data) {
			getRowNumber();
		},
		error : function(data) {
			alert("Unsuccess " + data.MESSAGE);
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
		url : domainname +  "api/author/authorworkarticle",
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
		url : domainname +  "api/author/authorworkarticle",
		dataType : 'json',
		data : json,
		success : function(data) {
			$("#title").html(
					"<h2 style='text-align:center; background: rgb(63,72,204); color:white; border-radius:10px; padding:7px; font-family: 'Book Antiqua';>"
							+ data.RESPONSE_DATA.title
							+ "</h2>");
			$("#content")
					.html(
							"<img src="+data.RESPONSE_DATA.image+" "+
			"width='200px' heigth='250px' style='float:left; margin: 7px;'/><p>"
									+ data.RESPONSE_DATA.content
									+ "</p>");
			$("#postdate").html(
					"<b>Post Date:"
							+ data.RESPONSE_DATA.pdate
							+ "</b>");
		},
		error : function(data) {
			alert("Unsuccess" + data.MESSAGE);
		}
	});
}