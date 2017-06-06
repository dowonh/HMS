<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hmsModels.*"%>
<%@ page import="hmsControllers.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.modal-content {
	width: 400px;
}

.modal-body {
	height: 150px;
}
</style>
</head>
<body>
	<div id="doctors" class="tab-pane fade in active">
		<h3>Doctors' Record</h3>
		<table class="table table-hover table-bordered" id="displayDoctors">
			<thead>
				<tr>
					<th>ID</th>
					<th>Password</th>
					<th>Name</th>
					<th>Gender</th>
					<th>Birth</th>
					<th>Phone No</th>
					<th>Salary</th>
					<th>Specialization</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody id="docBody"></tbody>
		</table>
		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#addDocModal">Add Doctor</button>
		<div class="docMsg"></div>


		<!-- 의사 추가 모달 -->
		<div id="addDocModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<form method="POST" id="docForm" action="../Process?action=addDoc">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Enter Doctor's Detail</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<div class="col-lg-6">
									<input type="text" class="form-control" name="username"
										placeholder="Username" required />
								</div>
								<div class="col-lg-6">
									<input type="password" class="form-control" name="password"
										placeholder="Password" required />
								</div>
								<div class="col-lg-6">
									<input type="text" class="form-control" name="name"
										placeholder="Name" required />
								</div>
								<br />
								<div class="col-lg-6">
									<input type="text" class="form-control" name="phone"
										placeholder="Phone No." required />
								</div>
								<div class="col-lg-12">
									<label for="radio">Select Gender</label><br>
									<div class="radio">
										<label><input type="radio" name="gender" value="male"
											required /> Male</label> <label><input type="radio"
											name="gender" value="female" /> Female</label>
									</div>
								</div>
								<div class="col-lg-12">
									<label>Specialization</label> <select class="form-control"
										name="catid" id="specialization"></select>
								</div>
								<div class="col-lg-12">
									<label>Birth</label><br> <input type="text" name="birth"
										placeholder="Birth" readonly class="form-control dob" required />
								</div>
								<div class="col-lg-12">
									<label>Salary</label><br> <input type="number"
										class="form-control" name="salary" placeholder="Salary"
										required />
								</div>
							</div>
						</div>
						<br />
						<div class="modal-footer">
							<button type="submit" class="btn btn-success">Save
								Record</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- 의사 추가 모달  끝-->
		<!--Update Doctor Modal-->
		<div id="editDocModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<form method="POST" id="docUpdateForm">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Update Doctor's Detail</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<div class="col-lg-12">
									<input type="text" class="form-control" name="name"
										placeholder="Name" required />
								</div>
								<div class="col-lg-6">
									<input type="text" class="form-control" name="username"
										placeholder="Username" required />
								</div>
								<div class="col-lg-6">
									<input type="password" class="form-control" name="password"
										placeholder="Password" required />
								</div>
								<br />
								<div class="col-lg-12">
									<label for="radio">Select Gender</label><br>
									<div class="radio">
										<label><input type="radio" name="gender" value="male"
											required /> Male</label> <label><input type="radio"
											name="gender" value="female" /> Female</label>
									</div>
								</div>
								<div class="col-lg-6">
									<label>Specialization</label> <select class="form-control"
										name="catid" id="specialization"></select>
								</div>
								<div class="col-lg-6">
									<label>Birth</label><br> <input type="text" name="birth"
										placeholder="Birth" readonly class="form-control dob" required />
								</div>
								<br />
								<div class="col-lg-6">
									<input type="number" class="form-control" name="salary"
										placeholder="Salary" required />
								</div>
								<div class="col-lg-6">
									<input type="text" class="form-control" name="phone"
										placeholder="Phone No." required />
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-success">Update
								Record</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!--END Update Doctor Modal-->

	</div>
</body>
</html>