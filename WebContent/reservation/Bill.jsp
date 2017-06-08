
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

<title>예약 및 조회</title>

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
		request.setCharacterEncoding("euc-kr");
	
		String pid = request.getParameter("pid");
		String patientName = request.getParameter("patientName");
		String noteDay = request.getParameter("noteDay");
		String billDate = request.getParameter("billDate");
		String billPrice = request.getParameter("billPrice");
		
	%>

	<div class="container mt-5 mb-5 pt-4 pb-5">
		<h1 class=text-center>납입증명서</h1>
		<div class="d-flex flex-column">
			<div class="d-flex flex-row">
				<div class="p-2 w-25">환자등록번호</div>
				<div class="p-2 w-25"><%=pid%></div>
				<div class="p-2 w-75">환자명</div>
				<div class="p-2 w-75"><%=patientName%></div>
			</div>
			<div class="d-flex flex-row">
				<div class="p-2 w-25">진료일자</div>
				<div class="p-2 w-25"><%=noteDay%></div>
				<div class="p-2 w-25">납입일자</div>
				<div class="p-2 w-25"><%=billDate %></div>
			</div>
			<div class="d-flex flex-row">
				<div class="p-2 w-25">수납내용</div>
				<div class="d-flex flex-column w-75">
					<div class="d-flex flex-row">
						<div class="p-2 w-25">수납금액</div>
						<div class="p-2 w-75"><%=billPrice %></div>
					</div>
					<div class="d-flex flex-row">
						<div class="p-2 w-25">수납방법</div>
						<div class="p-2 w-75">현금</div>
					</div>
				</div>
			</div>
			
			<div class="d-flex flex-row" style="height:300px;">
				<div class="p-2 w-100">
					<div class="p-5 w-100 text-center align-self-center">신청인 (인)</div>
					<div class="p-5 w-100 text-center align-self-center"><%=billDate %></div>
				</div>
			</div>
			<div class="d-flex flex-row" style="height:300px">
				<div class="p-2 w-100">
					<div class="p-5 w-100 text-center align-self-center">위와 같이 의료비를 납입하였음을 증명합니다.</div>
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