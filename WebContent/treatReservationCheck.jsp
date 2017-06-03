<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>진료예약 조회</title>

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

	<%
		request.setCharacterEncoding("euc-kr");
	
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
	%>

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
			<!-- /.row -->
			
			<div class="contanier">
			<h4>진료예약 내역</h4>
				<p>예약 취소가 가능합니다.</p>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>번호</th>
							<th>예약 날짜</th>
							<th>이름</th>
							<th>진료과</th>
							<th>의사</th>
							<th>예약 시간</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>2017-06-03</td>
							<td><%=name %></td>
							<td>진료과1</td>
							<td>의사1</td>
							<td>13:50</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- /#page-wrapper -->




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