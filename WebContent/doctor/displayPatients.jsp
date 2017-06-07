<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>예약 및 조회</title>
<style>
/* #viewPresModal div.modal-body {
	height: 200px;
}

#viewPresModal div.modal-content {
	width: 400px;
}

#viewPresModal .modal-dialog, #viewPresModal .modal-content {
	width: 200px;
}

#presAddForm .modal-body {
	height: 200px;
} */

table {
	border-collapse: collapse;
	width: 650px;
}

th, td {
	border: 1px solid gray;
	width: 500px;
	height: 50px;
}
</style>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="css/plugins/morris.css" rel="stylesheet">

<link href="css/nycss.css" rel="stylesheet">
<script src="js/nyjs.js"></script>

<!-- Custom Fonts -->
<link href="font-awesome-4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="page-wrapper">

		<div class="container-fluid">

			<!-- Page Heading -->
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">

						Patients List

					</h1>
					<ol class="breadcrumb">
						<li class="active"><i class="fa fa-dashboard"></i>
						당일 예약된 환자의 목록입니다.
						</li>
					</ol>
				</div>
			</div>

			<div>
				<div class="row form group">
					<div class="col-lg-6">
						<div class="panel panel-default">

							<div class="panel-body">

								<div class="container col-lg-12">
									<div class="form-group">
										<label for="exampleSelect2">환자 리스트</label>
										<table class="table table-hover table-bordered"
											id="displayPatients">
											<thead>
												<tr>
												<th>pid</th>
													
													<th>Full Name</th>
													<th>Date of Birth</th>
													<th>Gender</th>
													<th>Reservation Day</th>
													<th>Reservation Time</th>
												</tr>
											</thead>
											<tbody id="patientBody">
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<form id="myform" name="myform">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-clock-o fa-fw"></i> patient detail
									</h3>
								</div>
								<div class="panel-body">
								Full Name :  <input type="text" id="fullname" value="" /><br>
								Birth : <input type="text" id="birth" value="" /> <br>
								Gender : <input type="text" id="gender" value="" /> <br> 								
								Reservation day : <input type="text" id="rday" value="" /><br>
								Reservation time : <input type="text" id="rtime" value="" /><br>
								Phone : <input type="text" id="phone" value="" /><br>
				
								Door : <input type="text" id="door" value="" /><br>
								Door start day : <input type="text" id="doorstart" value="" /><br>
								Door end day : <input type="text" id="doorend" value="" /><br>
								Room : <input type="text" id="room" value="" /><br>
								
									<!-- <div class="list-group">
										<a class="list-group-item"> 
										<span class="badge">just now</span> 
												Name </a> 
											
										<a href="#" class="list-group-item"> <span class="badge">4
												minutes ago</span> <i class="fa fa-fw fa-comment"></i> Commented on
											a post
										</a> <a href="#" class="list-group-item"> <span class="badge">23
												minutes ago</span> <i class="fa fa-fw fa-truck"></i> Order 392
											shipped
										</a> <a href="#" class="list-group-item"> <span class="badge">46
												minutes ago</span> <i class="fa fa-fw fa-money"></i> Invoice 653
											has been paid
										</a> <a href="#" class="list-group-item"> <span class="badge">1
												hour ago</span> <i class="fa fa-fw fa-user"></i> A new user has
											been added
										</a> <a href="#" class="list-group-item"> <span class="badge">2
												hours ago</span> <i class="fa fa-fw fa-check"></i> Completed task:
											"pick up dry cleaning"
										</a> <a href="#" class="list-group-item"> <span class="badge">yesterday</span>
											<i class="fa fa-fw fa-globe"></i> Saved the world
										</a> <a href="#" class="list-group-item"> <span class="badge">two
												days ago</span> <i class="fa fa-fw fa-check"></i> Completed task:
											"fix error on sales page"
										</a>
									</div> -->
									
								</div>
							</div>

							
							<div>
							<label >증상</label> 
								<input type="text" class="form-control" placeholder="Note" />
							</div>
							<br>
							<div>
								<label for="medicineselect">약 처방</label> 
								<select
									class="form-control" id="typeselect" name="typeselect">
									<option value="typeselect">Medicine Type</option>
									

								</select> <select class="form-control" id="nameselect" name="nameselect">
									<option value="nameselect">Medicine Name</option>
									
								</select>
								
								<p align=right>
								<br>
									<label> 1회 투약량 : <input type=text id=amount size=5></label>
									&nbsp <label> 1회 투약횟수 : <input type=text id=number
										size=5></label>&nbsp <label> 총 투약일수 : <input type=text
										id=count size=5></label> &nbsp <br>


									<!-- <button onclick="add_row()" id="addrow">선택</button>
					<button onclick="delete_row()" id="deleterow">삭제</button><br> -->
					<br>
									<button onclick="add_row()" type="button"
										class="btn ">추가</button>
									<button onclick="delete_row()" type="button"
										class="btn ">삭제</button>
								</p>
								<br> <label>Content</label>

								<table name='medicineTable' id='medicineTable'>
									<thead>
										<th>약종류</th>
										<th>약이름</th>
										<th>1회 투약량</th>
										<th>1회 투약횟수</th>
										<th>총 투약일수</th>
									</thead>
									<tbody id="my-tbody"></tbody>
								</table>
							</div>
							<div>
								<br> <label for="pres">Opinion</label>
								<p>
									<textarea id="pres" cols="90" rows="5"> </textarea>
								</p>
							</div>
							<p align=right>
								<button  class="btn btn-success">Add
									Prescription</button>
							<div class="patientMsg"></div>
						</form>
					</div>
				</div>
				<!-- /.row -->
			</div>
		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<script>
		function add_row() {

			var my_tbody = document.getElementById('my-tbody');
			// var row = my_tbody.insertRow(0); // 상단에 추가
			var row = my_tbody.insertRow(my_tbody.rows.length); // 하단에 추가
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);
			var cell4 = row.insertCell(3);
			var cell5 = row.insertCell(4);

			var nsel = document.getElementById("nameselect");
			var tsel = document.getElementById("typeselect");

			cell1.innerHTML = tsel.options[tsel.selectedIndex].value;
			cell2.innerHTML = nsel.options[nsel.selectedIndex].value;
			cell3.innerHTML = document.getElementById("amount").value;
			cell4.innerHTML = document.getElementById("number").value;
			cell5.innerHTML = document.getElementById("count").value;

		}

		function delete_row() {
			var my_tbody = document.getElementById('my-tbody');
			if (my_tbody.rows.length < 1)
				return;
			// my_tbody.deleteRow(0); // 상단부터 삭제
			my_tbody.deleteRow(my_tbody.rows.length - 1); // 하단부터 삭제
		}

		$('#medicineTable').dataTable({
			retrieve : true,
			searching : false,
			paging : false,
			bInfo : false
		//bFilter: false, bInfo: false
		});
		$('#medicineTable').find('tbody').empty();
		

		
	</script>

</body>

</html>
