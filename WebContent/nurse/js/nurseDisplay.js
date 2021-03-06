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
			data.forEach(function(patient){

				var index = $("#displayPatients").dataTable().fnAddData([
								                                          patient.name,
								                                          patient.birth,
								                                          patient.gender,
								                                          patient.phone,
								                                          patient.employee.name,
								                                          patient.reservation_day,
								                                          patient.reservation_time,
								                                          patient.door,
								                                          patient.door_start_day,
								                                          "<a onClick='assignRoom("+patient.pid+","+patient.rid+")' href='#'>입원하기</a>",
								                                          "<a onClick='outRoom("+patient.pid+","+patient.rid+")' href='#'>퇴원하기</a>"
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
	

 
 	//Room Assignment
	$("#assignRoomForm").submit(function(e){
		e.preventDefault(); 
		$.ajax({
			url: $(this).attr("action"),
			data: $(this).serialize(),
			type: "PUT",
			success: function(patient){
				BootstrapDialog.show({
					title: "Success!",
					message: "room assigned successfully!"
				}); 
				//$("#indoorBody #"+indoor.pid).addClass("deleteMe");
				$("#displayPatients").DataTable().row($("#patientBody #"+patient.pid)).remove().draw();

				addPatientToTable(patient);
			},
			error: function(data){
				BootstrapDialog.show({
					type: BootstrapDialog.TYPE_DANGER,
					title: "Error!",
					message: data.responseText
				});
			}
				
		});
		
		$("#assignRoomModal").modal("toggle");
	});
 
	$.ajax({
		url: "../services/room/remainAll",
		type: "GET",
		success: function(rooms){
			rooms.forEach(function(rooms){
				$("#assignRoomForm select[name=rid]").append("<option value='"+rooms.rid+"' >"+rooms.room_number+"</option>");
			});
		},
		error: function(data){
			
		}
	});

 
	$("table").dataTable();
})
function addPatientToTable(patient){
 
	var index = $("#displayPatients").dataTable().fnAddData([
        patient.name,
        patient.birth,
        patient.gender,
        patient.phone,
        patient.employee.name,
        patient.reservation_day,
        patient.reservation_time,
        patient.door,
        patient.door_start_day,
        "<a onClick='assignRoom("+patient.pid+","+patient.rid+")' href='#'>입원하기</a>",
        "<a onClick='outRoom("+patient.pid+","+patient.rid+")' href='#'>퇴원하기</a>"
        ]);
	var row = $("#displayPatients").dataTable().fnGetNodes(index);
	$(row).attr("id",patient.pid);
}

function showRoom(rid){
	$("#showRoomModal").modal("toggle");
	
	var table = $('#showRooms').DataTable();

	if ( table.data().count() != 0) {
		table.clear().draw();
	}
 
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

function assignRoom(pid, rid){
	if ( rid == 0 ){
		$("#assignRoomModal").modal("toggle");
		$("#assignRoomForm").attr("action","../services/indoor/"+pid);
		
		//size setting
		$("#assignRoomModal .modal-body").css("height","100px");
		$("#assignRoomModal .modal-content").css("width","300px");
	}else{
		alert("입원한 환자입니다.");
	}
}


function outRoom(pid, rid){
	if(rid != 0){
		bootbox.confirm("Are you sure?",function(sure){
			if(sure)
				petientsOutRoomConfirm(pid, rid);
		}).find(".modal-body").css({"height": "50px"})
	}else{
		alert("입원한적이 없습니다.");
	}

}

function petientsOutRoomConfirm(pid, rid){
	$.ajax({
		type: "GET",
		url: "../Process?action=outRoom&pid="+pid+"&rid="+rid,
		  async: false,
		success: function(patient){
 
			$(".patientMsg").addClass("alert-success").html("<strong>Success</strong>: 퇴원처리 되었습니다!");
 
			//$("#patientBody #"+pid).remove();
			$("#displayPatients").DataTable().row($("#patientBody #"+pid)).remove().draw();
			addPatientToTable(patient);
		},
		error: function(xml){
			$(".docMsg").addClass("alert-danger").html("<strong>Error</strong>: "+xml.responseText);
		}
	});
}

