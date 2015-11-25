		getRowNumber();
		function getRowNumber() {
			$.ajax({
		           type: "POST",
		           url: "getnumberrow", 
		           dataType: 'json',
		           data :{rowname : $("#searchby").val(),
						  search : $("#search").val()},
		           success: function(data){ 
		        	   setNumerRow(data.RESPONE_DATA);
		           } ,
		           error:function(data){
		        	   $("#display").html("<h1 style='padding:10px; color:red; text-align:center; background:rgb(63,72,204);'>Artical Not Found..!</h1>");
		        	   $(".demo3").html("");
		           }
		       });
		}
		function setNumerRow(numr) {
			var page = 0;
			var displayrow = $("#numberrow").val();
			if (numr % displayrow != 0) {
				page = numr / displayrow + 1;
			} else {
				page = num / rdisplayrow;
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
				getAllList(num);
			});
			getAllList(1);
		}

		function getList(data) {
			var tbl = "<table class='table table-striped table-condensed table-hover' style='margin-top: 10px;'>"
					+ "<thead>"
					+ "<tr class=btn-primary>"
					+ "<th>ID</th>"
					+ "<th>Title</th>"
					+ "<th>Author</th>"
					+ "<th>Publish Date</th>"
					+ "<th>Action</th>" + "</tr>" + "</thead><tbody>";
			for ( var i = 0; i < data.RESPONE_DATA.length; i++) {
				tbl += "<tr>"
						+ "<td>"
						+ data.RESPONE_DATA[i].id
						+ "</td>"
						+ "<td>"
						+ data.RESPONE_DATA[i].title
						+ "</td>"
						+ "<td>"
						+ data.RESPONE_DATA[i].name
						+ "</td>"
						+ "<td>"
						+ data.RESPONE_DATA[i].pdate
						+ "</td>"
						+ "<td><button type='button' data-toggle='modal' data-target='#myModal' class='btn btn-primary btn-sm' onclick=getArticleDetail("
						+ data.RESPONE_DATA[i].id + ") >"
						+ "<i class='fa fa-eye'></i></span></button></td>"
						+ "</tr>";
			}
			tbl += "</tbody></table>";
			return tbl;
		}
		function getAllList(page) {
			var displayrow = $("#numberrow").val();
			$.post("getarticlesearch", {
				rowname : $("#searchby").val(),
				search : $("#search").val(),
				page : page,
				numberrow : displayrow
			}, function(data) {
				$("#display").html(getList(data));
			});
		}
		getAllList(1);
		function getArticleDetail(id) {
			$
					.post(
							"articleviewdetial",
							{
								id : id
							},
							function(data) {
								$("#title").html(
										"<h2 style='text-align:center; background: rgb(63,72,204); color:white; border-radius:10px; padding:7px; font-family: 'Book Antiqua';>"
												+ data.RESPONE_DATA.title
												+ "</h2>");
								$("#content")
										.html(
												"<img src='${pageContext.request.contextPath}/resources/upload/profile/ "+ data.RESPONE_DATA.image + "'" +
								"width='200px' heigth='250px' style='float:left; margin: 7px;'/><p>"
														+ data.RESPONE_DATA.content
														+ "</p>");
								$("#poster").html(
										"<b>Post By:"
												+ data.RESPONE_DATA.name
												+ "</b>");
								$("#postdate").html(
										"<b>Post Date:"
												+ data.RESPONE_DATA.pdate
												+ "</b>");
							});
		}