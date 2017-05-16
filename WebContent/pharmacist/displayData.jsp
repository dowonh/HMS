<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="hmsControllers.*"  %>
    <%@ page import="hmsModels.*"  %>
    <%@ page import="java.util.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../css/jquery.dataTables.min.css" />
<link href="../css/dataTables.bootstrap.min.css" />
<link href="../css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
<link href="../css/style.css" />
<link href="../css/bootstrap-dialog.css" rel="stylesheet" />

<script src="../js/jquery.dataTables.min.js"></script>
<script src="../js/dataTables.bootstrap.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/bootbox.min.js"></script>
<script src="../js/bootstrap-dialog.js"></script>
<script src="js/script.js"></script>

<style>
	.dataTables_filter{
		float: right;
	}
	.modal-content {
    	width: 300px;
	}
	.col-lg-6{
		padding: 5px;
	}
	.modal-body {
		height: 300px;
	}
	.modal-dialog{
		width: 300px;
	}
	.bootstrap-dialog .modal-body{
		height: 50px;
	}
</style>
</head>
<body>
<div id="page-content-wrapper">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#medicines">Medicines</a></li>
			<li><a data-toggle="tab" href="#prescriptions">All Prescriptions</a></li>
		</ul>
		
		<div class="tab-content">
			<%@ include file="displayMedicines.jsp" %>
			<%@ include file="displayPrescriptions.jsp" %>
		</div>
</div>
</body>
</html>