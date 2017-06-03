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
				                                                  "<a href=../services/room/"+ room.rid +">SHOW</a>"
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
	
	$("table").dataTable();
})