
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
	integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
	integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
	integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
	crossorigin="anonymous"></script>

<title>증명서 발급</title>

<!-- Custom Fonts -->
<link href="../fn/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- Javascript Includes -->

<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

</head>

<style>
container, div.p-2 {
	border: 1px solid black;
	style="height:100%"
}
</style>

<body>

	<%
	
	int indoorID = Integer.parseInt(request.getParameter("indoorID"));
	String indoorStart = request.getParameter("indoorStart");
	String indoorEnd = request.getParameter("indoorEnd");
	String patientName = request.getParameter("patientName");
	String patientBirth = request.getParameter("patientBirth");
	String noteDay = request.getParameter("noteDay");
	String categoty = request.getParameter("categoty");
	String doctorName = request.getParameter("doctorName");
	
	%>

	<div class="container mt-5 mb-5 pt-4 pb-5">
		<h1 class=text-center>입퇴원 확인서</h1>
		<div class="d-flex flex-column mt-5">
			<div class="d-flex flex-row">
				<div class="p-2 w-25 h-100">발급번호</div>
				<div class="p-2 w-100 h-100"><%=indoorID%></div>
			</div>
			<div class="d-flex flex-row">
				<div class="p-2 w-25">입원일자</div>
				<div class="p-2 w-25"><%=indoorStart%></div>
				<div class="p-2 w-25">퇴원일자</div>
				<div class="p-2 w-25"><%=indoorEnd%></div>
			</div>
			<div class="d-flex flex-row">
				<div class="p-2 w-25">신청인</div>
				<div class="d-flex flex-column w-75">
					<div class="d-flex flex-row">
						<div class="p-2 w-25">환자명</div>
						<div class="p-2 w-75"><%=patientName%></div>
					</div>
					<div class="d-flex flex-row">
						<div class="p-2 w-25">생년월일</div>
						<div class="p-2 w-75"><%=patientBirth%></div>
					</div>
				</div>
			</div>
			<div class="d-flex flex-row">
				<div class="p-2 w-100 text-center">입원내용</div>
			</div>
			<div class="d-flex flex-row">
				<div class="d-flex flex-column w-50">
					<div class="p-2 text-center">진료일자</div>
					<div class="p-2 text-center"><%=noteDay%></div>
				</div>
				<div class="d-flex flex-column w-50">
					<div class="p-2 text-center">진료과</div>
					<div class="p-2 text-center"><%=categoty%></div>
				</div>
				<div class="d-flex flex-column w-50">
					<div class="p-2 text-center">의사명</div>
					<div class="p-2 text-center"><%=doctorName%></div>
				</div>
			</div>
			<div class="d-flex flex-row" style="height:300px">
				<div class="p-2 w-100">
					<div class="p-5 w-100 text-center align-self-center">위와 같이 입·퇴원을 확인함.</div>
					<div class="p-5 w-100 text-center align-self-center">전북대학교 병원</div>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="../js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min.js"></script>
	<script src="./js/patientDisplay.js"></script>

</body>

</html>