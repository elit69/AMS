		function addUser(){
			//alert("add user");
			json = {
					name : $("#name").val(),
					gender : $('input:radio[name=gender]:checked').val(),
					email : $("#email").val(),
					username : $("#username").val(),
					password : $("#password").val(),
					address : $("#address").val(),
					phone : $("#phone").val(),
					//enable : $('input:radio[name=enable]:checked').val(),
					image : $("#image").val().split("\\").pop(), //"default.jpg" 
					role_id: $('select[name="role_id"] option:selected').val()
				};
				//alert($('select[name="role_id"] option:selected').val());
				$.ajax({
					type : "POST",
					url : domainname + "api/admin/user/",
					data : JSON.stringify(json),
					contentType: 'application/json',
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
		
		function uploadImage() {
			alert("upload image");
			var data1;
			data1 = new FormData();
			data1.append('file', $('#image')[0].files[0]);
			$.ajax({
				url : domainname + "api/admin/user/uploadimage",
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
				