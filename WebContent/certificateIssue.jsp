<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �� ��ȸ</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="css/plugins/morris.css" rel="stylesheet">

<link href="css/nycss.css" rel="stylesheet">
<script src="js/nyjs.js"></script>

<!-- Custom Fonts -->
<link href="fn/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
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
							������ �߱�
						</h1>
						<ol class="breadcrumb">
                            <li class="active">
                                	���� �������� �߱޹��� �� �ֽ��ϴ�.
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
									����� ������ �߱�
								</h3>
							</div>
							<div class="panel-body">
								�����Ȯ�μ�
								<div class="text-right">
									<a href="indoorCheck.jsp">����� ������ �߱� <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 offset-lg-1">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									���������� �߱�
								</h3>
							</div>
							<div class="panel-body">
								����� ����������
								<div class="text-right">
									<a href="medicineCheck.jsp">���������� �߱� <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									���ܼ� �߱�
								</h3>
							</div>
							<div class="panel-body">
								���ܼ�
								<div class="text-right">
									<a href="medicineCheck.jsp">���ܼ� �߱� <i
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