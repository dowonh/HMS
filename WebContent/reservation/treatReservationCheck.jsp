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

	<%
		request.setCharacterEncoding("euc-kr");
	
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
	%>

	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">

			<ul class="sidebar-nav">
				<li class="sidebar-brand">
                    <a href="index.jsp">
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
		<!-- /#sidebar-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="../js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min.js"></script>

</body>

</html>