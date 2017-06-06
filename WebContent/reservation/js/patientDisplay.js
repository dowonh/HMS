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
	
	
	
});

