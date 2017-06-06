$(document).ready(function(){
	
	$(".dob").datepicker(
			{
				dateFormat: 'yy-mm-dd',
				changeMonth: true,
				changeYear: true,
				yearRange: "1960:2015"
			});
	
	//adding categories
	$.ajax({
		url: "services/category/all",
		type: "GET",
		success: function(categories){
			categories.forEach(function(category){
				$("#signupform select[name=catid]").append("<option value="+category.catid+">"+category.name+"</option>");
			});
		}
	});
	
	$("#signupform").submit(function(e){
		$.ajax({
			type: $(this).attr("method"),
			url: $(this).attr("action"),
			data: $(this).serialize(),
			success: function(data){
				BootstrapDialog.show({
					title: "Success",
					message: "Patient has been registered successfully."
				});
			},
			error: function(xml,status,errorThrown){
				BootstrapDialog.show({
					title: "Error",
					message: xml.responseText
				});
			}
			
		});
		
		$("#signup-modal").modal("toggle"); //this line is awesome!!
		
		e.preventDefault();
	});
	
	 
	//---------------------------------
	// 의사 관련
	//---------------------------------
	$("#docForm").submit(function(e){
		if($("#docForm .dob").val() == ''){
			alert('Date of birth cannot be empty');
			return;
		}
		
		$.ajax({
			type: $(this).attr("method"),
			url: $(this).attr("action"),
			data: $(this).serialize(),
			success: function(doctor){
				
				addDocToTable(doctor);
				$(".docMsg").addClass("alert-success").html("<strong>Success</strong>: Record Added!");
			},
			error: function(xml,status,errorThrown){
				$(".docMsg").addClass("alert-danger").html("<strong>Error</strong>: "+xml.responseText);
			}
			
		});
		
		$("#addDocModal").modal("toggle"); //this line is awesome!!
		
		return false;
		
	});
	
	$("#docUpdateForm").submit(function(e){
		e.preventDefault();
		
		if($("#docUpdateForm .dob").val() == ''){
			alert('Date of birth cannot be empty');
			return;
		}

		$.ajax({ 
			type: $(this).attr("method"),
			url: $(this).attr("action"),
			data: $(this).serialize(),
			success: function(doctor){
				$(".docMsg").removeClass("alert-danger");
				$(".docMsg").addClass("alert-success").html("<strong>Success</strong>: Record Updation Success!");
				$("#displayDoctors").DataTable().row($("#docBody #"+doctor.eid)).remove().draw();
				addDocToTable(doctor);
			},
			error: function(xml,status,errorThrown){
				alert("error");
				$(".docMsg").addClass("alert-danger").html("<strong>Error</strong>: "+xml.responseText);
			}
			
		});
		
		$("#editDocModal").modal("toggle"); //this line is awesome!!
		
	});
	
	//---------------------------------
	// 간호사 관련
	//---------------------------------
	$("#nurseForm").submit(function(e){
		e.preventDefault();

		if($("#nurseForm .dob").val() == ''){
			alert('Date of birth cannot be empty');
			return;
		}
		
		$.ajax({
			type: $(this).attr("method"),
			url: $(this).attr("action"),
			data: $(this).serialize(),
			success: function(nurse){
				console.log(nurse);
				addNurseToTable(nurse);
				$(".nurseMsg").addClass("alert-success").html("<strong>Success</strong>: Record Added!");
			},
			error: function(xml,status,errorThrown){
				$(".nurseMsg").addClass("alert-danger").html("<strong>Error</strong>: "+xml.responseText);
			}
			
		});
		$("#addNurseModal").modal("toggle"); //this line is awesome!!
		
	});
	
	$("#nurseUpdateForm").submit(function(e){
		e.preventDefault();

		if($("#nurseUpdateForm .dob").val() == ''){
			alert('Date of birth cannot be empty');
			return;
		}
		
		$.ajax({
			type: $(this).attr("method"),
			url: $(this).attr("action"),
			data: $(this).serialize(),
			success: function(nurse){
				console.log(nurse);
				$(".nurseMsg").removeClass("alert-danger").addClass("alert-success").html("<strong>Success</strong>: Record Added!");
				$("#displayNurses").DataTable().row($("#nurseBody #"+nurse.eid)).remove().draw();
				addNurseToTable(nurse);
			},
			error: function(xml,status,errorThrown){
				$(".nurseMsg").addClass("alert-danger").html("<strong>Error</strong>: "+xml.responseText);
			}
		});
		$("#editNurseModal").modal("toggle"); //this line is awesome!!
		
	});
	
	$(".dob").datepicker({
		dateFormat: 'yy-mm-dd',
		changeMonth: true,
		changeYear: true,
		yearRange: "1960:2015"
	});


	//---------------------------------
	// 방관련
	//---------------------------------
	$("#roomForm").submit(function(e){
		e.preventDefault();
		
		$.ajax({
			type: $(this).attr("method"),
			url: $(this).attr("action"),
			data: $(this).serialize(),
			success: function(data){
				addRoomToTable(data);
				$(".roomMsg").removeClass("alert-danger");
				$(".roomMsg").addClass("alert-success").html("<strong>Success</strong>: Record Added!");
			},
			error: function(xml,status,errorThrown){
				$(".roomMsg").removeClass("alert-success");
				$(".roomMsg").addClass("alert-danger").html("<strong>Error</strong>: "+xml.responseText);
			}
			
		});
			
		$("#addRoomModal").modal("toggle"); //this line is awesome!!
		
	});
	
	$("#updateRoomForm").submit(function(e){
		e.preventDefault();
		
		$.ajax({
			type: $(this).attr("method"),
			url: $(this).attr("action"),
			data: $(this).serialize(),
			success: function(room){
				$(".roomMsg").removeClass("alert-danger");
				$(".roomMsg").addClass("alert-success").html("<strong>Success</strong>: Record Updation Success!");

				$("#displayRooms").DataTable().row($("#roomBody #"+room.rid)).remove().draw();
				addRoomToTable(room);
			},
			error: function(xml,status,errorThrown){
				$(".roomMsg").removeClass("alert-success");
				$(".roomMsg").addClass("alert-danger").html("<strong>Error</strong>: "+xml.responseText);
			}
			
		});
		
		$("#editRoomModal").modal("toggle"); //this line is awesome!!
	});
});

function addDocToTable(doctor){

	var index = $("#displayDoctors").dataTable().fnAddData([
										doctor.username,
									    doctor.passwd,
									    doctor.name,
									    doctor.gender,
									    doctor.birth,
									    doctor.phone,
									    doctor.salary,
									    doctor.category.name,
									    "<a onClick='empDelete("+doctor.eid+",1)' href='#'  >Delete</a> / <a href='#' onclick='editDoc("+doctor.eid+")'>Edit</a>"
					                 ]);
	var row = $("#displayDoctors").dataTable().fnGetNodes(index);
	$(row).attr("id",doctor.eid);
}

function editDoc(eid){
	$.ajax({
		type: "GET",
		url: "../Process?action=getDoc&id="+eid,
		//contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data){ 
			editDocForm(eid, data);
		},
		error: function(err){
			console.log("editDoc errer" + err);
		}
	});
}

function editDocForm(eid,docObj){

	$("#editDocModal form").attr("action","../Process?action=editDoc&id="+eid);
	
	$("#editDocModal form input[name=name]").val(docObj.name);
	$("#editDocModal form input[name=username]").val(docObj.username);
	$("#editDocModal form input[name=password]").val(docObj.password);
	$("#editDocModal form select[name=catid]").val(docObj.catid);
	$("#editDocModal form input[name=birth]").val(docObj.birth);
	$("#editDocModal form input[name=salary]").val(docObj.salary);
	$("#editDocModal form input[name=phone]").val(docObj.phone);
	if(docObj.gender=="male")
		$("#editDocModal form input[value=male]").prop("checked", true);
	else
		$("#editDocModal form input[value=female]").prop("checked",true);
	
	$("#editDocModal").modal("toggle");
}

function empDelete(id,type){
	bootbox.confirm("Are you sure?",function(sure){
		if(sure)
			empDeleteConfirm(id,type);
	}).find(".modal-body").css({"height": "50px"})
}

function empDeleteConfirm(id,type){
	$.ajax({
		type: "GET",
		url: "../Process?action=deleteEmp&id="+id,
		success: function(){
			if(type==1) $(".docMsg").addClass("alert-success").html("<strong>Success</strong>: Record Deleted Success!");
			else if(type==2) $(".nurseMsg").addClass("alert-success").html("<strong>Success</strong>: Record Deleted Success!");
			
			//$("#docBody #"+id).remove();
			$("#displayDoctors").DataTable().row($("#docBody #"+id)).remove().draw();
			//$("#nurseBody #"+id).remove();
			$("#displayNurses").DataTable().row($("#nurseBody #"+id)).remove().draw();
		},
		error: function(xml){
			$(".docMsg").addClass("alert-danger").html("<strong>Error</strong>: "+xml.responseText);
		}
	});
}
/////////////////////////////////////
//간호사 관련부분
//////////////////////////////////////
function addNurseToTable(nurse){ 
	var index = $("#displayNurses").dataTable().fnAddData([
					                                          nurse.username,
					                                          nurse.passwd,
					                                          nurse.name,
					                                          nurse.gender,
					                                          nurse.birth,
					                                          nurse.phone,
					                                          nurse.salary,
					                                          "<a onClick='empDelete("+nurse.eid+",1)' href='#'  >Delete</a> / <a href='#' onclick='editNurse("+nurse.eid+")'>Edit</a>"				                                          ]);
	
	var row = $("#displayNurses").dataTable().fnGetNodes(index);
	$(row).attr("id",nurse.eid);
	//$(".deleteMe").remove();
}
function editNurse(nid){
	$.ajax({
		type: "GET",
		url: "../Process?action=getNurse&id="+nid,
		success: function(nurse){
			editNurseForm(nid,nurse);
		},
		error: function(data){
			console.log("Error");
		}
	});
}

function editNurseForm(nid,nurse){
	$("#editNurseModal form").attr("action","../Process?action=editNurse&id="+nid);

	$("#editNurseModal form input[name=name]").val(nurse.name);
	$("#editNurseModal form input[name=username]").val(nurse.username);
	$("#editNurseModal form input[name=password]").val(nurse.password);
	$("#editNurseModal form input[name=birth]").val(nurse.birth);
	$("#editNurseModal form input[name=salary]").val(nurse.salary);
	$("#editNurseModal form input[name=phone]").val(nurse.phone);
	if(nurse.gender=="male")
		$("#editNurseModal form input[value=male]").prop("checked", true);
	else
		$("#editNurseModal form input[value=female]").prop("checked",true);
	
	$("#editNurseModal").modal("toggle");
}
/////////////////////////////////////
//환자관련
//////////////////////////////////////
//function  patientDelete(pid){
//	bootbox.confirm("Are you sure?",function(sure){
//		if(sure)
//			patientDeleteConfirm(pid);
//	}).find(".modal-body").css({"height": "50px"})
//}
//
//
//function patientDeleteConfirm(pid){
//	$.ajax({
//		type: "GET",
//		url: "../Process?action=deletePatient&id="+pid,
//		success: function(){
//			$(".patientMsg").addClass("alert-success").html("<strong>Success</strong>: Record Deleted Success!");
//			//$("#patientBody #"+pid).remove();
//			$("#displayPatients").DataTable().row($("#patientBody #"+pid)).remove().draw();
//			//$("#indoorBody #"+pid).remove();
//			$("#displayIndoors").DataTable().row($("#indoorBody #"+pid)).remove().draw();
//		},
//		error: function(xml){
//			$(".patientMsg").addClass("alert-danger").html("<strong>Error</strong>: "+xml.responseText);
//		}
//	});
//}


/////////////////////////////////////
// 방 관련부분
//////////////////////////////////////
function addRoomToTable(room){
	var index = $("#displayRooms").dataTable().fnAddData([
				                                          room.room_number,
				                                          room.totalbeds,
				                                          room.availablebeds,
				                                          "<a onClick='roomDelete("+room.rid+")' href='#'  >Delete</a> / <a href='#' onclick='editRoom("+room.rid+")'>Edit</a>"
				                                          ]);
	
	var row = $("#displayRooms").dataTable().fnGetNodes(index);
	$(row).attr("id",room.rid);
	//$(".deleteMe").remove();
}

function editRoom(rid){
	$.ajax({
		type: "GET",
		url: "../Process?action=getRoom&id="+rid,
		success: function(room){
			editRoomForm(rid,room);
		},
		error: function(data){
			console.log("Error");
		}
	});
}

function editRoomForm(rid,room){
	
	$("#editRoomModal form").attr("action","../Process?action=editRoom&id="+rid);
	
	$("#editRoomModal form input[name=totalbeds]").val(room.totalbeds);

	$("#editRoomModal").modal("toggle");
}

function  roomDelete(rid){
	bootbox.confirm("Are you sure?",function(sure){
		if(sure)
			roomDeleteConfirm(rid);
	}).find(".modal-body").css({"height": "50px"})
}

function roomDeleteConfirm(rid){
	
	$.ajax({
		type: "GET",
		url: "../Process?action=deleteRoom&id="+rid,
		success: function(){
			$(".roomMsg").addClass("alert-success").html("<strong>Success</strong>: Record Deleted Success!");
			//$("#roomBody #"+rid).remove();
			$("#displayRooms").DataTable().row($("#roomBody #"+rid)).remove().draw();
		},
		error: function(xml){
			$(".roomMsg").addClass("alert-danger").html("<strong>Error</strong>: "+xml.responseText);
		}
	});
}
/////////////////////////////////////
//카테고리 관련 부분
//////////////////////////////////////
function addCategoryToTable(category){
	var index = $("#tblCategories").dataTable().fnAddData([
	                                                       category.catid,
	                                                       category.name,
	                                                       "<a href='#' onclick='updateCategory("+category.catid+")'>Update</a> / <a href='#' onclick='deleteCategory("+category.catid+")'>Delete</a> "
	                                                       ]);
	var row = $("#tblCategories").dataTable().fnGetNodes(index);
	$(row).attr("id",category.catid);
}

function updateCategory(catid){
	
	$("#updateCategoryForm").attr("action","../services/category/"+catid);
	
	$.ajax({
		url: "../services/category/"+catid,
		type: "PUT",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success: function(category){
			$("#updateCategoryForm input[name=catName]").val(category.name);
		},
		error: function(err){
			console.log(err.responseText);
		}
	})
	
	$("#updateCategoryModal").modal("toggle");
}


function deleteCategory(catid){
	bootbox.confirm("Are you sure?",function(sure){
		if(sure){
			$.ajax({
				url: "../services/category/"+catid,
				type: "DELETE",
				success: function(result){
					BootstrapDialog.show({
						title: "Success!",
						message: "Category deleted successfully!"
					});
					
					$("#tblCategories").DataTable().row($("#catBody #"+catid)).remove().draw();
				},
				error: function(data){
					BootstrapDialog.show({
						type: BootstrapDialog.TYPE_DANGER,
						title: "Error!",
						message: data.responseText,
					});
				}
			});
		}
	}).find(".modal-body").css("height","50px");
}