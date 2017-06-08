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

<body>

	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">

			<ul class="sidebar-nav">
				<li class="sidebar-brand">
                    <a href="../index.jsp">
                        HMS
                    </a>
                </li>
	
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
							증명서 발급
						</h1>
						<ol class="breadcrumb">
                            <li class="active">
                                	각종 증명서를 발급받을 수 있습니다.
                            </li>
                        </ol>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-3">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									입퇴원 증명서 발급
								</h3>
							</div>
							<div class="panel-body">
								입퇴원확인서
								<div class="text-right">
									<a href="./doorCertificate.jsp">입퇴원 증명서 발급 <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 offset-lg-1">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									납입증명서 발급
								</h3>
							</div>
							<div class="panel-body">
								진료비 납입증명서
								<div class="text-right">
									<a href="./billCertificate.jsp">납입증명서 발급 <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									진단서 발급
								</h3>
							</div>
							<div class="panel-body">
								진단서
								<div class="text-right">
									<a href="./noteCertificate.jsp">진단서 발급 <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>
					</div>		
				</div>
				<!-- /.row -->
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

</body>

</html>