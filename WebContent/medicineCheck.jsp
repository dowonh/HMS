<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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

	<div id="page-wrapper">

		<div class="container-fluid">

			<!-- Page Heading -->
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						��� ��ȸ <small>���� �� ��ȸ</small>
					</h1>
					<ol class="breadcrumb">
						<li class="active">�������ڿ� ��ó�� ����� �����մϴ�.</li>
					</ol>
				</div>
			</div>
			<!-- /.row -->


			<div class="contanier">
				<h4>��ó�� ��ȸ</h4>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>��ȣ</th>
							<th>ó�� ��¥</th>
							<th>�̸�</th>
							<th>�����</th>
							<th>�ǻ�</th>
							<th>��</th>
							<th>1ȸ ������</th>
							<th>1ȸ ����Ƚ��</th>
							<th>�� �����ϼ�</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>2017-06-03</td>
							<td>������</td>
							<td>�����1</td>
							<td>�ǻ�1</td>
							<td>�Ϻ���ݽ÷�</td>
							<td>1.5</td>
							<td>2</td>
							<td>3</td>
						</tr>
					</tbody>
				</table>
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
					<h5 class="modal-title" id="exampleModalLabel">���� ����</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<div class="container">
						<form>
							<div class="form-group row">
								<label for="inputEmail3" class="col-sm-2 col-form-label">�ǻ�
									����</label>
								<div class="col-sm-10">
									<select>
										<option>������</option>
										<option>������</option>
										<option>�㵵��</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="example-date-input" class="col-2 col-form-label">����
									��¥ ����</label>
								<div class="col-10">
									<input class="form-control" type="date" value="2017-05-16"
										id="example-date-input">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-time-input" class="col-2 col-form-label">����
									�ð� ����</label>
								<div class="col-10">
									<input class="form-control" type="time" value="13:45:00"
										id="example-time-input">
								</div>
							</div>

							<div class="form-group row">
								<div class="offset-sm-2 col-sm-10">
									<button type="submit" class="btn btn-primary">�����ϱ�</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
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
