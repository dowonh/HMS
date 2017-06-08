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
					var indoorID = certificate.indoor.id;
					var indoorStart = certificate.indoor.door_start_day;
					var indoorEnd = certificate.indoor.door_end_day;
					var patientName = certificate.patient.name;
					var patientBirth = certificate.patient.birth;
					var noteDay = certificate.doctornote.day;
					var categoty = certificate.patient.category.name;
					var doctorName = certificate.patient.employee.name;
					var index = $("#tblDoorCertificate").dataTable().fnAddData([
															indoorID,
															indoorStart,
															indoorEnd,
															patientName,
															patientBirth,
															noteDay,
															categoty,
															doctorName,
															"<a href='Certificate.jsp?indoorID="+indoorID+"&indoorStart="+indoorStart+"&indoorEnd="+indoorEnd+"&patientName="+patientName+"&patientBirth="+patientBirth+"&noteDay="+noteDay+"" +
																	"&categoty="+categoty+"&doctorName="+doctorName+"' target='_blank'><button>출력하기</button></a>"					                                        
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
					var pid = certificate.patient.pid;
					var patientName = certificate.patient.name;
					var noteDay = certificate.doctornote.day;
					var billDate = certificate.bill.date;
					var billPrice = certificate.bill.price;
					var index = $("#tblBillCertificate").dataTable().fnAddData([
															pid,
															patientName,
															noteDay,
															billDate,
															billPrice,
															"<a href='Bill.jsp?pid="+pid+"&patientName="+patientName+"&noteDay="+noteDay+"&billDate="+billDate+"&billPrice="+billPrice+"' target='_blank'><button>출력하기</button></a>"
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
				var name = certificate.patient.name;
				if(certificate.patient.pid == null){
					alert("진단 내역이 없습니다.");
				}
				else{
				//data.forEach(function(certificate){
					
					var patientName = certificate.patient.name;
					var gender = certificate.patient.gender;
					var birth = certificate.patient.birth;
					var symptom = certificate.doctornote.symptom;
					var note = certificate.doctornote.note;
					var day = certificate.doctornote.day;
					var use = "제출용";
						
					var index = $("#tblNoteCertificate").dataTable().fnAddData([
															patientName,
															gender,
															birth,
															symptom,
															note,
															day,
															use,
															"<a href='medicalCertificate.jsp?patientName="+patientName+"&gender="+gender+"&symptom="+symptom+"&birth="+birth+"&note="+note+"&day="+day+"&use="+use+"' target='_blank'><button>출력하기</button></a>"
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

