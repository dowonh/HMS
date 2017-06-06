$(function(){
	
	var eid = $("body").attr("id");
	
	$.ajax({
		url: "../services/room/all",
		type: "GET",
		success: function(data){
			if(data.length!=0) $("#roomBody .dataTables_empty").remove();
			data.forEach(function(room){
				var index = $("#tblRooms").dataTable().fnAddData([
				                                                  room.room_number,
				                                                  room.totalbeds,
				                                                  room.availablebeds,
				                                                  (parseInt(room.totalbeds) - parseInt(room.availablebeds)),
				                                                  "<a onClick=showRoom("+room.rid+")>SHOW</a>"
				                                                  ]);
				var row = $("#tblRooms").dataTable().fnGetNodes(index);
				$(row).attr("id",room.rid);
				
			});
		},
		error: function(data){
			$(".roomMsg").removeClass("alert-success")
			$(".roomMsg").addClass("alert-danger").html("<strong>Error: </strong> "+data.responseText);
		}
	});
	
	$.ajax({
		url: "../services/medicine/all",
		type: "GET",
		success: function(data){
			if(data.length!=0) $("#medicineBody .dataTables_empty").remove();
			data.forEach(function(med){
				var index = $("#tblmedicine").dataTable().fnAddData([
					med.id,
					med.name,
					med.price,
					med.count                                       
				]);
				var row = $("#tblmedicine").dataTable().fnGetNodes(index);
				$(row).attr("id",med.id);
				
			});
		},
		error: function(data){
			$(".medicineMsg").removeClass("alert-success")
			$(".medicineMsg").addClass("alert-danger").html("<strong>Error: </strong> "+data.responseText);
		}
	});
	
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
	
	/*
	
	$.ajax({
		url: "../services/patient/nurse/"+uid,
		type: "GET",
		success: function(data){
			if(data.length!=0) $("#patientBody .dataTables_empty").remove();
			data.forEach(function(indoor){
				
				var index = $("#tblPatients").dataTable().fnAddData([
				                                                     indoor.patient.name,
				                                                     indoor.patient.dob,
				                                                     indoor.patient.gender,
				                                                     indoor.disease,
				                                                     indoor.patient.doctor.employee.firstname+" "+indoor.patient.doctor.employee.lastname
				                                                     ]);
				
				var row = $("#tblPatients").dataTable().fnGetNodes(index);
				$(row).attr("id",indoor.pid);
				
			});
		},
		error: function(data){
			$(".roomMsg").removeClass("alert-success")
			$(".roomMsg").addClass("alert-danger").html("<strong>Error: </strong> "+data.responseText);
		}
	});
	*/
	

 
//	//Room Assignment
//	$("#assignRoomForm").submit(function(e){
//		e.preventDefault();
//		
//		$.ajax({
//			url: $(this).attr("action"),
//			data: $(this).serialize(),
//			type: "PUT",
//			success: function(indoor){
//				BootstrapDialog.show({
//					title: "Success!",
//					message: "room assigned successfully!"
//				});
//				
//				//$("#indoorBody #"+indoor.pid).addClass("deleteMe");
//				$("#displayIndoors").DataTable().row($("#indoorBody #"+indoor.pid)).remove().draw();
//				
//				
//				console.log(indoor);
//				addIndoorToTable(indoor);
//			},
//			error: function(data){
//				BootstrapDialog.show({
//					type: BootstrapDialog.TYPE_DANGER,
//					title: "Error!",
//					message: data.responseText
//				});
//			}
//				
//		});
//		
//		$("#assignRoomModal").modal("toggle");
//	});
//	
//	
//	$.ajax({
//		url: "../services/nurse/all",
//		type: "GET",
//		success: function(nurses){
//			nurses.forEach(function(nurse){
//				$("#roomForm select[name=nurseId]").append("<option value='"+nurse.nid+"' >"+nurse.employee.firstname+" "+nurse.employee.lastname+"</option>");
//				$("#updateRoomForm select[name=nurseId]").append("<option value='"+nurse.nid+"' >"+nurse.employee.firstname+" "+nurse.employee.lastname+"</option>");
//			});
//		},
//		error: function(data){
//			
//		}
//	});

//	

	$("table").dataTable();
})

function showRoom(rid){
	$("#showRoomModal").modal("toggle");
	
	var table = $('#showRooms').DataTable();

	if ( table.data().count() != 0) {
		table.clear().draw();
	}

	//alert($("#showRooms").dataTable().data().count() );
	//if ($("#showRooms").dataTable().row().indexes() == 0)
	//$("#showRooms").dataTable().clear().draw();
	//For Indoors
	$.ajax({
		url: "../services/indoor/"+rid,
		type: "GET",
		success: function(data){
			
			data.forEach(function(indoor){
				addIndoorToTable(indoor);
			});
		},
		error: function(data){
			
		}
	});
 	
}
function addIndoorToTable(indoor){
 
//	
//	if(indoor.room) nurseName  = indoor.room.nurse.employee.firstname;

	var index = $("#showRooms").dataTable().fnAddData([
					                                   indoor.name,
					                                   indoor.gender,
					                                   indoor.birth,
					                                   indoor.door_start_day,
						                               indoor.employee.name,
						                             ]);
	
	var row = $("#showRooms").dataTable().fnGetNodes(index);
	$(row).attr("id",indoor.room_rid);
	//$(".deleteMe").remove();
}
function assignRoom(ipid){
	$("#assignRoomModal").modal("toggle");
	$("#assignRoomForm").attr("action","../services/indoor/"+ipid+"/room");
	
	
	//size setting
	$("#assignRoomModal .modal-body").css("height","100px");
	$("#assignRoomModal .modal-content").css("width","300px");
	
}



