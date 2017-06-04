<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
#viewPresModal div.modal-body{
	height: 200px;
}

#viewPresModal div.modal-content{
	width: 400px;
}
#viewPresModal .modal-dialog, #viewPresModal .modal-content{
		width: 200px;
	}
	
	#presAddForm .modal-body{
		height: 200px;
	}
</style>
</head>
<body>
<div id="myPatients" class="tab-pane fade in active">
				<h3>Patients' Record</h3>
				<table class="table table-hover table-bordered" id="tblPatients" >
					<thead>
						<tr>
							<th>
								Full Name
							</th>
							<th>
								Date of Birth
							</th>
							<th>
								Gender
							</th>
							<th>
								Patient Type
							</th>
							<th>
								Prescription
							</th>
						</tr>
					</thead>
					<tbody id="patientBody"> </tbody>
				</table>
				 <h3> Patient Note</h3>
				 
					<form method="POST" action="displayData.jsp" id="NoteForm">
				    <!-- Modal content-->
				    
						  <div class="form-group">
						  
						  		<div class="col-lg-6">
						  		Patient Type
						  		<select name="patType" class="form-control">
							 	 		<option value="indoor">Indoor</option>
							 	 		<option value="outdoor">Outdoor</option>
						 	 		</select>
						 	 	</div>
						 	 	
						 	 	
						 	 	Patient Note
						 	 	<div class="col-lg-6"><input type="text" class="form-control" name="disease" placeholder="Note" required/></div>
						 	 	
						  </div>
				      
					</form>
				  
				 <br><br><br><br>
				  <h3> Prescriptions</h3>
				  <form method="POST" action="displayData.jsp" id="presSubmitForm">
				  <div class="container col-lg-12">
								<div class="form-group">
							    <label for="medicineselect">Medicine</label>
							    
							    <select class="form-control" id="typeselect" >
							  	<option value="typeselect">Medicine Type</option>
							      <option>감기</option>
							      <option>항생</option>
							      <option>수면</option>

							    </select>
							    
							    <select class="form-control" id="nameselect">
							  <option value="nameselect">Medicine Name</option>
							      <option>aaaaaa</option>
							      <option>bbbbb</option>
							      <option>ccccc</option>

							    </select>
							     <br>
							    <label for="content">Content</label>
							    <select multiple class="form-control" id="content">
							  <option value="medicineselect" align="center"><  Select Medicine  ></option>
							  							      <option>ccccc</option>
							  
							      

							    </select> 
							  </div>
							  <br>
							  <label for="pres">Opinion</label>
				  <p> <textarea id="pres" cols="155" rows="5"> </textarea></p>
							  </div>
							  </form>
				  
				<p align=right>
				<button type="submit" class="btn btn-success">Add Prescription</button>
				<div class="patientMsg"></div>
			</div>
			
			
			<!-- Prescription View Modal-->
			<div id="viewPresModal" class="modal fade" role="dialog">
				  <div class="modal-dialog">
					<form method="POST" id="presViewForm">
				    <!-- Modal content-->
				    <div class="modal-content">
				      <div class="modal-header">
				        <h4 class="modal-title">Prescription View</h4>
				      </div>
				      <div class="modal-body">
						  <div class="form-group">
						  		
						  </div>
				      </div>
				      <div class="modal-footer">
				      </div>
				    </div>
					</form>
				  </div>
				
			</div>
			
			<!-- Prescription Submit Modal-->
			<div id="submitPresModal" class="modal fade" role="dialog">
				  <div class="modal-dialog">
					<form method="POST" id="presSubmitForm">
				    <!-- Modal content-->
				    <div class="modal-content">
				      <div class="modal-header">
				        <h4 class="modal-title">Add Prescription</h4>
				      </div>
				      <div class="modal-body">
						  <div class="form-group">
						  		<div class="col-lg-6">
						  		<select name="patType" class="form-control">
							 	 		<option value="indoor">Indoor</option>
							 	 		<option value="outdoor">Outdoor</option>
						 	 		</select>
						 	 	</div>
						 	 	<div class="col-lg-6"><input type="text" class="form-control" name="disease" placeholder="Disease" required/></div>
						 	 	
						  		<div class="col-lg-6"><select name="mid1"  class="form-control med"></select></div>
						  		<div class="col-lg-6">
						  			<input type="text" name="dosage1" class="form-control" placeholder="Dosage" required/>
						 	 	</div>
						 	 	
						 	 	<div class="col-lg-6"><select name="mid2" class="form-control med"></select></div>
						  		<div class="col-lg-6">
						  			<input type="text" name="dosage2" class="form-control" placeholder="Dosage"/>
						 	 	</div>
						 	 	
						 	 	<div class="col-lg-6"><select name="mid3" class="form-control med"></select></div>
						  		<div class="col-lg-6">
						  			<input type="text" name="dosage3" class="form-control" placeholder="Dosage"/>
						 	 	</div>
						 	 	
						  </div>
				      </div>
				      <div class="modal-footer">
				        <button type="submit" class="btn btn-success">Add Prescription</button>
				      </div>
				    </div>
					</form>
				  </div>
				
			</div>
			
			
			
			<!-- Prescription Add Modal-->
			<div id="addPresModal" class="modal fade" role="dialog">
				  <div class="modal-dialog">
					<form method="POST" id="addPresForm">
				    <!-- Modal content-->
				    <div class="modal-content">
				      <div class="modal-header">
				        <h4 class="modal-title">Add Prescription</h4>
				      </div>
				      <div class="modal-body">
						  <div class="form-group">
						  		
						  		<div class="col-lg-6"><select name="mid1"  class="form-control med"></select></div>
						  		<div class="col-lg-6">
						  			<input type="text" name="dosage1" class="form-control" placeholder="Dosage" required/>
						 	 	</div>
						 	 
						  </div>
				      </div>
				      <div class="modal-footer">
				        <button type="submit" class="btn btn-success">Add Prescription</button>
				      </div>
				    </div>
					</form>
				  </div>
				
			</div>
</body>
</html>