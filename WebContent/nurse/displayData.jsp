<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/jquery.dataTables.min.css" />
<link href="../css/dataTables.bootstrap.min.css" />
<link href="../css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
<link href="../css/style.css" />
<script src="../js/jquery.dataTables.min.js"></script>
<script src="../js/dataTables.bootstrap.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/bootbox.min.js"></script>
<script src="js/nurseDisplay.js"></script>
<script src="../js/bootstrap-dialog.js"></script>

<style>
	.dataTables_filter{
		float: right;
	}
</style>
</head>
<body id="<%= session.getAttribute("pid") %>">
<div id="page-content-wrapper">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#rooms">입원실 관리</a></li>
			<li><a data-toggle="tab" href="#medicine">의료물품 관리</a></li>
			<li><a data-toggle="tab" href="#patients">My Patients</a></li>
		</ul>
		
		<div class="tab-content">
			<%@ include file="displayRooms.jsp" %>
			<%@ include file="displayMedicine.jsp" %>
			<%@ include file="displayPatients.jsp" %>
		</div>
</div>
</body>
</html>