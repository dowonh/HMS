<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>인터넷 예약</title>
</head>
<body>
인터넷 예약이셈
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
</body>
</html>