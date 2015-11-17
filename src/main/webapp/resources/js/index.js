$(document).ready(function() {
    // updatestudent.act
    // deletestudent.act
    $('.selectpicker').selectpicker({ 
        'selectedText': '',
        style:'btn-default btn-lg',
        width:'auto'
    });
    $('#btnClear').click(function(){
        studentObject.clearForm();
        $("#showSuccessAdd").hide(400);
        $("#showErrorAdd").hide(400);
    });
    $('#deleteStudent').click(function(){
        alert('a');

    });    
    $('#btnAdd').click(function(){
        if( studentObject.id() ==  "" || 
            studentObject.name() ==  "" ||
            studentObject.university() ==  "" ||
            studentObject.stu_class() ==  ""){
                $("#showErrorAdd").show(400);
                $("#showSuccessAdd").hide(400);
                return;
        } else{
            $.ajax({
                url: "insertstudent.act", 
                method : "POST",
                data : {
                    stu_id:         studentObject.id(),
                    stu_gender:     studentObject.gender(),
                    stu_status:     studentObject.status(),
                    stu_name:       studentObject.name(),
                    stu_university: studentObject.university(),
                    stu_class:      studentObject.stu_class()
                },
                success: function(){
                    $("#showErrorAdd").hide(400);
                    $("#showSuccessAdd").show(400);
                    setIncreaseId(studentObject.id()); 
                    studentObject.clearForm();
                },
                error: function(){
                    alert("error connecting server");
                }
            });
        }
    });
    $('#inputSearchName').on('input', function(){
        $.ajax({
            url: "searchstudents.act", 
            method : "POST",
            data : {
                stu_name: searchObject.name(),
                stu_class: searchObject.class(),
                stu_status: searchObject.status()
            },
            success: function(json){
                $("tbody").empty();
                if(json.length > 0) {
                    $("tbody").append(listResult(json));
                    return;
                }
                showErrorSearch();
            },
            error: function(){
                alert("error connecting server");
            }
        });
	});

    function listResult(json){
        var str;
        for(var i=0; i<json.length; i++){
            var status = json[i].stu_status == 1 ? 
                "<button  class='btn btn-success btn-sm' >" +
                    "<i class='fa fa-check'></i>&nbsp;&nbsp;Active" +
                "</button>"
                :
                "<button  class='btn btn-warning btn-sm' >" +
                    "<i class='fa fa-times'></i>&nbsp;&nbsp;Inactive" +
                "</button>";
            var gender = json[i].stu_gender == 1 ? "Male" : "Female";
            str += 
                "<tr>" +
                  "<td>" + json[i].stu_id + "</td>" + 
                  "<td>" + json[i].stu_name + "</td>" + 
                  "<td>" + gender + "</td>" +                   
                  "<td>" + json[i].stu_university + "</td>" +  
                  "<td>" + json[i].stu_class + "</td>" +  
                  "<td>" + status + "</td>" + 
                  "<td>" + 
                    "<button  class='btn btn-danger btn-sm' id='btnDelete' onclick='deleteStudent(this)'><i class='fa fa-trash'></i>&nbsp;&nbsp;Delete</button> " +
                  "</td>" + 
                "</tr>";
        }      
        return str;  
    }
    function showErrorSearch(){
        $("tbody").append(
            "<tr>" +
                "<td class='alert alert-danger'  colspan=7 style='padding:80px!important'>" +
                    "<center>" +
                      "<strong>Not Found!</strong> Please Search Again!" +
                    "</center>" +
                "</td>" +
            "</tr>"                    
        );
    }
	var searchObject = {
        name: function(){	return $("#inputSearchName").val();   },
        class: function(){
        	var getClassVal = $("#selectSearchTypeClass").val();
        	return getClassVal == "All Class" ? "" : getClassVal;
        },
        status: function(){
        	var getStatusVal = $("#selectSearchTypeStatus").val();
        	if(getStatusVal == "Active")			getStatusVal = 1;
        	else if (getStatusVal == "Inactive")	getStatusVal = 0;
        	else									getStatusVal = -1;
        	return getStatusVal;
        }
	};
    var studentObject = {
        id: function(){   return $("#inputId").val();   },
        name: function(){   return $("#inputName").val();   },
        university: function(){   return $("#inputUniversity").val();   },
        stu_class: function(){   return $("#inputClass").val();   },        
        gender: function(){   return $("#inputGenderMale").is(':checked') == true ? 1 : 0;     },
        status: function(){   return $("#inputStatusActive").is(':checked') == true ? 1 : 0;    },
        clearForm: function(){
            $("#inputName").val(""); 
            $("#inputClass").val("");
            $("#inputUniversity").val("");
        }
    }
    function setLastId(){
        if($("#inputId").val() == ""){
            $.post("getlastid.act", 
                function(data,s){
                    setIncreaseId(data);
                }
            );
        }
    } 
    function setIncreaseId(data){
        var id = parseInt(data.substring(4, data.length)) + 1;
        $("#inputId").val("131N" + id);   
    }    
    setLastId();   
});

function deleteStudent(btn){
     $.ajax({
        url: "deletestudent.act", 
        method : "POST",
        data : {
            stu_id:     btn.parentNode.parentNode.childNodes[0].textContent
        }
    });
     btn.parentNode.parentNode.remove();
 }