<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

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
	<link href="css/simple-sidebar.css" rel="stylesheet">
	
	<!-- Custom Fonts -->
	<link href="fn/css/font-awesome.min.css" rel="stylesheet"
		type="text/css">
	
	<!-- Javascript Includes -->
	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>

<body>

	<div id="wrapper">
		<!-- Navigation 
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display 
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">HMS</a>
			</div>
		</nav> 
		-->
		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand">
                    <a href="#">
                        	예약 및 조회
                    </a>
                </li>
                <li>
                    <a href="reservationMenu.jsp?page=reservation"><i
						class="fa fa-glide-g" aria-hidden="true"></i> 예약 안내</a>
                </li>
                <li>
                    <a href="reservationMenu.jsp?page=reservationCheck"><i
						class="fa fa-list-alt" aria-hidden="true"></i> 예약 조회</a>
                </li>
                <li>
                    <a href="reservationMenu.jsp?page=resultCheck"><i
                    	class="fa fa-paperclip" aria-hidden="true"></i> 결과 조회</a>
                </li>
                <li>
                    <a href="reservationMenu.jsp?page=certificateIssue"><i
                     class="fa fa-print" aria-hidden="true"></i> 증명서 발급</a>
                </li>           
             </ul>
		</div>
		<!-- /#sidebar-wrapper -->
	</div>
	<!-- /#wrapper -->
	
	<!-- Page Content -->
	<%
		if (request.getParameter("page") == null || request.getParameter("page").equals("reservation")) {
	%>
	<div id="page-content-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					 <%@ include file="reservation.jsp"%> 
				</div>
			</div>
		</div>
	</div>
	<%
		} else if (request.getParameter("page").equals("reservationCheck")) {
	%>
	<div id="page-content-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1>Room & Duties</h1>
					 <%@ include file="reservationCheck.jsp" %>
				</div>
			</div>
		</div>
	</div>
	<%
		} else if (request.getParameter("page").equals("resultCheck")) {
	%>
	<div id="page-content-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1>Room & Duties</h1>
					 <%@ include file="resultCheck.jsp"%>
				</div>
			</div>
		</div>
	</div>
	<%
		} else if (request.getParameter("page").equals("certificateIssue")) {
	%>
	<div id="page-content-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1>Room & Duties</h1>
					 <%@ include file="certificateIssue.jsp"%>
				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>
 
	
 
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>


	<script type="text/javascript">
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});

		function getList(val) {
			if (val == "1") {
				num = new Array("----의사 선택----", "의사1", "의사2", "의사3");
				vnum = new Array("----의사 선택----", "1", "2", "3");
			} else if (val == "2") {
				num = new Array("----의사 선택----", "의사4", "의사5", "의사6");
				vnum = new Array("----의사 선택----", "4", "5", "6");
			} else if (val == "3") {
				num = new Array("----의사 선택----", "의사7", "의사8", "의사9");
				vnum = new Array("----의사 선택----", "7", "8", "9");
			}
			//두번째에 들은 셀렉트 박스 초기화
			for (i = 0; i < form.doctor.length; i++) {
				form.doctor.options[i] = null;
			}

			//두번째값 넣어주기(Option함수 이용)
			for (i = 0; i < num.length; i++) {
				form.doctor.options[i] = new Option(num[i], vnum[i]);
			}
		}
	</script>
</body>

</html>