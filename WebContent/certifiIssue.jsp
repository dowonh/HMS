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

	<jsp:include page="registerMenu.jsp"></jsp:include>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
 
							DOCTOR<small>예약 및 조회</small>
 							환자 리스트
 
						</h1>
						<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i>예약한 내역과 일정을 볼 수 있습니다.
                            </li>
                        </ol>
					</div>
				</div>
				<div class="container">
  <h3>Vertical Pills</h3>
  <div class="row">
    <div class="col-md-3">
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div class="col-md-3"> 
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div class="col-md-3"> 
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    <div class="col-md-3">
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">Menu 1</a></li>
        <li><a href="#">Menu 2</a></li>
        <li><a href="#">Menu 3</a></li>
      </ul>
    </div>
    <div class="clearfix visible-lg"></div>
  </div>
</div>
				
				<!-- /.row -->
				

				<form>
			
				
				<div class="row form group">
					<div class="col-lg-6">
						<div class="panel panel-default">
							
							<div class="panel-body">
							
								<div class="container col-lg-12">
								<div class="form-group">
							    <label for="exampleSelect2">환자 리스트</label>
							    <select multiple class="form-control" id="exampleSelect2">
							      <option>1</option>
							      <option>2</option>
							      <option>3</option>
							      <option>4</option>
							      <option>5</option>
							    </select>
							  </div>
							  </div>
							  
							  <div class="container col-lg-12">
							  <div class="form-group">
							   <%for(int i=1; i<=24; i++){ %>
								<div class="col-lg-3 col-md-6">
										<div class="form-check form-check-inline">
										  <label class="form-check-label">
										    <input class="form-check-input" type="checkbox" id="inlineCheckbox<%=i%>" value="option<%=i%>">
										  약</label>
										</div>
								</div>
								<% }%>
								</div>
							  </div>
							  
							  <div class="container col-lg-12">
							  <div class="form-group">
							    <label for="exampleTextarea">병명</label>
							    <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
							  </div>
							  </div>
							  
							  
							  <div class="container col-lg-12">
							  <div class="form-group">
							    <label for="exampleTextarea">소견</label>
							    <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
							  </div>
							  </div>
							  
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-clock-o fa-fw"></i> Tasks Panel
								</h3>
							</div>
							<div class="panel-body">
								<div class="list-group">
									<a href="#" class="list-group-item"> <span class="badge">just
											now</span> <i class="fa fa-fw fa-calendar"></i> Calendar updated
									</a> <a href="#" class="list-group-item"> <span class="badge">4
											minutes ago</span> <i class="fa fa-fw fa-comment"></i> Commented on
										a post
									</a> <a href="#" class="list-group-item"> <span class="badge">23
											minutes ago</span> <i class="fa fa-fw fa-truck"></i> Order 392
										shipped
									</a> <a href="#" class="list-group-item"> <span class="badge">46
											minutes ago</span> <i class="fa fa-fw fa-money"></i> Invoice 653 has
										been paid
									</a> <a href="#" class="list-group-item"> <span class="badge">1
											hour ago</span> <i class="fa fa-fw fa-user"></i> A new user has been
										added
									</a> <a href="#" class="list-group-item"> <span class="badge">2
											hours ago</span> <i class="fa fa-fw fa-check"></i> Completed task:
										"pick up dry cleaning"
									</a> <a href="#" class="list-group-item"> <span class="badge">yesterday</span>
										<i class="fa fa-fw fa-globe"></i> Saved the world
									</a> <a href="#" class="list-group-item"> <span class="badge">two
											days ago</span> <i class="fa fa-fw fa-check"></i> Completed task:
										"fix error on sales page"
									</a>
								</div>
								<div class="text-right">
									<a href="#">View All Activity <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>
					</div>
					
				</div>
				<!-- /.row -->
				</form>
			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->



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
