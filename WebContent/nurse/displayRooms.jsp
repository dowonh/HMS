<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="rooms" class="tab-pane fade in active">
	<h3>Room Infomation</h3>
	<table class="table table-hover table-bordered" id="tblRooms">
		<thead>
			<tr>
				<th>
					Room No
				</th>
				<th>
					Total Beds
				</th>
				<th>
					Available Beds
				</th>
				<th>
					No of Patients
				</th>
				<th>
					SHOW ROOM
				</th>
			</tr>
		</thead>
		<tbody id="roomBody"> </tbody>
	</table>
	<div class="roomMsg"></div>
</div>
</body>
</html>