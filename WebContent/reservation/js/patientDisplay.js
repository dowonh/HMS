$(function(){
	
	$("#addPatientForm").submit(function(e){
		e.preventDefault();
		
		$.ajax({
			url: $(this).attr("action"),
			type: $(this).attr("method"),
			data: $(this).serialize(),
			success: function(patient){
				 alert("예약되었습니다.");
				 
				$("#registerModal").modal("hide");
				$('body').removeClass('modal-open');
				$('.modal-backdrop').remove();
				 
			},
			error: function(err){
				 
			}
		
		});
	
	});
	
	
	$('#selectDepartment').change(function(){		
		 $.ajax({
			 url : "../services/doctor/" + $('#selectDepartment').val(),
	         type : "GET",     
	         success : function(doctors) {
	     	   	$("#addPatientForm select[name=doctor] option").remove();
	        	doctors.forEach(function(employee){
	     			$("#addPatientForm select[name=doctor]").append("<option value="+employee.eid+">"+employee.name + "</option>");
	     		});
	         },
	         error : function() {

	         }
	     });
		
	});
	
	
	$.ajax({
		url: "../services/category/department",
		type: "GET",
		success: function(categories){
		   	categories.forEach(function(category){				
				$("#addPatientForm select[name=department]").append("<option value="+category.catid+">"+category.name + "</option>");
			});
		},
		error: function(error){
			console.log(error.responseText);
		}
	});
	
	$('#tblReservationCheck').dataTable({
        retrieve: true, searching: false, paging: false, bInfo: false   
     //bFilter: false, bInfo: false
	});
	$('#tblReservationCheck').find('tbody').empty();
	
	$("#ReservationCheckForm").submit(function(e){
		e.preventDefault();
		
		var table = $('#tblReservationCheck').DataTable();

		if ( table.data().count() != 0) {
		    table.clear().draw();
		}
		
		
		$.ajax({
			url: $(this).attr("action"),
			type: $(this).attr("method"),
			data: $(this).serialize(),
			success: function(data){

				var num = 1;
				
				data.forEach(function(patient){
					
					var index = $("#tblReservationCheck").dataTable().fnAddData([
															num,
															patient.reservation_day,
															patient.name,
															patient.category.name,
															patient.employee.name,
															patient.reservation_time
					                                         ]);
					
					var row = $("#tblReservationCheck").dataTable().fnGetNodes(index);
					$(row).attr("id",patient.pid);
					num = num + 1;
					
				});
				
			},
			error: function(err){
			}		
		});	
	});
	
	$('#tblIndoorCheck').dataTable({
        retrieve: true, searching: false, paging: false, bInfo: false   
     //bFilter: false, bInfo: false
	});
	$('#tblIndoorCheck').find('tbody').empty();
	
	$("#IndoorCheckForm").submit(function(e){
		e.preventDefault();
		
		var table = $('#tblIndoorCheck').DataTable();

		if ( table.data().count() != 0) {
		    table.clear().draw();
		}
		
		
		$.ajax({
			url: $(this).attr("action"),
			type: $(this).attr("method"),
			data: $(this).serialize(),
			success: function(data){
				//alert(data);
				var num = 1;
				
				//data.forEach(function(indoor){

					var index = $("#tblIndoorCheck").dataTable().fnAddData([
															num,
															data.patient.name,
															data.room_number,
															data.door_start_day,
															data.door_end_day			
					                                         ]);
					
					var row = $("#tblIndoorCheck").dataTable().fnGetNodes(index);
					$(row).attr("id",indoor.patient_pid);
					num = num + 1;
					
				//});
				
			},
			error: function(err){
			}		
		});	
	});
	
	$('#tblMedicineCheck').dataTable({
        retrieve: true, searching: false, paging: false, bInfo: false   
     //bFilter: false, bInfo: false
	});
	$('#tblMedicineCheck').find('tbody').empty();
	
	$("#MedicineCheckForm").submit(function(e){
		e.preventDefault();
		
		var table = $('#tblMedicineCheck').DataTable();

		if ( table.data().count() != 0) {
		    table.clear().draw();
		}
		
		
		$.ajax({
			url: $(this).attr("action"),
			type: $(this).attr("method"),
			data: $(this).serialize(),
			success: function(prescriptionList){
				var num = 1;
				prescriptionList.forEach(function(prescription){

					var index = $("#tblMedicineCheck").dataTable().fnAddData([
															num,
															prescription.doctornote.day,
															prescription.patient.name,
															prescription.patient.category.name,
															prescription.patient.employee.name,
															prescription.mname,
															prescription.once_dose,
															prescription.day_dose,
															prescription.how_long	
					                                         ]);
					
					var row = $("#tblMedicineCheck").dataTable().fnGetNodes(index);
					$(row).attr("id",prescription.pid);
					num = num + 1;	
				});
				
			},
			error: function(err){
			}		
		});	
	});
	
	$('#tblDoorCertificate').dataTable({
        retrieve: true, searching: false, paging: false, bInfo: false   
     //bFilter: false, bInfo: false
	});
	$('#tblDoorCertificate').find('tbody').empty();
	
	$("#DoorCertificateForm").submit(function(e){
		e.preventDefault();
		var table = $('#tblDoorCertificate').DataTable();

		if ( table.data().count() != 0) {
		    table.clear().draw();
		}
			
		$.ajax({
			url: $(this).attr("action"),
			type: $(this).attr("method"),
			data: $(this).serialize(),
			success: function(certificate){
				if(certificate.indoor.door_start_day == null){
					alert("입원 내역이 없습니다.");
				}
				else{
				//data.forEach(function(certificate){

					var index = $("#tblDoorCertificate").dataTable().fnAddData([
															certificate.indoor.id,
															certificate.indoor.door_start_day,
															certificate.indoor.door_end_day,
															certificate.patient.name,
															certificate.patient.birth,
															certificate.doctornote.day,
															certificate.patient.category.name,
															certificate.patient.employee.name
					                                         ]);
					
					var row = $("#tblDoorCertificate").dataTable().fnGetNodes(index);
					$(row).attr("id",prescription.pid);

				//});
				}
			},
			error: function(err){
			}		
		});	
	});
	
	$('#tblBillCertificate').dataTable({
        retrieve: true, searching: false, paging: false, bInfo: false   
     //bFilter: false, bInfo: false
	});
	$('#tblBillCertificate').find('tbody').empty();
	
	$("#BillCertificateForm").submit(function(e){
		e.preventDefault();
		var table = $('#tblBillCertificate').DataTable();

		if ( table.data().count() != 0) {
		    table.clear().draw();
		}
			
		$.ajax({
			url: $(this).attr("action"),
			type: $(this).attr("method"),
			data: $(this).serialize(),
			success: function(certificate){
				if(certificate.doctornote.day == null){
					alert("납입 내역이 없습니다.");
				}
				else{
				//data.forEach(function(certificate){

					var index = $("#tblBillCertificate").dataTable().fnAddData([
															certificate.patient.pid,
															certificate.patient.name,
															certificate.doctornote.day,
															certificate.bill.date,
															certificate.bill.price
					                                         ]);
					
					var row = $("#tblBillCertificate").dataTable().fnGetNodes(index);
					$(row).attr("id",prescription.pid);

				//});
				}
			},
			error: function(err){
			}		
		});	
	});
	
	$('#tblNoteCertificate').dataTable({
        retrieve: true, searching: false, paging: false, bInfo: false   
     //bFilter: false, bInfo: false
	});
	$('#tblNoteCertificate').find('tbody').empty();
	
	$("#NoteCertificateForm").submit(function(e){
		e.preventDefault();
		var table = $('#tblNoteCertificate').DataTable();

		if ( table.data().count() != 0) {
		    table.clear().draw();
		}
			
		$.ajax({
			url: $(this).attr("action"),
			type: $(this).attr("method"),
			data: $(this).serialize(),
			success: function(certificate){
				var use = "제출용"
				if(certificate.patient.pid == null){
					alert("진단 내역이 없습니다.");
				}
				else{
				//data.forEach(function(certificate){

					var index = $("#tblNoteCertificate").dataTable().fnAddData([
															certificate.patient.name,
															certificate.patient.gender,
															certificate.patient.birth,
															certificate.doctornote.note,
															certificate.doctornote.day,
															use
					                                         ]);
					
					var row = $("#tblNoteCertificate").dataTable().fnGetNodes(index);
					$(row).attr("id",prescription.pid);

				//});
				}
			},
			error: function(err){
			}		
		});	
	});
});

