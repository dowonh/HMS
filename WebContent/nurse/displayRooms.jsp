<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	<div id="rooms" class="tab-pane fade in active">
		<h3>Room Infomation</h3>
		<table class="table table-hover table-bordered" id="tblRooms">
			<thead>
				<tr>
					<th>Room No</th>
					<th>Total Beds</th>
					<th>Available Beds</th>
					<th>No of Patients</th>
					<th>SHOW ROOM</th>
				</tr>
			</thead>
			<tbody id="roomBody">
			</tbody>
		</table>
		<div class="roomMsg"></div>
	</div>
	<!-- show Room Modal -->
	<div id="showRoomModal" class="modal fade" role="dialog">
		<div class="modal-content">
			<div class="modal-dialog">
				<table class="table table-hover table-bordered" id="showRooms">
					<thead>
						<tr>
							<th>Patient Name</th>
							<th>Gender</th>
							<th>Birth</th>
							<th>입원날짜</th>
							<th>담당의사</th>
						</tr>
					</thead>
					<tbody id="showRoomBody">
					</tbody>
				</table>
				<div class="showRoomMsg"></div>
			</div>
		</div>
	</div>
</body>
</html>