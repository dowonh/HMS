<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div id="patients" class="tab-pane fade in">
		<h3>Patients' Record</h3>
		<table class="table table-hover table-bordered" id="displayPatients">
			<thead>
				<tr>
					<th>Name</th>
					<th>Birth</th>
					<th>Gender</th>
					<th>phone</th>
					<th>Doctor's Name</th>
					<th>Reservation Day</th>
					<th>Reservation Time</th>
				</tr>
			</thead>
			<tbody id="patientBody">
			</tbody>
		</table>
		<div class="patientMsg"></div>
	</div>
</body>
</html>