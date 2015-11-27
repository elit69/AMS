function processUpload() {
	var oMyForm = new FormData();
	oMyForm.append('file', $('#artimg')[0].files[0]);
	$.ajax({
		dataType : 'json',
		url : domainname + "api/author/uploadfile",
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
		image : domainname +  "resources/upload/images/"+$("#artimg").val().replace(/^.*[\\\/]/, ''),
		content : $("#content").val(),
		userid : $("#userid").val(),
		enable : true
	};
	$.ajax({
		type : "POST",
		url : domainname +  "api/author/authorworkarticle",
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
		url : domainname +  "api/author/authorworkarticle",
		dataType : 'json',
		data : json,
		success : function(data) {
			$("h3").html("Edit Article");
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
		img = domainname +  "resources/upload/images/"+$("#artimg").val().replace(/^.*[\\\/]/, '');
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
		url : domainname +  "api/author/authorworkarticle",
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
