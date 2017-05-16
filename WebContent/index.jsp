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
    <style>
    	<style>
	.carousel-inner>.item>a>img, .carousel-inner>.item>img{
		width:100%;
		height:600px;
	}
	.carousel-inner{
		top:90px;
	}
	.navbar-nav{
		float:right;
	}
	#hmsNav{
		width: 100%;
	}
	
	.modal-dialog{
		width: 350px;
	}

	table, td, th, tr{
	text-align: center;
	border:1px solid #FFFFFF;
	padding:10px;
	background-color: #B2CCFF;
	}
	td{
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
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Hospital Management System</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a class="page-scroll" href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#about">About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#services">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                    <li><a href="#" data-toggle="modal" data-target="#login-modal">Employee Login</a></li>
					<li><a href="#" data-toggle="modal" data-target="#signup-modal">Patient Registration</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

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
                    <h1>의료진 소개</h1><br>
<!--                    <h2 class="section-heading"> **병원 </h2>
                    <h3 class="section-subheading text-muted"> **병원 </h3>
-->                    
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                     <img src="https://search.pstatic.net/common?type=o&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201512%2F20151215162434651.jpg" alt="">
                    </span>
                    <h4 class="service-heading">이정현</h4></h4></h4>
                    <p class="text-muted">병원장</p>
                    <h6> 전북대학교 의과대학 졸업 <br>
                    	  전북대학교 의과대학 대학원 의학석사 및 의학박사<br>
                    	  예수병원 정형외과 전공의과정 수료<br>
                    	  미국(얼바인)UCI 연구교수<br>
						  서울삼성병원 전임의<br>
						  국군광주병원 정형외과 과장<br>
						  대자인병원 정형외과 전문의<br>
                    	</h6>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
					<img src="https://search.pstatic.net/common?type=o&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201608%2F20160811111632473.jpg" alt="">

                    </span>
                    <h4 class="service-heading">정나영</h4>
                    <p class="text-muted">부원장</p>
                    <h6> 인제대학교 의과대학 졸업<br>
						  울산대학교 의과대학 대학원 의학 석사<br>
						  서울 아산병원 인턴 수료<br>
						  서울 아산병원 마취통증의학과 전공의 과정 수료<br>
						  서울 아산병원 마취통증의학과 전문의 취득<br>
						  서울아산병원 통증 고위자과정 수료 및 전임의 역임<br>
						  대한 마취통증의학회 정회원<br>
                    	</h6>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
					<img src="https://search.pstatic.net/common?type=o&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201602%2F20160218190236477-4829744.jpg" alt="">
                    </span>
                    <h4 class="service-heading">허도원</h4>
                    <p class="text-muted">정형외과 전문의</p>                    
                    <h6> 전북대학교 의과대학 졸업 <br>
                    	  전북대학병원 인턴과정 수료<br>
                    	  전북대학병원 정형외과 전공의 과정 수료<br>
                    	  전북대학병원 정형외과 전문의 취득<br>
						  전북대학병원 정형외과 미세수부전임의 수료<br>
						  전북대학병원 정형외과 견관절, 주관절 전임의<br>
						  전북대학교 의과전문대학원 석사<br>
                    	</h6>
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
    <section id="services" class="services-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Time Table</h1>
						<table align="center" border="0" cellspacing="0" cellpadding="0" class="time_table">
							<tbody>
							<colgroup>
							<col>
							<col style="background-color:#999999">
							</colgroup>
								<tr>
									<th width="140px" style="font-size:16px">정형외과</th>
									<th width="95px">월</th>
									<th width="95px">화</th>
									<th width="95px">수</th>
									<th width="95px">목</th>
									<th width="95px">금</th>
									<th width="95px">토</th>
				
								</tr>
								<tr>
									<td rowspan="6" class="division">정형외과 오전<br>( 09:00: ~ 12:30 )</td>
									<td>이정현</td>
									<td class="piano">이정현</td>
									<td>이정현</td>
									<td class="piano">장선웅</td>
									<td>이정현</td>
									<td class="piano" style="border-right:1px solid #cacaca">송광훈</td>
								</tr>
								<tr>
									<td>김호세</td>
									<td class="piano">장선웅</td>
									<td>김호세</td>
									<td class="piano">송광훈</td>
									<td>김호세</td>
									<td class="piano" style="border-right:1px solid #cacaca">장선웅</td>
								</tr>
								<tr>
									<td>허도원</td>
									<td class="piano">봉황세</td>
									<td>봉황세</td>
									<td class="piano">허도원</td>
									<td>허도원</td>
									<td class="piano" style="border-right:1px solid #cacaca">허도원</td>
								</tr>
								<tr>
									<td>정나영</td>
									<td class="piano">정나영</td>
									<td>정나영</td>
									<td class="piano"></td>
									<td>정나영</td>
									<td class="piano" style="border-right:1px solid #cacaca">봉황세</td>
								</tr>
								<tr>
									<td></td>
									<td class="piano"></td>
									<td></td>
									<td class="piano"></td>
									<td></td>
									<td class="piano" style="border-right:1px solid #cacaca">김호세</td>
								</tr>
								<tr>
									<td></td>
									<td class="piano"></td>
									<td></td>
									<td class="piano"></td>
									<td></td>
									<td class="piano" style="border-right:1px solid #cacaca">정나영</td>
								</tr>
								<tr>
									<td colspan="7" class="">점심시간 ( 13:30 ~ 14:30 )</td>
								</tr>
								<tr>
									<td rowspan="4" class="division">정형외과 오후<br>( 13:30 ~ 18:00 )</td>
									<td>장선웅</td>
									<td class="piano">김호세</td>
									<td>장선웅</td>
									<td class="piano">김호세</td>
									<td>장선웅</td>
									<td class="piano" style="border-right:1px solid #cacaca"></td>
								</tr>
								<tr>
									<td>송광훈</td>
									<td class="piano">송광훈</td>
									<td>허도원</td>
									<td class="piano">봉황세</td>
									<td>송광훈</td>
									<td class="piano" style="border-right:1px solid #cacaca"></td>
								</tr>
								<tr>
									<td>봉황세</td>
									<td class="piano">허도원</td>
									<td>정나영</td>
									<td class="piano">정나영</td>
									<td>봉황세</td>
									<td class="piano" style="border-right:1px solid #cacaca"></td>
								</tr>
							</tbody>
						</table>
		
                    
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="contact-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Contact Section</h1>
                    
                </div>
            </div>
        </div>
    </section>

<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
  	  <div class="modal-dialog">
		<div class="loginmodal-container">
			<h1>Login to Your Account</h1><br>
		  <form method="POST" action="login.jsp">
			<input type="text" name="user" placeholder="Username" required>
			<input type="password" name="pass" placeholder="Password" required>
			<input type="submit" name="login" class="login loginmodal-submit" value="Login">
		  </form>
		</div>
	</div>
</div>

<div class="modal fade" id="signup-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
  	  <div class="modal-dialog">
		<div class="signupmodal-container">
			<h1>Patient Registration</h1><br>
		  <form id="signupform" method="POST" action="Process?action=addPatient">
			<input type="text" name="fullname" placeholder="Full Name" required>
			<label>Select Category</label>
			<select name="catid"></select>
			<input type="text" name="dob" placeholder="Date of Birth" readonly class="dob" />
			<div class="radio">
				<label><input type="radio" name="gender" value="male" required/> Male</label>
				<label><input type="radio" name="gender" value="female"/> Female</label>
			</div>
			<input type="submit" name="signup" class="signup signupmodal-submit" value="Register">
		  </form>
		</div>
	</div>
</div>
<script src="js/script.js"></script>
</body>
</html>
