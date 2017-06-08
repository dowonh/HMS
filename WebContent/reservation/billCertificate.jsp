<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>증명서 발급</title>

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
<style>
input#register-input.form-control {
	width: inherit !important;
}
</style>

</head>

<body>

	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">

			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="../index.jsp"> HMS </a></li>

				<li><a href="./reservation.jsp"><i class="fa fa-glide-g"
						aria-hidden="true"></i> 예약 안내</a></li>
				<li class="active"><a href="./reservationCheck.jsp"><i
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
							증명서 발급 <small>납입증명서</small>
						</h1>
						<ol class="breadcrumb">
                            <li class="active">
                                	각종 증명서를 발급받을 수 있습니다.
                            </li>
                        </ol>
					</div>
				</div>
				<!-- /.row -->

				<div class="container">
					<div class="col-lg-6 col-md-6">

						<div class="container">
							<form method="post" action="../Process?action=Certificate" id="BillCertificateForm">
								<div class="row">
									<div class="form-group row">
										<label for="name-input" class="col-2 col-form-label">이름</label>
										<div class="col-6">
											<input class="form-control" type="text" id="register-input"
												name="name">
										</div>
									</div>

									<div class="form-group row">
										<label for="phone-input" class="col-2 col-form-label">전화번호
											('-' 없이 입력해 주세요.)</label>
										<div class="col-6">
											<input class="form-control" type="text" id="register-input"
												name="phone">
										</div>
									</div>
									<div class="form-group row">
										<div class="offset-2 col-10" style="margin-left: auto;">
											<button type="submit" class="btn btn-primary">
												납입증명서 발급 <i class="fa fa-arrow-circle-right"></i>
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
						
						<div class="contanier">
							<h4>납입증명서 조회</h4>
							<table class="table table-bordered" id="tblBillCertificate">
								<thead>
									<tr>
										<th>환자등록번호</th>
										<th>환자명</th>
										<th>진료일자</th>
										<th>납입일자</th>
										<th>수납금액</th>
										<th>프린트</th>
									</tr>
								</thead>
								<tbody id="billCertificateBody">
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- container -->

			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#sidebar-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="../js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min.js"></script>
	<script src="./js/patientDisplay.js"></script>
	<script src="../js/dataTables.bootstrap.min.js"></script>
	<script src="../js/jquery.dataTables.min.js"></script>
</body>

</html>

