$(function(){
	
	//---------------------------
	// 어드민 의사부분
	//---------------------------
	$.ajax({
		url: "../services/category/all",
		type: "GET",
		success: function(categories){
			categories.forEach(function(cat){
				$("#docForm select[name=catid]").append("<option value='"+cat.catid+"' >"+cat.name+"</option>");
				$("#docUpdateForm select[name=catid]").append("<option value='"+cat.catid+"' >"+cat.name+"</option>");
			});
		}
	});

	$.ajax({
		url: "../services/doctor/all",
		type: "GET",
		success: function(data){
			data.forEach(function(doctor){
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
				
			});
		},
		error: function(data){
			
		}
	});
	
	$.ajax({
		url: "../services/nurse/all",
		type: "GET",
		success: function(data){
			data.forEach(function(nurse){
				var index = $("#displayNurses").dataTable().fnAddData([
					nurse.username,
					nurse.passwd,
					nurse.name,
					nurse.gender,
					nurse.birth,
					nurse.phone,
					nurse.salary,
					"<a onClick='empDelete("+nurse.eid+",1)' href='#'  >Delete</a> / <a href='#' onclick='editNurse("+nurse.eid+")'>Edit</a>"
								                                          ]);
				
				var row = $("#displayNurses").dataTable().fnGetNodes(index);
				$(row).attr("id",nurse.eid);
				
			});
		},
		error: function(data){
			
		}
	});
	//---------------------------
	// 어드민 방 정보 부분
	//---------------------------
	$.ajax({
		url: "../services/room/all",
		type: "GET",
		success: function(data){
			data.forEach(function(room){
				var index = $("#displayRooms").dataTable().fnAddData([
							                                          room.room_number,
							                                          room.totalbeds,
							                                          room.availablebeds,
							                                          "<a onClick='roomDelete("+room.rid+")' href='#'  >Delete</a> / <a href='#' onclick='editRoom("+room.rid+")'>Edit</a>"
							                                          ]);
				
				var row = $("#displayRooms").dataTable().fnGetNodes(index);
				$(row).attr("id",room.rid);
				
				$("#assignRoomForm select[name=rid]").append("<option value="+room.rid+">"+room.rid+"</option>");
			
			});
		},
		error: function(data){
			
		}
	});
	//---------------------------
	// 어드민 카테고리관련
	//---------------------------
	
	$.ajax({
		url: "../services/category/all",
		type: "GET",
		success: function(categories){
			categories.forEach(function(category){
				addCategoryToTable(category);
			});
		},
		error: function(error){
			console.log(error.responseText);
		}
	});
	
	//Add Category Form Submission
	$("#addCategoryForm").submit(function(e){
		e.preventDefault();
		
		$.ajax({
			url: $(this).attr("action"),
			type: $(this).attr("method"),
			data: $(this).serialize(),
			success: function(category){
				BootstrapDialog.show({
					title: "Success!",
					message: "category added successfully!"
				});
				
				addCategoryToTable(category);
			},
			error: function(err){
				BootstrapDialog.show({
					type: BootstrapDialog.TYPE_DANGER,
					title: "Error!",
					message: err.responseText
				});
			}
		});
		
		$("#addCategoryModal").modal("toggle");
	});
	
	//Update Category Form Submission
	$("#updateCategoryForm").submit(function(e){
		e.preventDefault();
		
		$.ajax({
			url: $(this).attr("action"),
			type: $(this).attr("method"),
			data: $(this).serialize(),
			success: function(category){
				BootstrapDialog.show({
					title: "Success!",
					message: "category updated successfully!"
				});
				
				$("#tblCategories").DataTable().row($("#catBody #"+category.catid)).remove().draw();
				addCategoryToTable(category);
			},
			error: function(err){
				BootstrapDialog.show({
					type: BootstrapDialog.TYPE_DANGER,
					title: "Error!",
					message: err.responseText
				});
			}
		});
		
		$("#updateCategoryModal").modal("toggle");
	});
	
	//---------------------------
	// 어드민 환자 관련 
	//---------------------------
	$.ajax({
		url: "../services/patient/all",
		type: "GET",
		success: function(data){
			console.log(data);
			data.forEach(function(patient){

				var index = $("#displayPatients").dataTable().fnAddData([
								                                          patient.name,
								                                          patient.birth,
								                                          patient.gender,
								                                          patient.phone,
								                                          patient.employee.name,
								                                          patient.reservation_day,
								                                          patient.reservation_time,
								                                          ]);
				var row = $("#displayPatients").dataTable().fnGetNodes(index);
				$(row).attr("id",patient.pid);
			});
		},
		error: function(data){
			
		}
	});
 
	$("table").dataTable();
})  

