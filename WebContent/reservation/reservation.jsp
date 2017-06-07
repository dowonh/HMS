
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>예약 및 조회</title>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/simple-sidebar.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../fn/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- Javascript Includes -->

<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

</head>

<style>
	input#register-input.form-control{
		width: inherit !important;
	}
	
	#selectDepartment.form-control{
		width: inherit !important;
	}
	#selectDoctor.form-control{
		width: inherit !important;
	}
</style>

<body>



	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">

			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="../index.jsp"> HMS </a></li>

				<li class="active"><a href="./reservation.jsp"><i
						class="fa fa-glide-g" aria-hidden="true"></i> 예약 안내</a></li>
				<li><a href="./reservationCheck.jsp"><i
						class="fa fa-list-alt" aria-hidden="true"></i> 예약 조회</a></li>
				<li><a href="./resultCheck.jsp"><i class="fa fa-paperclip"
						aria-hidden="true"></i> 결과 조회</a></li>
				<li><a href="./certificateIssue.jsp"><i class="fa fa-print"
						aria-hidden="true"></i> 증명서 발급</a></li>
			</ul>
		</div>


		<!-- /#sidebar-wrapper -->
		<div id="page-content-wrapper">
			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							예약 안내 <small>예약 및 조회</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->
				<div class="container">
					처음 오신 분 빠른 예약
					<ul>
						<li>전화번호를 남시기면, 상담원이 예약을 도와드립니다.</li>
						<li>상담시간 평일 08:30 ~ 17:30 토요일 08:30 ~ 12:30 (공휴일 제외)</li>
					</ul>
					인터넷 예약
					<ul>
						<li>진료과, 질병명으로 예약을 하실 수 있습니다. <!-- Button trigger modal -->
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#registerModal">
								진료 예약 <i class="fa fa-arrow-circle-right"></i>
							</button>
						</li>
						<li>회원 / 비회원 예약이 가능합니다.</li>
					</ul>
					전화 예약
					<ul>
						<li>1111-1004 (365일 24시간 예약 가능)</li>
					</ul>
					전화 예약
					<ul>
						<li>병원에 내원하셔서 예약하실 수 있습니다.</li>
					</ul>
				</div>
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /sidebar-wrapper -->
	</div>
	<!-- /#wrapper -->


	<!-- Modal -->
	<div class="modal fade bd-example-modal-lg" id="registerModal"
		tabindex="-1" role="dialog" aria-labelledby="registerModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">진료 예약</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<div class="container">
						<form method="post" action="../Process?action=addPatient"
							name='form' id='addPatientForm'>
							<div class="row">
							<div class="col-lg-6">
							<div class="form-group row">
								<label for="example-date-input" class="col-2 col-form-label">이름</label>
								<div class="col-6">
									<input class="form-control" type="text" id="register-input"
										name="name">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-date-input" class="col-2 col-form-label">성별</label>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										id="inlineRadio1" value="male"> 남자 <input
										class="form-check-input" type="radio" name="gender"
										id="inlineRadio2" value="female"> 여자
								</div>
							</div>
							<div class="form-group row">
								<label for="example-date-input" class="col-2 col-form-label">생년월일</label>
								<div class="col-6">
									<input class="form-control" type="date" value="2017-05-16"
										id="register-input" name="dob">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-date-input" class="col-2 col-form-label">전화번호
									('-' 없이 입력해 주세요.)</label>
								<div class="col-6">
									<input class="form-control" type="text" id="register-input"
										name="phone">
								</div>
							</div>
							</div>
							<br>
							<div class="col-lg-6">
							<div class="form-group row">
								<label for="inputEmail3" class="col-2 col-form-label">진료과
									선택</label>
								<div class="col-10">
								
								<select name="department" class="form-control" id="selectDepartment">
										<option value="default">----진료과 선택----</option>
										</select>
								
								</div>
							</div>
							<div class="form-group row">
								<label for="inputEmail3" class="col-2 col-form-label">의사
									선택</label>
								<div class="col-10">
									<select name="doctor" class="form-control" id="selectDoctor">
										<option value="default">----의사 선택----</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="example-date-input" class="col-2 col-form-label">예약
									날짜 선택</label>
								<div class="col-6">
									<input class="form-control" type="date" value="2017-05-16"
										id="register-input" name="reservation_date">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-time-input" class="col-2 col-form-label">예약
									시간 선택</label>
								<div class="col-6">
									<input class="form-control" type="time" value="13:45:00"
										id="register-input" name="reservation_time">
								</div>
							</div>
							</div>
							</div>
							<div class="form-group row">
								<div class="offset-sm-2 col-sm-10" style="margin-left: auto;">
									<button type="submit" class="btn btn-primary">예약하기</button>
								</div>
							</div>
						</form>
					</div>
					
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="../js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min.js"></script>
	<script src="./js/patientDisplay.js"></script>

</body>

</html>