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
		url : domainname +  "api/author/authorworkarticle",
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
	var tbl = "<table class='table table-striped table-condensed table-hover' style='margin-top: 20px;'>"
			+ "<thead>"
			+ "<tr class=btn-primary>"
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
				+ "<form action='"+ domainname +"author/add' method='POST' style='display:inline;'>"
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