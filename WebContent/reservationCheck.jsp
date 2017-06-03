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

<title>예약 및 조회</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="css/plugins/morris.css" rel="stylesheet">

<link href="css/nycss.css" rel="stylesheet">
<script src="js/nyjs.js"></script>

<!-- Custom Fonts -->
<link href="fn/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<jsp:include page="reservationMenu.jsp"></jsp:include>

	<div id="page-wrapper">

		<div class="container-fluid">

			<!-- Page Heading -->
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						예약 조회 <small>예약 및 조회</small>
					</h1>
					<ol class="breadcrumb">
						<li class="active">예약한 내역과 일정을 볼 수 있습니다.</li>
					</ol>
				</div>
			</div>


			<div class="container">
				<div class="col-lg-6 col-md-6">

					<div class="col-3">
						<i class="fa fa-calendar-check-o fa-5x"></i>
					</div>
					<div class="col-9 text-center">
						<div><mark>진료예약 조회 : 본인진료예약 및 대리예약 조회가능</mark></div>
					</div>

					<div class="container">
						<form method="post" action="treatReservationCheck.jsp">
							<div class="row">
								<div class="form-group row">
									<label for="name-input" class="col-2 col-form-label">이름</label>
									<div class="col-6">
										<input class="form-control" type="text" id="register-input" name="name">
									</div>
								</div>

								<div class="form-group row">
									<label for="phone-input" class="col-2 col-form-label">전화번호 ('-' 없이 입력해 주세요.)</label>
									<div class="col-6">
										<input class="form-control" type="text" id="register-input" name="phone">
									</div>
								</div>
								<div class="form-group row">
									<div class="offset-2 col-10" style="margin-left:auto;">
										<button type="submit" class="btn btn-primary">진료예약 조회 <i
										class="fa fa-arrow-circle-right"></i></button>
									</div>
								</div>
							</div>
							
						</form>
					</div>
				</div>
			</div>

			<!-- /.row -->

		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->





	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="js/plugins/morris/raphael.min.js"></script>
	<script src="js/plugins/morris/morris.min.js"></script>
	<script src="js/plugins/morris/morris-data.js"></script>

</body>

</html>
