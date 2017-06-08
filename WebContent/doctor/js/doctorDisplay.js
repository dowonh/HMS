$(function(){
	
	var uid = $("body").attr("id");
	
	//For My Patients
	$.ajax({
		url: "../services/patient/doctor",
		type: "GET",
		success: function(data){
			data.forEach(function(patient){
				
				addPatientToTable(patient);
				
			});
		},
		error: function(data){
			$(".roomMsg").removeClass("alert-success")
			$(".roomMsg").addClass("alert-danger").html("<strong>Error: </strong> "+data.responseText);
		}
	});
	
	/*$.ajax({
		url: "../services/patient/doctor"+pid,
		type: "GET",
		success: function(data){
			data.forEach(function(patient){
				
				addPatientToTableALL(patient);
				
			});
		},
		error: function(data){
			$(".roomMsg").removeClass("alert-success")
			$(".roomMsg").addClass("alert-danger").html("<strong>Error: </strong> "+data.responseText);
		}
	});*/
//	//For Displaying My Prescriptions
//	$.ajax({
//		url: "../services/prescription/doctor/"+uid,
//		type: "GET",
//		success: function(data){
//			data.forEach(function(prescription){
//				
//				addPresToTable(prescription);
//
//			});
//		},
//		error: function(data){
//			$(".roomMsg").removeClass("alert-success")
//			$(".roomMsg").addClass("alert-danger").html("<strong>Error: </strong> "+data.responseText);
//		}
//	});
	
	
	//클릭이벤트
	$(document).ready(function() {
	    var table = $('#displayPatients').DataTable();
	     
	    $('#displayPatients tbody').on('click', 'tr', function () {
		       
	       var data = table.row( this ).data();

	       var pid = document.getElementById("pid");
	       var n = document.getElementById("fullname");
	       var b = document.getElementById("birth");
	       var g = document.getElementById("gender");
	       var rd = document.getElementById("rday");
	       var rt = document.getElementById("rtime");
	       var p = document.getElementById("phone");
	       var d = document.getElementById("door");
	       var ds = document.getElementById("doorstart");
	       var de = document.getElementById("doorend");
	       var r = document.getElementById("room");

	       pid.value = data[0];
	       n.value = data[1];
	       b.value = data[2];
	       g.value = data[3];
	       rd.value = data[4];
	       rt.value = data[5];
	       p.value = data[6];
	       d.value = data[7];
	       ds.value = data[8];
	       de.value = data[9];
	       r.value = data[10];		
	       
			var my_tbody = document.getElementById('my-tbody');
			var index = my_tbody.rows.length;
			for(var i = 0; i<index; ++i){
				delete_row();
			}
			document.getElementById("symptom").value = '';
			document.getElementById("note").value = '';
	    } );
	} );
	
	//약처방 리스트 출력하는부분
	$.ajax({
		url: "../services/medicine/doctor",
		type: "GET",
		success: function(medicine){
			medicine.forEach(function(med){
				
				$("#myPrescriptionForm select[name=typeselect]").append("<option value=" + med.type+" >"+ med.type + "</option>");
			})
		},
		error: function(){
			
		}
	});
	
	$('#typeselect').change(function(){
	
		$.ajax({
			url : "../services/medicine/doctor/" + $('#typeselect').val(),
			type : "GET",     
	            success : function(medicine) {
	      
	                 $("#myPrescriptionForm select[name=nameselect] option").remove();
	                 medicine.forEach(function(med){
	                 $("#myPrescriptionForm select[name=nameselect]").append("<option value=" + med.name + ">" +med.name + "</option>");
	              });
	            },
	            error:function(request,status,error){
	             
	              }
	        });
	      
	});
	$("table").dataTable();
	
	
	//Submit Prescription Form
	$("#myPrescriptionForm").submit(function(e){
		
		e.preventDefault();
		if($("#pid").val() == ''){
			alert("환자를 클릭해주세요");
			return;
		}
		var my_tbody = document.getElementById('my-tbody');
		var index = my_tbody.rows.length;
 
		$.ajax({
			type: $(this).attr("method"),
			url: $(this).attr("action"),
			data: $(this).serialize() + "&row="+index,
			success: function(pres){
				BootstrapDialog.show({
					title: "Success",
					message: "Prescription Added Success!."
				});
			},
			error: function(xml,status,errorThrown){
				BootstrapDialog.show({
					title: "Error",
					message: xml.responseText
				});
			}
		});
		
	})

	$('#medicineTable').dataTable({
		retrieve : true,
		searching : false,
		paging : false,
		bInfo : false
	//bFilter: false, bInfo: false
	});
	
	$('#medicineTable').find('tbody').empty();

});

function add_row() {

	var my_tbody = document.getElementById('my-tbody');
	
	var row = my_tbody.insertRow(my_tbody.rows.length); // 하단에 추가
	var index = my_tbody.rows.length;
	var nsel = document.getElementById("nameselect");
	var tsel = document.getElementById("typeselect");
	var amount = document.getElementById("amount").value;
	var number = document.getElementById("number").value;
	var count = document.getElementById("count").value;
	if(nsel.value == "nameselect" || tsel.value == "typeselect" ||
			amount =='' || 	number =='' ||	count =='') {
		alert("제대로 입력해주시기 바랍니다.");
	}else{
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		var cell5 = row.insertCell(4);
		
		cell1.innerHTML = "<input type='text' name='mtype"+ index+"' style='border:none; width:100px;' value='" + tsel.options[tsel.selectedIndex].value + "'>";
		cell2.innerHTML = "<input type='text' name='mname"+ index+"' style='border:none; width:100px;' value='" + nsel.options[nsel.selectedIndex].value + "'>";
		cell3.innerHTML = "<input type='text' name='once"+ index+"' style='border:none; width:100px;' value='" + amount + "'>";
		cell4.innerHTML = "<input type='text' name='day"+ index+"' style='border:none; width:100px;' value='" + number  + "'>";
		cell5.innerHTML = "<input type='text' name='long"+ index+"' style='border:none; width:100px;' value='" + count + "'>";
	} 
}

function delete_row() {
	var my_tbody = document.getElementById('my-tbody');
	if (my_tbody.rows.length < 1)
		return;
	// my_tbody.deleteRow(0); // 상단부터 삭제
	my_tbody.deleteRow(my_tbody.rows.length - 1); // 하단부터 삭제
}


function viewPres(pid){
	
	$("#presViewForm .form-group div").remove();
	
	//For Getting All Meds
	$.ajax({
		url: "../services/medicine/all",
		type: "GET",
		success: function(meds){
			

			//For Getting presz of patient
			$.ajax({
				url: "../services/prescription/patient/"+pid,
				type: "GET",
				success: function(data){
					data.forEach(function(pres){
						
						
						var select = document.createElement("select");
						$(select).addClass("form-control");
						$(select).attr("name","mid");
						meds.forEach(function(medicine){
							if(pres.mid==medicine.mid) $(select).append("<option value="+medicine.mid+" selected>"+medicine.name+"</option>");
							else $(select).append("<option value="+medicine.mid+">"+medicine.name+"</option>");
						});
						
						var div = document.createElement("div");
						$(div).addClass("col-lg-6");
						$(div).append(select);
						$(div).clone().appendTo("#presViewForm .form-group");
						
						$("#presViewForm .form-group").append("<div class='col-lg-6'><input type='text' class='form-control' name='dosage' placeholder='Dosage' value='"+pres.dosage+"'  required/></div>");

					});
				},
				error: function(data){
					
				}
			})
		},
		error: function(data){
			
		}
	});
	
	$("#viewPresModal").modal("toggle");
}

function submitPres(pid){
	
	$("#presSubmitForm").attr("action","../services/prescription/patient/"+pid);
	$("#presSubmitForm").append("<input type='hidden' name='uid' value='"+$('body').attr('id')+"' /> ");
	
	//For Getting All Meds
	$.ajax({
		url: "../services/medicine/all",
		type: "GET",
		success: function(meds){
			meds.forEach(function(med){
				$("#presSubmitForm .form-group div select.med").append("<option value="+med.mid+" >"+med.name+"</option>");
			})
		},
		error: function(er){
			console.log(er);
		}
	});
	$("#submitPresModal").modal("toggle");
}

function addPres(pid){
	$("#addPresForm").attr("action","../services/prescription/patient/"+pid);
	$("#addPresForm").append("<input type='hidden' name='uid' value='"+$('body').attr('id')+"' /> ");
	
	$("#addPresModal").modal("toggle");
}

function editPres(prid){
	
	$("#presUpdateForm").attr("action","../services/prescription/"+prid);
	$("#presUpdateForm").append("<input type='hidden' name='uid' value='"+$('body').attr('id')+"' /> ");
	
	
	$.ajax({
		url: "../services/prescription/"+prid,
		type: "GET",
		success: function(pres){
			
			$.ajax({
				url: "../services/medicine/all",
				type: "GET",
				success: function(meds){
					
					meds.forEach(function(med){
						
						if(pres.mid == med.mid) $("#presUpdateForm .form-group select").append("<option value="+med.mid+" selected>"+med.name+"</option>");
						else $("#presUpdateForm .form-group select").append("<option value="+med.mid+">"+med.name+"</option>");
					});
					
				},
				error: function(error){
					
				}
			});
			
			$("#presUpdateForm input[name=dosage]").val(pres.dosage);
			
		},
		error: function(data){
			
		}
	});
	
	$("#updatePresModal").modal("toggle");
}

function addPresToTable(data){
	
	if(Array.isArray(data)){
		data.forEach(function(pres){
			var index = $("#tblPrescriptions").dataTable().fnAddData([
			  			                                            pres.patient.name,
						                                            pres.patient.gender,
						                                            pres.medicine.name,
						                                            pres.dosage,
						                                            "<a href='#' onclick='editPres("+pres.prid+")'>Update</a> / <a href='#' onclick='deletePres("+pres.prid+")'>Delete</a>"
						                                            ]);
			var row =  $("#tblPrescriptions").dataTable().fnGetNodes(index);
			$(row).attr("id",pres.prid);
			
		});
	}
	else{
		var index = $("#tblPrescriptions").dataTable().fnAddData([
			  			                                            data.patient.name,
			  			                                            data.patient.gender,
			  			                                            data.medicine.name,
			  			                                            data.dosage,
						                                            "<a href='#' onclick='editPres("+data.prid+")'>Update</a> / <a href='#' onclick='deletePres("+data.prid+")'>Delete</a>"
						                                            ]);
			var row =  $("#tblPrescriptions").dataTable().fnGetNodes(index);
			$(row).attr("id",data.prid);
			//$(".deleteMe").remove();
	}
	
}


//function deletePres(prid){
//	
//	bootbox.confirm("Are you sure?",function(sure){
//		if(sure){
//			$.ajax({
//				url: "../services/prescription/"+prid,
//				type: "DELETE",
//				success: function(result){
//					BootstrapDialog.show({
//						title: "Status",
//						message: "Message: "+result
//					});
//					
//					
//					$("#presBody #"+prid).remove();
//				},
//				error: function(data){
//					BootstrapDialog.show({
//						title: "Failed",
//						message: "Deletion Failed!"
//					});
//				}
//			});
//		}
//	}).find(".modal-body").css({"height": "50px"})
//	
//}

function addPatientToTable(patient){

	var index = $("#displayPatients").dataTable().fnAddData([
													  patient.pid,
	           	                                      patient.name,
	        	                                      patient.birth,
	        	                                      patient.gender,
	        	                                      patient.reservation_day,
	        	                                      patient.reservation_time,
	        	                                      patient.phone,
												      patient.door,
												      patient.door_start_day, 
												      patient.rid,
	        	                                      ]);
	
	var row = $("#displayPatients").dataTable().fnGetNodes(index);
	
	$(row).attr("id",patient.pid);

}


