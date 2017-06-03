<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<link href="fn/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->



<script type="text/javascript">
function getList(val) {
	  if(val=="1") {
	   num = new Array("----의사 선택----", "의사1","의사2","의사3");
	   vnum = new Array("----의사 선택----", "1","2","3");
	  }
	  else if(val=="2") {
		   num = new Array("----의사 선택----", "의사4","의사5","의사6");
		   vnum = new Array("----의사 선택----", "4","5","6");
		}
	  else if(val=="3") {
		   num = new Array("----의사 선택----", "의사7","의사8","의사9");
		   vnum = new Array("----의사 선택----", "7","8","9");
		  }
	  //두번째에 들은 셀렉트 박스 초기화
	  for(i=0; i<form.doctor.length; i++) {
	   form.doctor.options[i] = null;
	  }
	
	   //두번째값 넣어주기(Option함수 이용)
	   for(i=0; i<num.length; i++) {
	   form.doctor.options[i] = new Option(num[i],vnum[i]);
	  }
	 }
</script>


</head>

<body>

	<jsp:include page="reservationMenu.jsp"></jsp:include>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							예약 안내 <small>예약 및 조회</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->
				<div class="container">
					처음 오신 분 빠른 예약
					<ul>
						<li>전화번호를 남시기면, 상담원이 예약을 도와드립니다.</li>
						<li>상담시간 평일 08:30 ~ 17:30 토요일 08:30 ~ 12:30 (공휴일 제외)</li>
					</ul>
					인터넷 예약
					<ul>
						<li>진료과, 질병명으로 예약을 하실 수 있습니다. <!-- Button trigger modal -->
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#registerModal">진료 예약 <i
										class="fa fa-arrow-circle-right"></i></button>
						</li>
						<li>회원 / 비회원 예약이 가능합니다.</li>
					</ul>
					전화 예약
					<ul>
						<li>1111-1004 (365일 24시간 예약 가능)</li>
					</ul>
					전화 예약
					<ul>
						<li>병원에 내원하셔서 예약하실 수 있습니다.</li>
					</ul>
				</div>
			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->


	<!-- Modal -->
	<div class="modal fade bd-example-modal-lg" id="registerModal"
		tabindex="-1" role="dialog" aria-labelledby="registerModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">진료 예약</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<div class="container">
						<form method="post" action="ProcessReservation.jsp" name='form'>
							<div class="form-group row">
								<label for="example-date-input" class="col-2 col-form-label">이름</label>
								<div class="col-6">
									<input class="form-control" type="text"
										id="register-input" name="name">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-date-input" class="col-2 col-form-label">전화번호 ('-' 없이 입력해 주세요.)</label>
								<div class="col-6">
									<input class="form-control" type="text"
										id="register-input" name="phone">
								</div>
							</div>
							<br>
							<div class="form-group row">
								<label for="inputEmail3" class="col-2 col-form-label">진료과 선택</label>
								<div class="col-10">
									<select name="department" id="department" onchange="getList(value)">
									<option value="default">----진료과 선택----</option>
									<% for(int i=1; i<=3; i++){%>
										<option value="<%=i%>">진료과<%=i%></option>
									<% } %>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputEmail3" class="col-2 col-form-label">의사
									선택</label>
								<div class="col-10">
									<select name="doctor" id="doctor">
										<option value="default">----의사 선택----</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="example-date-input" class="col-2 col-form-label">예약
									날짜 선택</label>
								<div class="col-6">
									<input class="form-control" type="date" value="2017-05-16"
										id="register-input" name="reservation_date">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-time-input" class="col-2 col-form-label">예약
									시간 선택</label>
								<div class="col-6">
									<input class="form-control" type="time" value="13:45:00"
										id="register-input" name="reservation_time">
								</div>
							</div>

							<div class="form-group row">
								<div class="offset-sm-2 col-sm-10" style="margin-left:auto;">
									<button type="submit" class="btn btn-primary">예약하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>



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
