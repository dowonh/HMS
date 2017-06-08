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
		<h3>환자 목록</h3>
		<table class="table table-hover table-bordered" id="displayPatients">
			<thead>
				<tr>
					<th>이름</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>휴대폰 번호</th>
					<th>담당 의사</th>
					<th>예약 날짜</th>
					<th>예약 시간</th>
					<th>입원 여부</th>
	
					<th>입원 날짜</th>
					<th>입원 하기</th>
					<th>퇴원 하기</th>
				</tr>
			</thead>
			<tbody id="patientBody">
			</tbody>
		</table>
		<div class="patientMsg"></div>
	</div>
	<div id="assignRoomModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<form method="POST" id="assignRoomForm">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Select Room No</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>입원 가능한 방</label>
							<select name="rid" class="form-control"></select>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">Assign Room</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>