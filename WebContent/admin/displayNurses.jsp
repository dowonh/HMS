<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hmsModels.*"%>
<%@ page import="hmsControllers.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
#nurse-modal-body {
	height: 200px;
}
</style>
</head>
<body>
	<div id="nurses" class="tab-pane fade in">
		<h3>Nurses' Record</h3>
		<table class="table table-hover table-bordered" id="displayNurses">
			<thead>
				<tr>
					<th>ID</th>
					<th>Password</th>
					<th>Name</th>
					<th>Gender</th>
					<th>Birth</th>
					<th>Phone No</th>
					<th>Salary</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody id="nurseBody"></tbody>
		</table>
		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#addNurseModal">Add Nurse</button>
		<div class="nurseMsg"></div>

		<!-- 추가모달 시작 -->
		<div id="addNurseModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<form method="POST" id="nurseForm"
					action="../Process?action=addNurse">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Enter Nurse's Detail</h4>
						</div>
						<div id="nurse-modal-body" class="modal-body">
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
						<div class="modal-footer">
							<button type="submit" class="btn btn-success">Save
								Record</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<!-- 수정모달 시작 -->
		<div id="editNurseModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<form method="POST" id="nurseUpdateForm">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Enter Nurse's Detail</h4>
						</div>
						<div id="nurse-modal-body" class="modal-body">
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
								<div class="col-lg-12">
									<label for="radio">Select Gender</label><br>
									<div class="radio">
										<label><input type="radio" name="gender" value="male"
											required /> Male</label> <label><input type="radio"
											name="gender" value="female" /> Female</label>
									</div>
								</div>
								<div class="col-lg-12">
									<label>Birth</label><br> <input type="text" name="birth"
										placeholder="Birth" readonly class="form-control dob" required />
								</div>
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
	</div>
</body>
</html>