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
		<h3>입원실 정보</h3>
		<table class="table table-hover table-bordered" id="tblRooms">
			<thead>
				<tr>
					<th>병실 번호</th>
					<th>전체 침대 개수</th>
					<th>남은 침대 개수</th>
					<th>입원 환자 수</th>
					<th>입원실 보기</th>
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
							<th>환자명</th>
							<th>성별</th>
							<th>생년월일</th>
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