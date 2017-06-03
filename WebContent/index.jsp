<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>Hospital Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

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
.carousel-inner>.item>a>img, .carousel-inner>.item>img {
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
	width: 650px;
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

.btn-light {
	border-radius: 0;
	color: #333;
	background-color: rgb(255, 255, 255);
}

.btn {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px;
}

table, td, th, tr {
	text-align: center;
	border: 1px solid #FFFFFF;
	padding: 10px;
	background-color: #B2CCFF;
}

td {
	background-color: #E1E1E1;
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
				<!--
				<li><a href="#" data-toggle="modal" data-target="#signup-modal">Patient
						Registration</a></li>
						-->
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

	<!-- 의료진 소개 -->
	<section id="about" class="about-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1>의료진 소개</h1>
				
				<br>
				<!--    <h2 class="section-heading"> **병원 </h2>
                    <h3 class="section-subheading text-muted"> **병원 </h3>
				-->
			</div>
		</div>
		
		<div class="row text-center">
			<div class="col-md-4">
				<span class="fa-stack fa-4x"> <img
					src="http://activeorthoweb.com/wp-content/uploads/knee-icon2.png"
					alt="" width="200" height="200">
				</span>
				<h4 class="service-heading">정형외과</h4>

				<p class="text-muted"> orthopedics </p>

				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#o_Modal">자세히보기 </button>

<!-- Modal -->
<div class="modal fade bd-example-modal-lg" id="o_Modal" tabindex="-1" role="dialog" aria-labelledby="o_ModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel"> 정형외과(orthopedics) </h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
				<img src="http://www.soo119.co.kr/common/images/content/sub01/doctor_01.jpg"
					alt="" width="130" height="170" align="left">
					
								<h4>이정현</h4>
								 전북대학교 의과대학 졸업 <br>
								 전북대학교 의과대학 대학원 의학석사 및 의학박사<br>
								 국립중앙의료원 인턴 수료<br>
								 국립중앙의료원 정형외과 전공의 수료<br>
								 국립중앙의료원 정형외과 전문의 취득<br>
								 인제의대 상계백병원 전임의 역임<br>
																<br><br>

								<img
									src="http://www.soo119.co.kr/common/images/content/sub01/doctor_19.jpg"
									alt="" width="130" height="170" align="left">
									<h4>홍길동</h4>
									 전북대학교 의과대학 졸업 <br>
									 전북대학교 의과대학 대학원 의학석사 및 의학박사<br>
									 전북대학병원 정형외과 전공의 과정 수료<br>
									 전북대학병원 정형외과 전문의 취득<br>
									 전북대학병원 정형외과 미세수부전임의 수료<br>
      <div class="container">

	</div>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>

			</div>

			<div class="col-md-4">
				<span class="fa-stack fa-4x"> <img
					src="http://icons.iconarchive.com/icons/graphicloads/medical-health/256/heart-beat-icon.png"
					alt="" width="200" height="200">

				</span>
				<h4 class="service-heading">흉부외과</h4>
				<p class="text-muted"> thoracic and cardiovascular surgery </p>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#t_Modal">자세히보기 </button>

<!-- Modal -->
<div class="modal fade bd-example-modal-lg" id="t_Modal" tabindex="-1" role="dialog" aria-labelledby="t_ModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel"> 흉부외과(thoracic and cardiovascular surgery) </h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
				<img src="http://www.soo119.co.kr/common/images/content/sub01/doctor_06.jpg"
					alt="" width="130" height="170" align="left">
					
								<h4>김동현</h4>
								 서울대학교 의과대학 졸업 <br>
								 서울대학교 의과대학 대학원 의학석사 및 의학박사<br>
								 국립중앙의료원 인턴 수료<br>
								 영국 세인트마크 병원 연수<br>
								 대한 외과학회 정회원<br>
								  전 군산항도외과 원장 역임<br>
																<br><br>

								<img
									src="http://www.soo119.co.kr/common/images/content/sub01/doctor_21.jpg"
									alt="" width="130" height="170" align="left">
									<h4>황민호</h4>
									 서울카톨릭대 성모병원 수련의 <br>
									 서울원자력병원 내과 전공의 수료 및 외과 전문의 취득<br>
									 전북대학병원 흉부외과 전공의 과정 수료<br>
									 전북대학병원 흉부외과 전문의 취득<br>
									 전북대학병원 흉부외과 미세수부전임의 수료<br>
      <div class="container">

	</div>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
			</div>
			<div class="col-md-4">
				<span class="fa-stack fa-4x"> <img
					src="http://www.sevenhillsdiagnostics.com/images/services/radiology.png"
					alt=""width="200" height="200">
				</span>
				<h4 class="service-heading">영상의학과</h4>
				<p class="text-muted"> radiology </p>
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#h_Modal">자세히보기 </button>

<!-- Modal -->
<div class="modal fade bd-example-modal-lg" id="h_Modal" tabindex="-1" role="dialog" aria-labelledby="h_ModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel"> 영상의학과(radiology) </h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" > &times;</span>
        </button> </div>
      <div class="modal-body">
				<img src="http://www.soo119.co.kr/common/images/content/sub01/doctor_17.jpg"
					alt="" width="130" height="170" align="left">
					
								<h4>최상용</h4>
								 전북대학교 의과대학 졸업 <br>
								 영상의학과 전문의 자격증 취득<br>
								 전북대학교병원 영상의학과 전공의 수료<br>
								 전북대학교 의과대학 전임강사<br>
								대한근골격영상의학회 고시이사<br>
								 대한근골격영상의학회 수련이사<br>
																<br><br>

								<img
									src="http://www.soo119.co.kr/common/images/content/sub01/doctor_15.jpg"
									alt="" width="130" height="170" align="left">
									<h4>강창식</h4>
									 전남대학교 의과대학 졸업 <br>
									 전남대학교 의과대학 대학원 의학석사 및 의학박사<br>
									 대한영상의학회 기획위원<br>
									 대한초음파영상의학회 편집위원<br>
									대한영상의학회 편집위원<br>
      <div class="container">

	</div>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
			</div>
			<!--
                <div class="row">
				  <div class="col-sm-6 col-md-4">
				    <div class="thumbnail">
				      <img src="https://search.pstatic.net/common?type=o&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201512%2F20151215162434651.jpg" alt="">
				      <div class="caption">
				        <h3>허도원</h3>
				        <p class="text-muted">부원장</p>
				        <p>...</p>
				        <p><a href="#" class="btn btn-primary" role="button">자세히보기</a></p>
				      </div>
				    </div>
				  </div>
				</div>
  		-->
		</div>
	</div>
	</section>

	<!-- Services Section -->
	<!--
	<section id="services" class="services-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1>Time Table</h1>
				<table align="center" border="0" cellspacing="0" cellpadding="0"
					class="time_table">
					<tbody>
					<colgroup>
						<col>
						<col style="background-color: #999999">
					</colgroup>
					<tr>
						<th width="140px" style="font-size: 16px">정형외과</th>
						<th width="95px">월</th>
						<th width="95px">화</th>
						<th width="95px">수</th>
						<th width="95px">목</th>
						<th width="95px">금</th>
						<th width="95px">토</th>

					</tr>
					<tr>
						<td rowspan="6" class="division">정형외과 오전<br>( 09:00: ~
							12:30 )
						</td>
						<td>이정현</td>
						<td class="piano">이정현</td>
						<td>이정현</td>
						<td class="piano">장선웅</td>
						<td>이정현</td>
						<td class="piano" style="border-right: 1px solid #cacaca">송광훈</td>
					</tr>
					<tr>
						<td>김호세</td>
						<td class="piano">장선웅</td>
						<td>김호세</td>
						<td class="piano">송광훈</td>
						<td>김호세</td>
						<td class="piano" style="border-right: 1px solid #cacaca">장선웅</td>
					</tr>
					<tr>
						<td>허도원</td>
						<td class="piano">봉황세</td>
						<td>봉황세</td>
						<td class="piano">허도원</td>
						<td>허도원</td>
						<td class="piano" style="border-right: 1px solid #cacaca">허도원</td>
					</tr>
					<tr>
						<td>정나영</td>
						<td class="piano">정나영</td>
						<td>정나영</td>
						<td class="piano"></td>
						<td>정나영</td>
						<td class="piano" style="border-right: 1px solid #cacaca">봉황세</td>
					</tr>
					<tr>
						<td></td>
						<td class="piano"></td>
						<td></td>
						<td class="piano"></td>
						<td></td>
						<td class="piano" style="border-right: 1px solid #cacaca">김호세</td>
					</tr>
					<tr>
						<td></td>
						<td class="piano"></td>
						<td></td>
						<td class="piano"></td>
						<td></td>
						<td class="piano" style="border-right: 1px solid #cacaca">정나영</td>
					</tr>
					<tr>
						<td colspan="7" class="">점심시간 ( 13:30 ~ 14:30 )</td>
					</tr>
					<tr>
						<td rowspan="4" class="division">정형외과 오후<br>( 13:30 ~
							18:00 )
						</td>
						<td>장선웅</td>
						<td class="piano">김호세</td>
						<td>장선웅</td>
						<td class="piano">김호세</td>
						<td>장선웅</td>
						<td class="piano" style="border-right: 1px solid #cacaca"></td>
					</tr>
					<tr>
						<td>송광훈</td>
						<td class="piano">송광훈</td>
						<td>허도원</td>
						<td class="piano">봉황세</td>
						<td>송광훈</td>
						<td class="piano" style="border-right: 1px solid #cacaca"></td>
					</tr>
					<tr>
						<td>봉황세</td>
						<td class="piano">허도원</td>
						<td>정나영</td>
						<td class="piano">정나영</td>
						<td>봉황세</td>
						<td class="piano" style="border-right: 1px solid #cacaca"></td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</section>
	-->
	<!-- Services Section -->
	<section id="services" class="services-section">
	<div class="container">
		<div class="row text-center">
			<div class="col-lg-10 col-lg-offset-1">
				<h2>예약 및 조회</h2>
				<hr class="small">
				<div class="row">
					<div class="col-md-3 col-sm-6">
						<div class="service-item">
							<span class="glyphicon glyphicon-calendar"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-cloud fa-stack-1x text-primary"></i>
							</span>
							<h4>
								<strong>예약 안내</strong>
							</h4>
							<a href="register.html" class="btn btn-primary">Learn More</a>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="service-item">
							<span class="glyphicon glyphicon-folder-open fa-4x"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-compass fa-stack-1x text-primary"></i>
							</span>
							<h4>
								<strong>예약 조회</strong>
							</h4>
							<a href="#" class="btn btn-primary">Learn More</a>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="service-item">
							<span class="glyphicon glyphicon-hourglass fa-4x"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-flask fa-stack-1x text-primary"></i>
							</span>
							<h4>
								<strong>결과 조회</strong>
							</h4>
							<a href="#" class="btn btn-primary">Learn More</a>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="service-item">
							<span class="glyphicon glyphicon-print fa-4x"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-shield fa-stack-1x text-primary"></i>
							</span>
							<h4>
								<strong>증명서 발급</strong>
							</h4>
							<a href="#" class="btn btn-primary">Learn More</a>
						</div>
					</div>
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
	 <!-- 
		<div class="modal fade" id="signup-modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<div class="signupmodal-container">
					<h1>Patient Registration</h1>
					<br>
					<form id="signupform" method="POST"
						action="Process?action=addPatient">
						<input type="text" name="fullname" placeholder="Full Name"
							required> <label>Select Category</label> <select
							name="catid"></select> <input type="text" name="dob"
							placeholder="Date of Birth" readonly class="dob" />
						<div class="radio">
							<label><input type="radio" name="gender" value="male"
								required /> Male</label> <label><input type="radio"
								name="gender" value="female" /> Female</label>
						</div>
						-->
						<input type="submit" name="signup"
							class="signup signupmodal-submit" value="Register">
					</form>
					
				</div>
			</div>
		</div>
		 -->


		</section>

		<script src="js/script.js"></script>
 
</body>
</html>
