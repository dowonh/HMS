<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>Hospital Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-dialog.css" rel="stylesheet" />
<link href="css/scrolling-nav.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/scrolling-nav.css" rel="stylesheet">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-dialog.js"></script>
<script src="js/jquery.easing.min.js"></script>
<script src="js/scrolling-nav.js"></script>
<script
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDOi6BaSUunHr6Ffx4S5oGVHLFiy3icuis"></script>
<script>
	function initialize() {
		var Y_point = 35.846031; // Y좌표
		var X_point = 127.134410; // X좌표
		var myLatlng = new google.maps.LatLng(Y_point, X_point);
		var markerTitle = "병원"; // 마커에 마우스 오버했을 때 나타나는 title

		var mapProp = {
			center : myLatlng,
			zoom : 17,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("googleMap"),
				mapProp);

		var marker = new google.maps.Marker({
			position : myLatlng,
			map : map,
			title : markerTitle
		});
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
<style>
<
style>.carousel-inner>.item>a>img, .carousel-inner>.item>img {
	width: 100%;
	height: 600px;
}

.carousel-inner {
	top: 90px;
}

.navbar-nav {
	float: right;
}

#hmsNav {
	width: 100%;
}

.modal-dialog {
	width: 350px;
}
.road table th {
    background-color: #FDB714;
    color: #FFF;
    font-size: 18px;
    text-align: center;
}
.road table th, .road table td {
    border-bottom: 3px solid #FFF;
    padding: 10px 15px;
}
.road table td {
    background-color: #eff1ef;
    font-size: 14px;
}
.road table {
    width: 100%;
    border-collapse: collapse;
}
</style>
</head>
<body id="page-top">
	<!-- <nav class="navbar navbar-default" role=navigation>
	<div class="navbar-header">
		<a href="#" class="navbar-brand">Hospital Management System</a>
	</div>
	<ul class="nav navbar-nav navbar-right">
		<li class="active"><a href="#">Home</a></li>
		<li><a href="#module">Modules</a></li>
		<li><a href="#about">About</a></li>
		<li><a href="#" data-toggle="modal" data-target="#login-modal">Employee Login</a></li>
		<li><a href="#" data-toggle="modal" data-target="#signup-modal">Patient Registration</a></li>
	</ul>
</nav> -->

	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header page-scroll">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand page-scroll" href="#page-top">Hospital
				Management System</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<!-- Hidden li included to remove active class from about link when scrolled up past about section -->
				<li class="hidden"><a class="page-scroll" href="#page-top"></a>
				</li>
				<li><a class="page-scroll" href="#about">About</a></li>
				<li><a class="page-scroll" href="#services">Services</a></li>
				<li><a class="page-scroll" href="#contact">Contact</a></li>
				<li><a href="#" data-toggle="modal" data-target="#login-modal">Employee
						Login</a></li>
				<li><a href="#" data-toggle="modal" data-target="#signup-modal">Patient
						Registration</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
		</ol>

		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="img/slide1.jpg" />
			</div>

			<div class="item">
				<img src="img/slide2.jpg" />
			</div>

			<div class="item">
				<img src="img/slide3.jpg" />
			</div>
			<div class="item">
				<img src="img/slide4.jpg" />
			</div>
			<div class="item">
				<img src="img/slide5.jpg" />
			</div>
		</div>
	</div>

	<!-- About Section -->
	<section id="about" class="about-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1>About Section</h1>
			</div>
		</div>
	</div>
	</section>

	<!-- Services Section -->
	<section id="services" class="services-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1>Services Section</h1>
			</div>
		</div>
	</div>
	</section>

	<!-- 오시는길  -->
	<section id="contact" class="contact-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1>오시는 길</h1>
				<div id="googleMap" style="width: 100%; height: 380px;"></div>
				<div class="road">
					<table>
						<tbody>
							<tr>
								<th>지역</th>
								<th>거리</th>
								<th>내용</th>
							</tr>
							<tr>
								<td class="tb_center">호남<br>고속도로
								</td>
								<td class="tb_center">8.2km(전주 I.C 부터)</td>
								<td>전주 톨게이트 (우회전)<i class="xi-arrow-right"></i>호남제일문 통과<i
									class="xi-arrow-right"></i>팔달로<i class="xi-arrow-right"></i><br>공설운동장
									네거리 (좌회전)<i class="xi-arrow-right"></i>전북은행 본점<i
									class="xi-arrow-right"></i>전북대학교
								</td>
							</tr>
							<tr>
								<td class="tb_center">대전-통영<br>고속도로
								</td>
								<td class="tb_center">50km(장수 I.C 부터)</td>
								<td>장수 톨게이트 (우회전)<i class="xi-arrow-right"></i>장계에서 진안/전주
									방향 (좌회전)<i class="xi-arrow-right"></i><br>26번 국도<i
									class="xi-arrow-right"></i>전주역 (좌회전)<i class="xi-arrow-right"></i>명주골
									네거리 (우회전)<i class="xi-arrow-right"></i>전북대학교
								</td>
							</tr>
							<tr>
								<td class="tb_center">익산-포항<br>고속도로
								</td>
								<td class="tb_center">10km(완주 I.C 부터)</td>
								<td>완주 톨게이트 (우회전)<i class="xi-arrow-right"></i>17번 국도<i
									class="xi-arrow-right"></i>자동차등록사무소 앞,남원/진안 방면 (좌회전)<i
									class="xi-arrow-right"></i><br>호성동 네거리 (우회전)<i
									class="xi-arrow-right"></i>명주골 네거리 (우회전)<i
									class="xi-arrow-right"></i>전북대학교
								</td>
							</tr>
							<tr>
								<td class="tb_center">서해안<br>고속도로
								</td>
								<td class="tb_center">31.2km(동군산 I.C 부터)</td>
								<td>동군산 톨게이트 (전주방향)<i class="xi-arrow-right"></i>전주·군산간
									산업도로<i class="xi-arrow-right"></i>호남제일문<i
									class="xi-arrow-right"></i><br>팔달로<i
									class="xi-arrow-right"></i>공설운동장 네거리 (좌회전)<i
									class="xi-arrow-right"></i>전북은행 본점<i class="xi-arrow-right"></i>전북대학교
								</td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>
	</section>

	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="loginmodal-container">
				<h1>Login to Your Account</h1>
				<br>
				<form method="POST" action="login.jsp">
					<input type="text" name="user" placeholder="Username" required>
					<input type="password" name="pass" placeholder="Password" required>
					<input type="submit" name="login" class="login loginmodal-submit"
						value="Login">
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade" id="signup-modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="signupmodal-container">
				<h1>Patient Registration</h1>
				<br>
				<form id="signupform" method="POST"
					action="Process?action=addPatient">
					<input type="text" name="fullname" placeholder="Full Name" required>
					<label>Select Category</label> <select name="catid"></select> <input
						type="text" name="dob" placeholder="Date of Birth" readonly
						class="dob" />
					<div class="radio">
						<label><input type="radio" name="gender" value="male"
							required /> Male</label> <label><input type="radio" name="gender"
							value="female" /> Female</label>
					</div>
					<input type="submit" name="signup"
						class="signup signupmodal-submit" value="Register">
				</form>
			</div>
		</div>
	</div>
	<script src="js/script.js"></script>
</body>
</html>
