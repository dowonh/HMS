<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Nurse</title>
</head>
<body>
<div id="medicine" class="tab-pane fade in">
	<h3>의료 물품</h3>
	<table class="table table-hover table-bordered" id="tblmedicine">
		<thead>
			<tr>
				<th>
					번호
				</th>
				<th>
					의료물품 이름
				</th>
				<th>
					가격
				</th>
				<th>
					수량
				</th>
			</tr>
		</thead>
		<tbody id="medicineBody"> </tbody>
	</table>
	<div class="medicineMsg"></div>
</div>
</body>
</html>