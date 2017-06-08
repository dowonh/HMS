<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>의사 페이지</title>
<style>
/* #viewPresModal div.modal-body {
	height: 200px;
}

#viewPresModal div.modal-content {
	width: 400px;
}

#viewPresModal .modal-dialog, #viewPresModal .modal-content {
	width: 200px;
}

#presAddForm .modal-body {
	height: 200px;
} */
 
table {
	border-collapse: collapse;
	width: 650px;
}

th, td {
	border: 1px solid gray;
	width: 500px;
	height: 50px;
}
 
</style>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="css/plugins/morris.css" rel="stylesheet">

<link href="css/nycss.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome-4.1.0/css/font-awesome.min.css"rel="stylesheet" type="text/css">

</head>

<body>
	<div id="page-wrapper">
		<div class="container-fluid">
			<!-- Page Heading -->
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">환자 목록</h1>
					<ol class="breadcrumb">
						<li class="active">
							<i class="fa fa-dashboard"></i> 당일 예약된 환자의목록입니다.
						</li>
					</ol>
				</div>
			</div>
			<div>
				<div class="row form group">
					<div class="col-lg-6">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="container col-lg-12">
									<div class="form-group">
										<label for="exampleSelect2">환자 리스트</label>
										<table class="table table-hover table-bordered"
											id="displayPatients">
											<thead>
												<tr>
													<th>환자등록번호</th>
													<th>환자명</th>
													<th>생년월일</th>
													<th>성별</th>
													<th>예약 날짜</th>
													<th>예약 시간</th>
												</tr>
											</thead>
											<tbody id="patientBody">
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<form id="myPrescriptionForm" name="myPrescriptionForm" method="post" action="../Process?action=addPrescrip" >
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-clock-o fa-fw"></i> 환자 정보
									</h3>
								</div>
								<div class="panel-body">
									이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름  &nbsp;:&nbsp; <input type="text" name="fullname" id="fullname" value="" style='border:none'/><br>
									생년월일 &nbsp;:&nbsp; <input type="text" id="birth" value="" style='border:none'/> <br>
									성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별&nbsp; :&nbsp; <input type="text" id="gender" value="" style='border:none'/> <br>
									예약&nbsp;날짜&nbsp; :&nbsp; <input type="text" id="rday" value="" style='border:none'/><br>
									예약&nbsp;시간&nbsp;:&nbsp; <input type="text" id="rtime" value="" style='border:none'/><br>
									연&nbsp;&nbsp;락&nbsp;&nbsp;처 &nbsp;: &nbsp;<input type="text" id="phone" value="" style='border:none'/><br>
									입실&nbsp;여부 &nbsp;:&nbsp; <input type="text" id="door" value="" style='border:none'/><br>
									입실시작일 : <input type="text" id="doorstart" value="" style='border:none'/><br>
					
									입실 방번호: <input type="text" id="room" value="" style='border:none'/><br>
									<input type="hidden" name="pid" id="pid" /> 
								</div>
							</div>


							<div>
								<label>증상</label> <input id="symptom" name="symptom" type="text" class="form-control"
									placeholder="symptom" />
							</div>
							<br>
							<div>
								<label for="medicineselect">약 처방</label> <select
									class="form-control" id="typeselect" name="typeselect">
									<option value="typeselect">약 종류</option>


								</select> <select class="form-control" id="nameselect" name="nameselect">
									<option value="nameselect">약 이름</option>

								</select>

								<p align=right>
									<br> <label> 1회 투약량 : <input type=text id=amount
										size=5></label> &nbsp <label> 1회 투약횟수 : <input
										type=text id=number size=5></label>&nbsp <label> 총
										투약일수 : <input type=text id=count size=5>
									</label> &nbsp <br>
									<br>
									<button onclick="add_row()" type="button" class="btn ">추가</button>
									<button onclick="delete_row()" type="button" class="btn ">삭제</button>
								</p>
								<br> <label>내용</label>

								<table name='medicineTable' id='medicineTable'>
									<thead>
										<th>약종류</th>
										<th>약이름</th>
										<th>1회 투약량</th>
										<th>1회 투약횟수</th>
										<th>총 투약일수</th>
									</thead>
									<tbody name="my-tbody" id="my-tbody"></tbody>
								</table>
							</div>
							<div>
								<br> <label for="pres">소견</label>
								<p>
									<textarea id="note" name="note" id="note" cols="90" rows="5"> </textarea>
								</p>
							</div>
							<p align=right>
								<button type ="summit" class="btn btn-success">등록하기</button>
							<div class="patientMsg"></div>
						</form>
					</div>
				</div>
				<!-- /.row -->
			</div>
		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
 
</body>

</html>
