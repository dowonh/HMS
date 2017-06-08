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
.form-control {
	margin: 5px;
}

.modal-body {
	height: 150px;
}
</style>
</head>
<body>
	<div id="rooms" class="tab-pane fade in">
		<h3>병실 목록</h3>
		<table class="table table-hover table-bordered" id="displayRooms">
			<thead>
				<tr>
					<th>병실 번호</th>
					<th>전체 침대 개수</th>
					<th>남은 침대 개수</th>
					<th>삭제 / 편집</th>
				</tr>
			</thead>
			<tbody id="roomBody"></tbody>
		</table>
		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#addRoomModal">병실 추가</button>
		<div class="roomMsg"></div>


		<!-- Add Room Modal-->
		<div id="addRoomModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<form method="POST" id="roomForm" action="../Process?action=addRoom">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">병실 정보 변경</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<div class="col-lg-12">
									<label>병실 번호</label> <input type="number"
										class="form-control" name="room_number"
										placeholder="Enter Room Number" required />
								</div>
								<div class="col-lg-12">
									<label>전체 침대 개수</label> <input type="number"
										class="form-control" name="totalbeds"
										placeholder="Enter No of Beds" required />
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-success">저장하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<!-- Update Room Modal -->
		<div id="editRoomModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<form method="POST" id="updateRoomForm">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Enter Room Detail</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<div class="col-lg-12">
									<input type="number" class="form-control" name="totalbeds"
										placeholder="Enter No of Beds" required />
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
	</div>
</body>
</html>